//
//  TexturedTriangle.m
//  OpenGL
//
//  Created by David Stover on Sat May 29 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import "TexturedTriangle.h"
#import <OpenGL/gl.h>


@implementation TexturedTriangle

-(id)initWithVertices:(Vertex*)V1:(Vertex*)V2:(Vertex*)V3
{
    self = [super initWithVertices:V1:V2:V3];
    
    return self;
}

- (void) setTexCoords:(float) _t1_a: (float) _t1_b: (float) _t2_a: (float) _t2_b:
        (float) _t3_a: (float) _t3_b
{
    t1_a = _t1_a;
    t1_b = _t1_b;
    t2_a = _t2_a;
    t2_b = _t2_b;
    t3_a = _t3_a;
    t3_b = _t3_b;
}

// Must be called from OpenGL thread between glBegin and glEnd
-(void)draw
{
    glColor3f(red, green, blue);
    glNormal3f([_normal X], [_normal Y], [_normal Z]);
    glTexCoord2f(t1_a, t1_b);
    glVertex3f([v1 getX], [v1 getY], [v1 getZ]);
    glTexCoord2f(t2_a, t2_b);
    glVertex3f([v2 getX], [v2 getY], [v2 getZ]);
    glTexCoord2f(t3_a, t3_b);
    glVertex3f([v3 getX], [v3 getY], [v3 getZ]);
}

@end
