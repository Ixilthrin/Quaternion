/*
 *  MathLib.h
 *  OpenGL
 *
 *  Created by David Stover on Sat Aug 14 2004.
 *  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
 *
 */

#ifndef __MATHLIB_H__
#define __MATHLIB_H__

#import <Cocoa/Cocoa.h>

#define PI 3.1415926535897932384626433832795f
#define DEG_TO_RAD PI/180.0f
#define RAD_TO_DEG 180.0f/PI

class Vector3 {
public:
    float x;
    float y;
    float z;
    Vector3();
    Vector3(float _x, float _y, float _z);
    float length();
    void normalize();
    float dot(Vector3 *v);
    Vector3 *cross(Vector3 *v);
    void rotate(Vector3 *axis, float degrees);
    void print();
};

class Quaternion {
public:
    float c;
    float i;
    float j;
    float k;
    Quaternion();
    Quaternion(float _c, float _i, float _j, float _k);
    Quaternion operator*(Quaternion q);
    Quaternion operator+(Quaternion q);
    Quaternion conjugate();
};

class Math {
public:
    static void test();
};

#endif
