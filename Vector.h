//
//  Vector.h
//  OpenGL
//
//  Created by David Stover on Sat Nov 22 2003.
//  Copyright (c) 2003 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Vertex;

@interface Vector : NSObject {
    float _x;
    float _y;
    float _z;
}
- (id) initWith: (Vertex *) h;
- (id) init: (float) x: (float) y: (float) z;
- (float) X;
- (float) Y;
- (float) Z;
- (float) dot: (Vector *) v;
- (Vector *) cross: (Vector *) v;
- (Vector *) asUnit;
- (Vector *) rotateAbout: (Vector *) v: (float) degrees; 

@end
