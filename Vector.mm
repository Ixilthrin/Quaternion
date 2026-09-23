//
//  Vector.m
//  OpenGL
//
//  Created by David Stover on Sat Nov 22 2003.
//  Copyright (c) 2003 __MyCompanyName__. All rights reserved.
//

#import "Vector.h"
#import "Matrix3.h"
#import "Vertex.h"

@implementation Vector
- (id) initWith: (Vertex*) h
{
    self = [super init];
    _x = [h getX];
    _y = [h getY];
    _z = [h getZ];
    return self;
}

- (id) init: (float) x: (float) y: (float) z
{
    self = [super init];
    
    _x = x;
    _y = y;
    _z = z;
    
    return self;
}

- (float) X
{
    return _x;
}

- (float) Y
{
    return _y;
}

- (float) Z
{
    return _z;
}

- (float) dot: (Vector*) v
{
    return _x * [v X] + _y * [v Y] + _z * [v Z];
}

- (Vector*) cross: (Vector*) v
{
    float i = _y * [v Z] - [v Y] * _z;
    float j = -1.0 * (_x * [v Z] - [v X] * _z);
    float k = _x * [v Y] - [v X] * _y;
    Vector *result = [[Vector alloc] init:i:j:k];
    return result;
}

- (Vector *) asUnit
{
    float length = _x* _x + _y * _y + _z * _z;
    length = sqrt(length);
    if (length == 0.0) {
        // throw exception
        length = 1.0;
    }
    float x = _x / length;
    float y = _y / length;
    float z = _z / length;
    Vector *newUnit = [[Vector alloc] init:x:y:z];
    return newUnit;
}

- (Vector *) rotateAbout: (Vector *) v: (float) degrees
{
    Vector *r = [v asUnit];
    float x, y, z, temp;
    x = [r X];
    y = [r Y];
    z = [r Z];
    
    if (abs((int) x) <= abs((int) y) && abs((int) x) <= abs((int) z)) {
        x = 0;
        temp = y;
        y = -z;
        z = temp;
    } else if (abs((int) y) <= abs((int) x) && abs((int) y) <= abs((int) z)) {
        temp = x;
        x = -z;
        y = 0;
        z = temp;
    } else {
        temp = x;
        x = -y;
        y = temp;
        z = 0;
    }
    
    Vector *s = [[Vector alloc] init:x:y:z];
    s = [s asUnit];
    Vector *t = [r cross:s];
    
    Matrix3 *M = [[Matrix3 alloc] init:[r X]:[r Y]:[r Z]:[s X]:[s Y]:[s Z]:[t X]:[t Y]:[t Z]];
    
    Matrix3 *Mt = [M transpose];
    
    Matrix3 *R = [Matrix3 getXAxisRotationMatrix:degrees];
    
    Matrix3 *final = [Mt multiplyByMatrix:R];
    final = [final multiplyByMatrix:M];
    
    Vector *result = [final multiplyByVector:self];
    
    return result;
}

@end
