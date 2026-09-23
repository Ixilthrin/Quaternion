//
//  Matrix3.h
//  OpenGL
//
//  Created by David Stover on Mon Aug 09 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Vector;

@interface Matrix3 : NSObject {
    float _a11;
    float _a12;
    float _a13;
    float _a21;
    float _a22;
    float _a23;
    float _a31;
    float _a32;
    float _a33;
}

- (id) init:(float) a11: (float) a12: (float) a13:
(float) a21: (float) a22: (float) a23:
(float) a31: (float) a32: (float) a33;

- (float) A11;
- (float) A12;
- (float) A13;
- (float) A21;
- (float) A22;
- (float) A23;
- (float) A31;
- (float) A32;
- (float) A33;

- (Matrix3 *) multiplyByMatrix: (Matrix3 *) matrix;
- (Vector *) multiplyByVector: (Vector *) vector;
- (Matrix3 *) transpose;
+ (Matrix3 *) getXAxisRotationMatrix: (float) angle;

@end
