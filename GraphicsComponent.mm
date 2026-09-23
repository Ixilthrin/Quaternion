//
//  GraphicsComponent.m
//  OpenGL
//
//  Created by David Stover on Sun Oct 26 2003.
//  Copyright (c) 2003 __MyCompanyName__. All rights reserved.
//

#import "GraphicsComponent.h"
#import <OpenGL/gl.h>

@implementation GraphicsComponent

- (id) init
{
    material = [[Material alloc] initWithDefaults];
    
    triangleCount = 0;
    pointCount = 0;
    
    // A negative value indicates no texture.
    textureID = -1;
    
    [super init];
    
    return self;
}

- (id) initWithMaterial: (Material *) m
{
    [super init];
    
    triangleCount = 0;
    pointCount = 0;
    
    material = m;
    
    return self;
}

- (int) getTriangleCount
{
    return triangleCount;
}

- (int) getPointCount
{
    return pointCount;
}

- (int) getLineCount
{
    return lineCount;
}

- (void) setTriangleCount:(int)count
{
    triangleCount = count;
    triangles = (Triangle **) malloc(count * sizeof(Triangle*));
}

- (void) setPointCount:(int)count
{
    pointCount = count;
    points = (SinglePoint **) malloc(count * sizeof(Point *));
}

- (void) setLineCount:(int)count
{
    lineCount = count;
    lines = (GraphicsLine **) malloc(count * sizeof(GraphicsLine *));
}


- (void) setTriangle:(int)index:(Triangle*)triangle
{
    triangles[index] = triangle;
}

- (void) setPoint: (int) index: (SinglePoint *) point
{
    points[index] = point;
}

- (void) setLine: (int) index: (GraphicsLine *) line
{
    lines[index] = line;
}

- (Triangle*) getTriangle:(int)index
{
    return triangles[index];
}

- (SinglePoint *) getPoint:(int)index
{
    return points[index];
}

- (GraphicsLine *) getLine:(int)index
{
    return lines[index];
}

- (void) drawTriangles
{
    if (triangleCount < 1) {
        return;
    }
    if (textureID >= 0) {
        glEnable(GL_TEXTURE_2D);
        glBindTexture(GL_TEXTURE_2D, (GLuint) textureID);
        glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
    }
    [material set];
    int index = 0;
    for ( ; index < triangleCount; ++index) {
        glBegin(GL_TRIANGLES);
        [triangles[index] draw];
        glEnd();
    }
    if (textureID >= 0) {
        glDisable(GL_TEXTURE_2D);
    }
}

- (void) drawLines
{
    if (lineCount < 1) {
        return;
    }
    int index = 0;
    for ( ; index < lineCount; ++index) {
        glBegin(GL_LINES);
        [lines[index] draw];
        glEnd();
    }
}

- (void) drawPoints
{
    if (pointCount < 1) {
        return;
    }
    int index = 0;
    for ( ; index < pointCount; ++index) {
        glBegin(GL_POINTS);
        [points[index] draw];
        glEnd();
    }
}


- (void) setTextureID: (unsigned int) id
{
    textureID = id;
}
@end
