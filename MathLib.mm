/*
 *  MathLib.mm
 *  OpenGL
 *
 *  Created by David Stover on Sat Aug 14 2004.
 *  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
 *
 */

#include "MathLib.h"

#include "math.h"
#include <stdio.h>

Vector3::Vector3()
    : x(0), y(0), z(0)
{}

Vector3::Vector3(float _x, float _y, float _z)
    : x(_x), y(_y), z(_z)
{
}

float Vector3::length()
{
    return sqrt(x * x + y * y + z * z);
}

void Vector3::normalize()
{
    float l = length();
    if (!(l < 0) && !(l > 0)) {
        return;
    }
    x = x / l;
    y = y / l;
    z = z / l;
    return;
}

float Vector3::dot(Vector3 *v)
{
    return x * v->x + y * v->y + z * v->z;
}

Vector3 *Vector3::cross(Vector3 *v) 
{
    float i = y * v->z - v->y * z;
    float j = -1.0 * (x * v->z - v->x * z);
    float k = x * v->y - v->x * y;
    return new Vector3(i, j, k);
}

void Vector3::rotate(Vector3 *axis, float degrees) 
{
    float radians = degrees * DEG_TO_RAD;
    float s = cos(.5 * radians);
    Vector3 n(axis->x, axis->y, axis->z);
    n.normalize();
    float t = sin(.5 * radians);
    Vector3 v(t * n.x, t * n.y, t * n.z);
    Quaternion q(s, v.x, v.y, v.z);
    Quaternion q_conj = q.conjugate();
    Quaternion p(0, x, y, z);
    Quaternion result = q * p * q_conj;
    x = result.i;
    y = result.j;
    z = result.k;
    return;
}

void Vector3::print() 
{
    printf("[ %f, %f, %f ]\n", x, y, z);
}

Quaternion::Quaternion()
    : c(0), i(0), j(0), k(0)
{}

Quaternion::Quaternion(float _c, float _i, float _j, float _k)
    : c(_c), i(_i), j(_j), k(_k)
{}

Quaternion Quaternion::operator*(Quaternion q)
{
    float c2 = c * q.c - i * q.i - j * q.j - k * q.k;
    float i2 = c * q.i + i * q.c + j * q.k - k * q.j;
    float j2 = c * q.j - i * q.k + j * q.c + k * q.i;
    float k2 = c * q.k + i * q.j - j * q.i + k * q.c;
    return *(new Quaternion(c2, i2, j2, k2));
}

Quaternion Quaternion::operator+(Quaternion q)
{
    return *(new Quaternion(c * q.c, i * q.i, j * q.j, k * q.k));
}

Quaternion Quaternion::conjugate()
{
    return *(new Quaternion(c, -i, -j, -k));
}

void Math::test() 
{
    /*
    Vector3 v(1, 0, 0);
    printf("Start with the x-axis\n");
    v.print();

    Vector3 axis(0, 0, 1);
    printf("Rotate about the z-axis\n");

    printf("By 45 degrees:\n");
    Vector3 r1b = v.rotate(axis, 45);
    r1b.print();

    printf("By 90 degrees:\n");
    Vector3 r1 = r1b.rotate(axis, 45);
    r1.print();

    printf("By 180 degrees:\n");
    Vector3 r2 = v.rotate(axis, 180);
    r2.print();

    printf("By 270 degrees:\n");
    Vector3 r3 = v.rotate(axis, 270);
    r3.print();

    printf("By 360 degrees:\n");
    Vector3 r4 = v.rotate(axis, 360);
    r4.print();

    printf("By -90 degrees:\n");
    Vector3 r5 = v.rotate(axis, -90);
    r5.print();

    printf("Now try another vector:\n");
    Vector3 v2(1, 1, 0);
    v2.print();

    printf("Rotate it 45 degrees.\n");
    Vector3 r6 = v2.rotate(axis, 45);
    r6.print();
     */
}
