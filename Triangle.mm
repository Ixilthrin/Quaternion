//
//  Triangle.m
//  OpenGL
//
//  Created by David Stover on Sun Oct 26 2003.
//  Copyright (c) 2003 __MyCompanyName__. All rights reserved.
//

#import "Triangle.h"
#import <OpenGL/gl.h>
#import "math.h"

@implementation Triangle
-(id)initWithVertices:(Vertex*)V1:(Vertex*)V2:(Vertex*)V3
{
    self = [super init];
    v1 = V1;
    v2 = V2;
    v3 = V3;
    
    Vertex *head1 = [[Vertex alloc] initWithX:([v3 getX] - [v1 getX]):([v3 getY] - [v1 getY]):([v3 getZ] - [v1 getZ])];
    Vector *vector1 = [[Vector alloc] initWith:head1]; 
    Vertex *head2 = [[Vertex alloc] initWithX:([v2 getX] - [v1 getX]):([v2 getY] - [v1 getY]):([v2 getZ] - [v1 getZ])];
    Vector *vector2 = [[Vector alloc] initWith:head2];
    
    _normal = [vector1 cross:vector2];    
    
    
    // Let's normalize the normal vector.
    _normal = [_normal asUnit];
    
    [head1 release];
    [vector1 release];
    [head2 release];
    [vector2 release];

    return self;
}

-(void)setColor:(float)r:(float)g:(float)b
{
    red = r;
    green = g;
    blue = b;
}

// Must be called from OpenGL thread between glBegin and glEnd
-(void)draw
{
    glColor3f(red, green, blue);
    glNormal3f([_normal X], [_normal Y], [_normal Z]);
    glVertex3f([v1 getX], [v1 getY], [v1 getZ]);
    glVertex3f([v2 getX], [v2 getY], [v2 getZ]);
    glVertex3f([v3 getX], [v3 getY], [v3 getZ]);
}
@end
