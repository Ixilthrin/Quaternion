//
//  Line.m
//  OpenGL
//
//  Created by David Stover on Tue Oct 01 2004.
//  Copyright (c) 2004 Little Mountain Software. All rights reserved.
//

#import "GraphicsLine.h"
#import <OpenGL/gl.h>
#import "math.h"

@implementation GraphicsLine
-(id)initWithVertices:(Vertex*)V1:(Vertex*)V2
{
    self = [super init];
    
    v1 = V1;
    v2 = V2;
    
    return self;
}

-(void)setColor:(float)r:(float)g:(float)b
{
    red = r;
    green = g;
    blue = b;
}

-(void)draw
{
    glColor3f(red, green, blue);
    glVertex3f([v1 getX], [v1 getY], [v1 getZ]);
    glVertex3f([v2 getX], [v2 getY], [v2 getZ]);
}
@end
