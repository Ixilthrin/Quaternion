//
//  Matrix3.m
//  OpenGL
//
//  Created by David Stover on Mon Aug 09 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import "Matrix3.h"
#import "Vector.h"
#import "Vertex.h"
#import "MathLib.h"

@implementation Matrix3
- (id) init:(float) a11: (float) a12: (float) a13:
(float) a21: (float) a22: (float) a23:
(float) a31: (float) a32: (float) a33
{
    _a11 = a11;
    _a12 = a12;
    _a13 = a13;
    _a21 = a21;
    _a22 = a22;
    _a23 = a23;
    _a31 = a31;
    _a32 = a32;
    _a33 = a33;
    
    [super init];
    
    return self;
}

- (float) A11
{
    return _a11;
}

- (float) A12
{
    return _a12;
}

- (float) A13
{
    return _a13;
}

- (float) A21
{
    return _a21;
}

- (float) A22
{
    return _a22;
}

- (float) A23
{
    return _a23;
}

- (float) A31
{
    return _a31;
}

- (float) A32
{
    return _a32;
}

- (float) A33
{
    return _a33;
}

- (Matrix3 *) multiplyByMatrix: (Matrix3 *) matrix
{
    Matrix3 * o = matrix;
    float b11, b12, b13, b21, b22, b23, b31, b32, b33;
    
    b11 = _a11 * [o A11] + _a12 * [o A21] + _a13 * [o A31];
    b12 = _a11 * [o A12] + _a12 * [o A22] + _a13 * [o A32];
    b13 = _a11 * [o A13] + _a12 * [o A23] + _a13 * [o A33];
    
    b21 = _a21 * [o A11] + _a22 * [o A21] + _a23 * [o A31];
    b22 = _a21 * [o A12] + _a22 * [o A22] + _a23 * [o A32];
    b23 = _a21 * [o A13] + _a22 * [o A23] + _a23 * [o A33];
    
    b31 = _a31 * [o A11] + _a32 * [o A21] + _a33 * [o A31];
    b32 = _a31 * [o A12] + _a32 * [o A22] + _a33 * [o A32];
    b33 = _a31 * [o A13] + _a32 * [o A23] + _a33 * [o A33];
    
    Matrix3 * result = [[Matrix3 alloc] init:b11:b12:b13:b21:b22:b23:b31:b32:b33];
    
    return result;
}

- (Vector *) multiplyByVector: (Vector *) vector
{
    Vector * o = vector;
    float bx, by, bz;
    
    bx = _a11 * [o X] + _a12 * [o Y] + _a13 * [o Z];
    by = _a21 * [o X] + _a22 * [o Y] + _a23 * [o Z];
    bz = _a31 * [o X] + _a32 * [o Y] + _a33 * [o Z];
    
    Vector * v = [[Vector alloc] init:bx:by:bz];
    return v;
}

- (Matrix3 *) transpose
{
    Matrix3 *m = [[Matrix3 alloc] init:_a11:_a21:_a31:_a12:_a22:_a32:_a13:_a23:_a33];
    return m;
}

+ (Matrix3 *) getXAxisRotationMatrix: (float) angle
{
    float angle_rad = angle * DEG_TO_RAD;
    Matrix3 *R = [[Matrix3 alloc] init:1:0:0:0:cos(angle_rad):-sin(angle_rad):0:sin(angle_rad):cos(angle_rad)];
    return R;
}
@end
