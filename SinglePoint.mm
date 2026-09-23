//
//  SinglePoint.m
//  OpenGL
//
//  Created by David Stover on Tue Mar 02 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import "SinglePoint.h"
#import <OpenGL/gl.h>
#import "math.h"

@implementation SinglePoint
-(id)initWithVertex:(Vertex*)V
{
    self = [super init];
    v = V;
    
    /*Vertex *head1 = [[Vertex alloc] initWithX:([v3 getX] - [v1 getX]):([v3 getY] - [v1 getY]):([v3 getZ] - [v1 getZ])];
    Vector *vector1 = [[Vector alloc] initWith:head1]; 
    Vertex *head2 = [[Vertex alloc] initWithX:([v2 getX] - [v1 getX]):([v2 getY] - [v1 getY]):([v2 getZ] - [v1 getZ])];
    Vector *vector2 = [[Vector alloc] initWith:head2];
    
    _normal = [vector1 cross:vector2];    
    
    
    // Let's normalize the normal vector.
    Vertex *v = [_normal getHead];    
    
    float length = sqrt([v getX]*[v getX] + [v getY]*[v getY] + [v getZ]*[v getZ]);
    
    [v setX:[v getX]/length];
    [v setY:[v getY]/length];
    [v setZ:[v getZ]/length];
    
    [head1 release];
    [vector1 release];
    [head2 release];
    [vector2 release];*/
    
    return self;
}

-(void)setColor:(float)r:(float)g:(float)b
{
    red = r;
    green = g;
    blue = b;
}

- (void) setNormal: (Vector *) n
{
    _normal = n;
}

-(void)draw
{
    glColor3f(red, green, blue);
    //Vertex *head = [_normal getHead];
    //glNormal3f([head getX], [head getY], [head getZ]);
    glVertex3f([v getX], [v getY], [v getZ]);
}
@end
