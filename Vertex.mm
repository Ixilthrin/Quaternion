//
//  Vertex.m
//  OpenGL
//
//  Created by David Stover on Sun Oct 26 2003.
//  Copyright (c) 2003 __MyCompanyName__. All rights reserved.
//

#import "Vertex.h"

@implementation Vertex
- (id) initWithX: (float) X: (float) Y: (float) Z
{
    self = [super init];
    x = X;
    y = Y;
    z = Z;
    return self;
}

- (float) getX
{
    return x;
}

- (float) getY
{
    return y;
}

- (float) getZ
{
    return z;
}

- (void) setX: (float) _x
{
    x = _x;
}

- (void) setY: (float) _y
{
    y = _y;
}

- (void) setZ: (float) _z
{
    z = _z;
}

+ (Vertex *) midPoint: (Vertex *) v1: (Vertex *) v2
{
    
    float temp = 0.0f;
    float v1_x = [v1 getX];
    float v1_y = [v1 getY];
    float v1_z = [v1 getZ];
    float v2_x = [v2 getX];
    float v2_y = [v2 getY];
    float v2_z = [v2 getZ];
    
    if (v1_x > v2_x) {
        temp = v1_x;
        v1_x = v2_x;
        v2_x = temp;
    }
    if (v1_y > v2_y) {
        temp = v1_y;
        v1_y = v2_y;
        v2_y = temp;
    }
    if (v1_z > v2_z) {
        temp = v1_z;
        v1_z = v2_z;
        v2_x = temp;
    }
    
    float midX = v1_x + (v2_x - v1_x) / 2.0f;
    float midY = v1_y + (v2_y - v1_y) / 2.0f;
    float midZ = v1_z + (v2_z - v1_z) / 2.0f;
    
    return [[Vertex alloc] initWithX:midX:midY:midZ];
}

@end
