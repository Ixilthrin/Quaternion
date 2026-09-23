//
//  LineFont.m
//  OpenGL
//
//  Created by David Stover on Sat Oct 02 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import "LineFont.h"

#import "GraphicsComponent.h"
#import "GraphicsLine.h"
#import "Vertex.h"

@implementation LineFont

static GraphicsComponent *createLetter(float coords[], const int numVertices,
                                       int connects[], const int numLines)
{
    Vertex *v[numVertices];
    int i;
    int p;
    
    p = 0;
    for (i = 0; i < numVertices; ++i) {
        v[i] = [[Vertex alloc] initWithX:coords[p++]:coords[p++]:0.0f];
    }
    
    GraphicsLine *lines[numLines];
    
    p= 0;
    for (i = 0; i < numLines; ++i) {
        lines[i] = [[GraphicsLine alloc] 
            initWithVertices:v[connects[p++]]:v[connects[p++]]];
        [lines[i] setColor:0.0f:1.0f:0.0f];
    }   
    
    GraphicsComponent *component = [[GraphicsComponent alloc] init];
    [component setLineCount:numLines];
    for (i = 0; i < numLines; ++i) {
        [component setLine:i:lines[i]];
    }
    
    return component;
}

+ (GraphicsComponent *) A
{    
    Vertex *v1 = [[Vertex alloc] initWithX:0.0f:0.0f:0.0f];
    Vertex *v2 = [[Vertex alloc] initWithX:1.0f:3.0f:0.0f];
    Vertex *v3 = [[Vertex alloc] initWithX:2.0f:0.0f:0.0f];
    Vertex *v4 = [Vertex midPoint:v1:v2];
    Vertex *v5 = [Vertex midPoint:v2:v3];
    
    GraphicsLine *line1 = [[GraphicsLine alloc] initWithVertices:v1:v2];
    GraphicsLine *line2 = [[GraphicsLine alloc] initWithVertices:v2:v3];
    GraphicsLine *line3 = [[GraphicsLine alloc] initWithVertices:v4:v5];
    
    [line1 setColor:0.0f:1.0f:0.0f];
    [line2 setColor:0.0f:1.0f:0.0f];
    [line3 setColor:0.0f:1.0f:0.0f];   
    
    GraphicsComponent *component = [[GraphicsComponent alloc] init];
    [component setLineCount:3];
    [component setLine:0:line1];
    [component setLine:1:line2];
    [component setLine:2:line3];
    
    return component;
}

+ (GraphicsComponent *) B
{    
    float coords[] = {
        0.0f, 0.0f,
        0.0f, 3.0f,
        1.6f, 3.0f,
        2.0f, 2.6f,
        2.0f, 1.9f,
        1.6f, 1.5f,
        2.0f, 1.1f,
        2.0f, 0.4f,
        1.6f, 0.0f,
        0.0f, 1.5f
    };
    
    int connects[] = {
        0, 1,
        1, 2,
        2, 3,
        3, 4,
        4, 5,
        5, 6,
        6, 7,
        7, 8,
        8, 0,
        9, 5
    };
    
    return createLetter(coords, 10, connects, 10);
}

+ (GraphicsComponent *) C
{    
    Vertex *v1 = [[Vertex alloc] initWithX:0.0f:0.4f:0.0f];
    Vertex *v2 = [[Vertex alloc] initWithX:0.0f:2.6f:0.0f];
    Vertex *v3 = [[Vertex alloc] initWithX:0.4f:3.0f:0.0f];
    Vertex *v4 = [[Vertex alloc] initWithX:1.6f:3.0f:0.0f];
    Vertex *v5 = [[Vertex alloc] initWithX:2.0f:2.6f:0.0f];
    Vertex *v6 = [[Vertex alloc] initWithX:2.0f:0.4f:0.0f];
    Vertex *v7 = [[Vertex alloc] initWithX:1.6f:0.0f:0.0f];
    Vertex *v8 = [[Vertex alloc] initWithX:0.4f:0.0f:0.0f];
    
    GraphicsLine *line1 = [[GraphicsLine alloc] initWithVertices:v1:v2];
    GraphicsLine *line2 = [[GraphicsLine alloc] initWithVertices:v2:v3];
    GraphicsLine *line3 = [[GraphicsLine alloc] initWithVertices:v3:v4];
    GraphicsLine *line4 = [[GraphicsLine alloc] initWithVertices:v4:v5];
    GraphicsLine *line5 = [[GraphicsLine alloc] initWithVertices:v6:v7];
    GraphicsLine *line6 = [[GraphicsLine alloc] initWithVertices:v7:v8];
    GraphicsLine *line7 = [[GraphicsLine alloc] initWithVertices:v8:v1];
    
    [line1 setColor:0.0f:1.0f:0.0f];
    [line2 setColor:0.0f:1.0f:0.0f];
    [line3 setColor:0.0f:1.0f:0.0f];
    [line4 setColor:0.0f:1.0f:0.0f];
    [line5 setColor:0.0f:1.0f:0.0f];
    [line6 setColor:0.0f:1.0f:0.0f];
    [line7 setColor:0.0f:1.0f:0.0f];   
    
    GraphicsComponent *component = [[GraphicsComponent alloc] init];
    [component setLineCount:7];
    [component setLine:0:line1];
    [component setLine:1:line2];
    [component setLine:2:line3];
    [component setLine:3:line4];
    [component setLine:4:line5];
    [component setLine:5:line6];
    [component setLine:6:line7];
    
    return component;
}

+ (GraphicsComponent *) D
{    
    Vertex *v1 = [[Vertex alloc] initWithX:0.0f:0.0f:0.0f];
    Vertex *v2 = [[Vertex alloc] initWithX:0.0f:3.0f:0.0f];
    Vertex *v3 = [[Vertex alloc] initWithX:1.6f:3.0f:0.0f];
    Vertex *v4 = [[Vertex alloc] initWithX:2.0f:2.6f:0.0f];
    Vertex *v5 = [[Vertex alloc] initWithX:2.0f:0.4f:0.0f];
    Vertex *v6 = [[Vertex alloc] initWithX:1.6f:0.0f:0.0f];
    
    GraphicsLine *line1 = [[GraphicsLine alloc] initWithVertices:v1:v2];
    GraphicsLine *line2 = [[GraphicsLine alloc] initWithVertices:v2:v3];
    GraphicsLine *line3 = [[GraphicsLine alloc] initWithVertices:v3:v4];
    GraphicsLine *line4 = [[GraphicsLine alloc] initWithVertices:v4:v5];
    GraphicsLine *line5 = [[GraphicsLine alloc] initWithVertices:v5:v6];
    GraphicsLine *line6 = [[GraphicsLine alloc] initWithVertices:v6:v1];
    
    [line1 setColor:0.0f:1.0f:0.0f];
    [line2 setColor:0.0f:1.0f:0.0f];
    [line3 setColor:0.0f:1.0f:0.0f];
    [line4 setColor:0.0f:1.0f:0.0f];
    [line5 setColor:0.0f:1.0f:0.0f];
    [line6 setColor:0.0f:1.0f:0.0f];   
    
    GraphicsComponent *component = [[GraphicsComponent alloc] init];
    [component setLineCount:6];
    [component setLine:0:line1];
    [component setLine:1:line2];
    [component setLine:2:line3];
    [component setLine:3:line4];
    [component setLine:4:line5];
    [component setLine:5:line6];
    
    return component;
}

+ (GraphicsComponent *) E
{    
    Vertex *v1 = [[Vertex alloc] initWithX:2.0f:0.0f:0.0f];
    Vertex *v2 = [[Vertex alloc] initWithX:0.0f:0.0f:0.0f];
    Vertex *v3 = [[Vertex alloc] initWithX:0.0f:3.0f:0.0f];
    Vertex *v4 = [[Vertex alloc] initWithX:2.0f:3.0f:0.0f];
    Vertex *v5 = [Vertex midPoint:v2:v3];
    Vertex *v6 = [[Vertex alloc] initWithX:2.0f:1.5f:0.0f];
    
    GraphicsLine *line1 = [[GraphicsLine alloc] initWithVertices:v1:v2];
    GraphicsLine *line2 = [[GraphicsLine alloc] initWithVertices:v2:v3];
    GraphicsLine *line3 = [[GraphicsLine alloc] initWithVertices:v3:v4];
    GraphicsLine *line4 = [[GraphicsLine alloc] initWithVertices:v5:v6];
    
    [line1 setColor:0.0f:1.0f:0.0f];
    [line2 setColor:0.0f:1.0f:0.0f];
    [line3 setColor:0.0f:1.0f:0.0f];
    [line4 setColor:0.0f:1.0f:0.0f];   
    
    GraphicsComponent *component = [[GraphicsComponent alloc] init];
    [component setLineCount:4];
    [component setLine:0:line1];
    [component setLine:1:line2];
    [component setLine:2:line3];
    [component setLine:3:line4];
    
    return component;
}

+ (GraphicsComponent *) F
{    
    Vertex *v1 = [[Vertex alloc] initWithX:0.0f:0.0f:0.0f];
    Vertex *v2 = [[Vertex alloc] initWithX:0.0f:3.0f:0.0f];
    Vertex *v3 = [[Vertex alloc] initWithX:2.0f:3.0f:0.0f];
    Vertex *v4 = [Vertex midPoint:v1:v2];
    Vertex *v5 = [[Vertex alloc] initWithX:1.5f:1.5f:0.0f];
    
    GraphicsLine *line1 = [[GraphicsLine alloc] initWithVertices:v1:v2];
    GraphicsLine *line2 = [[GraphicsLine alloc] initWithVertices:v2:v3];
    GraphicsLine *line3 = [[GraphicsLine alloc] initWithVertices:v4:v5];
    
    [line1 setColor:0.0f:1.0f:0.0f];
    [line2 setColor:0.0f:1.0f:0.0f];
    [line3 setColor:0.0f:1.0f:0.0f];   
    
    GraphicsComponent *component = [[GraphicsComponent alloc] init];
    [component setLineCount:3];
    [component setLine:0:line1];
    [component setLine:1:line2];
    [component setLine:2:line3];
    
    return component;
}

+ (GraphicsComponent *) G
{    
    Vertex *v1 = [[Vertex alloc] initWithX:1.0f:1.0f:0.0f];
    Vertex *v2 = [[Vertex alloc] initWithX:2.0f:1.0f:0.0f];
    Vertex *v3 = [[Vertex alloc] initWithX:2.0f:0.4f:0.0f];
    Vertex *v4 = [[Vertex alloc] initWithX:1.6f:0.0f:0.0f];
    Vertex *v5 = [[Vertex alloc] initWithX:0.4f:0.0f:0.0f];
    Vertex *v6 = [[Vertex alloc] initWithX:0.0f:0.4f:0.0f];
    Vertex *v7 = [[Vertex alloc] initWithX:0.0f:2.6f:0.0f];
    Vertex *v8 = [[Vertex alloc] initWithX:0.4f:3.0f:0.0f];
    Vertex *v9 = [[Vertex alloc] initWithX:1.6f:3.0f:0.0f];
    Vertex *v10 = [[Vertex alloc] initWithX:2.0f:2.6f:0.0f];
    
    GraphicsLine *line1 = [[GraphicsLine alloc] initWithVertices:v1:v2];
    GraphicsLine *line2 = [[GraphicsLine alloc] initWithVertices:v2:v3];
    GraphicsLine *line3 = [[GraphicsLine alloc] initWithVertices:v3:v4];
    GraphicsLine *line4 = [[GraphicsLine alloc] initWithVertices:v4:v5];
    GraphicsLine *line5 = [[GraphicsLine alloc] initWithVertices:v5:v6];
    GraphicsLine *line6 = [[GraphicsLine alloc] initWithVertices:v6:v7];
    GraphicsLine *line7 = [[GraphicsLine alloc] initWithVertices:v7:v8];
    GraphicsLine *line8 = [[GraphicsLine alloc] initWithVertices:v8:v9];
    GraphicsLine *line9 = [[GraphicsLine alloc] initWithVertices:v9:v10];
    
    [line1 setColor:0.0f:1.0f:0.0f];
    [line2 setColor:0.0f:1.0f:0.0f];
    [line3 setColor:0.0f:1.0f:0.0f];
    [line4 setColor:0.0f:1.0f:0.0f];
    [line5 setColor:0.0f:1.0f:0.0f];
    [line6 setColor:0.0f:1.0f:0.0f];
    [line7 setColor:0.0f:1.0f:0.0f];
    [line8 setColor:0.0f:1.0f:0.0f];
    [line9 setColor:0.0f:1.0f:0.0f];   
    
    GraphicsComponent *component = [[GraphicsComponent alloc] init];
    [component setLineCount:9];
    [component setLine:0:line1];
    [component setLine:1:line2];
    [component setLine:2:line3];
    [component setLine:3:line4];
    [component setLine:4:line5];
    [component setLine:5:line6];
    [component setLine:6:line7];
    [component setLine:7:line8];
    [component setLine:8:line9];
    
    return component;
}

+ (GraphicsComponent *) H
{    
    Vertex *v1 = [[Vertex alloc] initWithX:0.0f:0.0f:0.0f];
    Vertex *v2 = [[Vertex alloc] initWithX:0.0f:3.0f:0.0f];
    Vertex *v3 = [[Vertex alloc] initWithX:2.0f:3.0f:0.0f];
    Vertex *v4 = [[Vertex alloc] initWithX:2.0f:0.0f:0.0f];
    Vertex *v5 = [Vertex midPoint:v1:v2];
    Vertex *v6 = [Vertex midPoint:v3:v4];
    
    GraphicsLine *line1 = [[GraphicsLine alloc] initWithVertices:v1:v2];
    GraphicsLine *line2 = [[GraphicsLine alloc] initWithVertices:v3:v4];
    GraphicsLine *line3 = [[GraphicsLine alloc] initWithVertices:v5:v6];
    
    [line1 setColor:0.0f:1.0f:0.0f];
    [line2 setColor:0.0f:1.0f:0.0f];
    [line3 setColor:0.0f:1.0f:0.0f];  
    
    GraphicsComponent *component = [[GraphicsComponent alloc] init];
    [component setLineCount:3];
    [component setLine:0:line1];
    [component setLine:1:line2];
    [component setLine:2:line3];
    
    return component;
}

+ (GraphicsComponent *) I
{    
    Vertex *v1 = [[Vertex alloc] initWithX:0.0f:0.0f:0.0f];
    Vertex *v2 = [[Vertex alloc] initWithX:0.0f:3.0f:0.0f];
    Vertex *v3 = [[Vertex alloc] initWithX:2.0f:3.0f:0.0f];
    Vertex *v4 = [[Vertex alloc] initWithX:2.0f:0.0f:0.0f];
    Vertex *v5 = [Vertex midPoint:v1:v4];
    Vertex *v6 = [Vertex midPoint:v2:v3];
    
    GraphicsLine *line1 = [[GraphicsLine alloc] initWithVertices:v1:v4];
    GraphicsLine *line2 = [[GraphicsLine alloc] initWithVertices:v2:v3];
    GraphicsLine *line3 = [[GraphicsLine alloc] initWithVertices:v5:v6];
    
    [line1 setColor:0.0f:1.0f:0.0f];
    [line2 setColor:0.0f:1.0f:0.0f];
    [line3 setColor:0.0f:1.0f:0.0f];   
    
    GraphicsComponent *component = [[GraphicsComponent alloc] init];
    [component setLineCount:3];
    [component setLine:0:line1];
    [component setLine:1:line2];
    [component setLine:2:line3];
    
    return component;
}

+ (GraphicsComponent *) J
{    
    float coords[] = {
        2.0f, 3.0f,
        0.0f, 0.4f,
        0.4f, 0.0f,
        1.2f, 0.0f,
        1.6f, 0.4f,
        1.6f, 3.0f,
        0.0f, 3.0f
    };
    
    int connects[] = {
        1, 2,
        2, 3,
        3, 4,
        4, 5,
        6, 0
    };
    
    return createLetter(coords, 7, connects, 5);
}

+ (GraphicsComponent *) K
{    
    float coords[] = {
        0.0f, 1.5f,
        0.0f, 0.0f,
        0.0f, 3.0f,
        2.0f, 3.0f,
        2.0f, 0.0f
    };
    
    int connects[] = {
        1, 2,
        0, 3,
        0, 4
    };
    
    return createLetter(coords, 5, connects, 3);
}

+ (GraphicsComponent *) L
{    
    float coords[] = {
        0.0, 3.0,
        2.0, 0.0,
        0.0, 0.0
    };
    
    int connects[] = {
        0, 2,
        2, 1
    };
    
    return createLetter(coords, 3, connects, 2);
}

+ (GraphicsComponent *) M
{    
    float coords[] = {
        2.0, 0.0,
        0.0, 0.0,
        0.0, 3.0,
        1.0, 1.5,
        2.0, 3.0
    };
    
    int connects[] = {
        0, 4,
        1, 2,
        2, 3,
        3, 4
    };
    
    return createLetter(coords, 5, connects, 4);
}

+ (GraphicsComponent *) N
{    
    float coords[] = {
        2.0, 3.0,
        0.0, 0.0,
        0.0, 3.0,
        2.0, 0.0
    };
    
    int connects[] = {
        1, 2,
        2, 3,
        3, 0
    };
    
    return createLetter(coords, 4, connects, 3);
}

+ (GraphicsComponent *) O
{    
    float coords[] = {
        1.6, 0.0,
        0.4, 0.0,
        0.0, 0.4,
        0.0, 2.6,
        0.4, 3.0,
        1.6, 3.0,
        2.0, 2.6,
        2.0, 0.4
    };
    
    int connects[] = {
        1, 2,
        2, 3,
        3, 4, 
        4, 5,
        5, 6,
        6, 7,
        7, 0,
        0, 1
    };
    
    return createLetter(coords, 8, connects, 8);
}

+ (GraphicsComponent *) P
{    
    float coords[] = {
        1.6, 1.5,
        0.0, 0.0,
        0.0, 3.0,
        1.6, 3.0,
        2.0, 2.6,
        2.0, 1.9,
        0.0, 1.5
    };
    
    int connects[] = {
        1, 2,
        2, 3,
        3, 4,
        4, 5,
        5, 0,
        0, 6
    };
    
    return createLetter(coords, 7, connects, 6);
}

+ (GraphicsComponent *) Q
{   
    float coords[] = {
        1.0, 1.5,
        0.4, 0.0,
        0.0, 0.4,
        0.0, 2.6,
        0.4, 3.0,
        1.6, 3.0,
        2.0, 2.6,
        2.0, 0.4,
        1.6, 0.0,
        2.0, 0.0
    };
    
    int connects[] = {
        1, 2,
        2, 3,
        3, 4,
        4, 5,
        5, 6, 
        6, 7,
        7, 8,
        0, 9,
        1, 8
    };
    
    return createLetter(coords, 10, connects, 9);
}

+ (GraphicsComponent *) R
{    
    float coords[] = {
        2.0, 0.0,
        0.0, 0.0,
        0.0, 3.0,
        1.6, 3.0,
        2.0, 2.6,
        2.0, 1.9,
        1.6, 1.5,
        0.0, 1.5,
        1.0, 1.5
    };
    
    int connects[] = {
        1, 2,
        2, 3,
        3, 4,
        4, 5,
        5, 6,
        6, 7,
        8, 0
    };
    
    return createLetter(coords, 9, connects, 7);
}

+ (GraphicsComponent *) S
{    
    float coords[] = {
        2.0, 2.6,
        0.0, 0.4,
        0.4, 0.0,
        1.6, 0.0,
        2.0, 0.4,
        2.0, 1.3,
        0.0, 1.7,
        0.0, 2.6,
        0.4, 3.0,
        1.6, 3.0,
    };
    
    int connects[] = {
        1, 2,
        2, 3,
        3, 4,
        4, 5,
        5, 6,
        6, 7,
        7, 8,
        8, 9,
        9, 0
    };
    
    return createLetter(coords, 10, connects, 9);
}

+ (GraphicsComponent *) T
{    
    float coords[] = {
        2.0, 3.0,
        1.0, 0.0,
        0.0, 3.0,
        1.0, 3.0
    };
    
    int connects[] = {
        1, 3,
        2, 0
    };
    
    return createLetter(coords, 4, connects, 2);
}

+ (GraphicsComponent *) U
{    
    float coords[] = {
        2.0, 0.0,
        0.0, 3.0,
        0.0, 0.4,
        0.4, 0.0,
        1.6, 0.0,
        2.0, 0.4,
        2.0, 3.0
    };
    
    int connects[] = {
        1, 2,
        2, 3,
        3, 4,
        4, 5,
        0, 6
    };
    
    return createLetter(coords, 7, connects, 5);
}

+ (GraphicsComponent *) V
{    
    float coords[] = {
        2.0, 3.0,
        0.0, 3.0,
        1.0, 0.0
    };
    
    int connects[] = {
        1, 2,
        2, 0
    };
    
    return createLetter(coords, 3, connects, 2);
}

+ (GraphicsComponent *) W
{    
    float coords[] = {
        2.0, 3.0,
        0.0, 3.0,
        0.5, 0.0,
        1.0, 1.5,
        1.5, 0.0,
    };
    
    int connects[] = {
        1, 2,
        2, 3,
        3, 4,
        4, 0
    };
    
    return createLetter(coords, 5, connects, 4);
}

+ (GraphicsComponent *) X
{    
    float coords[] = {
        2.0, 3.0,
        0.0, 0.0,
        2.0, 0.0,
        0.0, 3.0
    };
    
    int connects[] = {
        1, 0,
        3, 2
    };
    
    return createLetter(coords, 4, connects, 2);
}

+ (rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr