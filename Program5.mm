//
//  Program5.m
//  OpenGL
//
//  Created by David Stover on Sat May 15 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import "Program5.h"
#import "MyOpenGLView.h"
#import "Material.h"
#import "BMP.h"
#import "TexturedTriangle.h"

#import <OpenGL/gl.h>
#import <OpenGL/glu.h>

@implementation Program5

static GLuint textureID;

static Model *getModel()
{
    Vertex *top = [[Vertex alloc] initWithX:0.0f:0.66667f:0.0f];
    Vertex *base1 = [[Vertex alloc] initWithX:0.0f:-0.33333f:0.666667f];
    Vertex *base2 = [[Vertex alloc] initWithX:0.5f:-0.33333f:-0.33333f];
    Vertex *base3 = [[Vertex alloc] initWithX:-0.5f:-0.33333f:-0.333333f];
    
    TexturedTriangle *triangle1 = [[TexturedTriangle alloc] initWithVertices:top:base2:base1];
    TexturedTriangle *triangle2 = [[TexturedTriangle alloc] initWithVertices:top:base3:base2];
    TexturedTriangle *triangle3 = [[TexturedTriangle alloc] initWithVertices:top:base1:base3];
    TexturedTriangle *triangle4 = [[TexturedTriangle alloc] initWithVertices:base1:base2:base3];
    
    [triangle1 setTexCoords:0.5f:0.0f:1.0f:1.0f:0.0f:1.0f];
    [triangle2 setTexCoords:0.5f:0.0f:1.0f:1.0f:0.0f:1.0f];
    [triangle3 setTexCoords:0.5f:0.0f:1.0f:1.0f:0.0f:1.0f];
    [triangle4 setTexCoords:0.5f:0.0f:1.0f:1.0f:0.0f:1.0f];
    
    [triangle1 setColor:1.0f:0.0f:0.0f];
    [triangle2 setColor:0.0f:1.0f:0.0f];
    [triangle3 setColor:1.0f:1.0f:0.0f];
    [triangle4 setColor:0.0f:0.0f:1.0f];
    
    Material *mat1 = [[Material alloc] init];
    [mat1 setAmbient: [[Color alloc] initWith:0.0:0.0:0.0:0.0]];
    [mat1 setDiffuse: [[Color alloc] initWith:1.0:0.0:0.0:0.0]];
    [mat1 setSpecular: [[Color alloc] initWith:0.0:0.0:0.0:0.0]];
    [mat1 setEmissive: [[Color alloc] initWith:0.0:0.0:0.0:0.0]];
    [mat1 setShininess: 0.0];    
    
    GraphicsComponent *component1 = [[GraphicsComponent alloc] initWithMaterial:mat1];
    [component1 setTriangleCount:1];
    [component1 setTriangle:0:triangle1];
    [component1 setTextureID:(unsigned int) textureID];
    
    Material *mat2 = [[Material alloc] init];
    [mat2 setAmbient: [[Color alloc] initWith:0.0:0.0:0.0:0.0]];
    [mat2 setDiffuse: [[Color alloc] initWith:0.0:1.0:0.0:0.0]];
    [mat2 setSpecular: [[Color alloc] initWith:0.0:0.0:0.0:0.0]];
    [mat2 setEmissive: [[Color alloc] initWith:0.0:0.0:0.0:0.0]];
    [mat2 setShininess: 0.0];
    
    GraphicsComponent *component2 = [[GraphicsComponent alloc] initWithMaterial:mat2];
    [component2 setTriangleCount:1];
    [component2 setTriangle:0:triangle2];
    [component2 setTextureID:(unsigned int) textureID];
    
    Material *mat3 = [[Material alloc] init];
    [mat3 setAmbient: [[Color alloc] initWith:0.0:0.0:0.0:0.0]];
    [mat3 setDiffuse: [[Color alloc] initWith:1.0:1.0:0.0:0.0]];
    [mat3 setSpecular: [[Color alloc] initWith:0.0:0.0:0.0:0.0]];
    [mat3 setEmissive: [[Color alloc] initWith:0.0:0.0:0.0:0.0]];
    [mat3 setShininess: 0.0];
    
    GraphicsComponent *component3 = [[GraphicsComponent alloc] initWithMaterial:mat3];
    [component3 setTriangleCount:1];
    [component3 setTriangle:0:triangle3];
    [component3 setTextureID:(unsigned int) textureID];
    
    Material *mat4 = [[Material alloc] init];
    [mat4 setAmbient: [[Color alloc] initWith:0.0:0.0:0.0:0.0]];
    [mat4 setDiffuse: [[Color alloc] initWith:0.0:0.0:1.0:0.0]];
    [mat4 setSpecular: [[Color alloc] initWith:0.0:0.0:0.0:0.0]];
    [mat4 setEmissive: [[Color alloc] initWith:0.0:0.0:0.0:0.0]];
    [mat4 setShininess: 0.0];
    
    GraphicsComponent *component4 = [[GraphicsComponent alloc] initWithMaterial:mat4];
    [component4 setTriangleCount:1];
    [component4 setTriangle:0:triangle4];
    [component4 setTextureID:(unsigned int) textureID];
    
    Model *model = [[Model alloc] init];
    [model setDynamic:true];    
    
    [model setComponentCount:4];
    [model setComponent:0:component1];
    [model setComponent:1:component2];
    [model setComponent:2:component3];
    [model setComponent:3:component4];
    
    return model;
}

- (id) init
{
    camera = [[DeluxeCamera alloc] init];
    
    [super init];
    
    return self;
}

static GLubyte texture[256][256][4];
static void loadTexture()
{
    char string[] = "/Users/dstover/Pictures/evan_xmas_2002.bmp";
    //char string[] = "/Users/dstover/Pictures/red.bmp";
    //char string[] = "/Users/dstover/Pictures/test.bmp";
    //char string[] = "/Users/dstover/Pictures/sunset.bmp";
    printf("%s\n", string);
    
    BMP *bmp = [[BMP alloc] init];
    [bmp readWithCString:(const char*) string];
    
    unsigned char * colorValues = [bmp getColorValues];
    
    int i = 0;
    int j = 0;
    for (i = 255; i >= 0; --i) {
        for (j = 0; j < 256; ++j) {
            texture[i][j][0] = (GLubyte) colorValues[(i * 3 * 256) + j*3 + 0];
            //printf("red = %d\n", (int) texture[i][j][0]);
            texture[i][j][1] = (GLubyte) colorValues[(i * 3 * 256) + j*3 + 1];
            //printf("green = %d\n", (int) texture[i][j][1]);
            texture[i][j][2] = (GLubyte) colorValues[(i * 3 * 256) + j*3 + 2];
            //printf("blue = %d\n", (int) texture[i][j][2]);
            texture[i][j][3] = (GLubyte) 255;
        }
    }
    
}

- (void) initializeScene
{
    
    Model *model0 = getModel();
    [model0 moveX:1.0];   
    scene = [[ModelScene alloc] init];
    [scene setModelCount:1];    
    [scene setModel:0:model0];
    
    // NYI: The scene will dealloc the model, the model will dealloc its graphics components, etc.
}

- (void) updateTime: (double) currentTime
{   
    [scene updateTime:currentTime];
    [camera updateTime:currentTime];
}
- (Scene *) getScene
{
    return scene;
}


// Must be called from the OpenGL Thread
-(void) setUpOpenGL
{
    loadTexture();
    
    // Texture mapping
    glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
    glGenTextures(1, &textureID);
    glBindTexture(GL_TEXTURE_2D, textureID);
    //glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    //glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, 256, 256, 0, GL_RGBA, GL_UNSIGNED_BYTE,
                 texture);
    
    glEnable(GL_CULL_FACE);
    glCullFace(GL_BACK);
    glEnable(GL_MULTISAMPLE);
    
    // Hints can be NICEST, FASTEST
    // Subjects of hints can be PERSPECTIVE_CORRECTION_HINT, FOG_HINT, 
    // LINE_SMOOTH_HINT, POLYGON_SMOOTH_HINT, TEXTURE_COMPRESSION_HINT
    glHint(GL_POLYGON_SMOOTH_HINT, GL_NICEST); 
    glHint(GL_LINE_SMOOTH_HINT, GL_NICEST);
    glEnable(GL_DEPTH_TEST);  // Use with glClearDepth(...)
    
    glEnable(GL_LIGHTING);
    glShadeModel(GL_SMOOTH);
    glEnable(GL_LIGHT0);
    
    glEnable(GL_RESCALE_NORMAL);
    glEnable(GL_NORMALIZE);    
    glClearDepth(1000.0);
    glClearColor(0.5, 0.5, 0.5, 0);
}

- (void) keyDown: (NSEvent *) theEvent
{
    NSString *string = [theEvent characters];
    int length = [string length];
    int index = 0;
    for ( ; index < length; ++index) 
    {
        char nextChar = [string characterAtIndex:index];
        if (nextChar == 'u') 
        {
            if ([camera isRotatingPitch])
            {
                [camera stopRotatingPitch];
            } else {
                [camera startRotatingPitch];
            }
        } 
        else if (nextChar == 'j') 
        {
            if ([camera isRotatingReversePitch])
            {
                [camera stopRotatingReversePitch];
            } else {
                [camera startRotatingReversePitch];
            }
            
        } 
        else if (nextChar == 'd') 
        {
            if ([camera isRotatingYaw])
            {
                [camera stopRotatingYaw];
            } else {
                [camera startRotatingYaw];
            }
        } 
        else if (nextChar == 'a') {
            if ([camera isRotatingReverseYaw])
            {
                [camera stopRotatingReverseYaw];
            } else {
                [camera startRotatingReverseYaw];
            }
        } else if (nextChar == 'k') 
        {
            if ([camera isRotatingRoll])
            {
                [camera stopRotatingRoll];
            } else {
                [camera startRotatingRoll];
            }
        } 
        else if (nextChar == 'h') {
            if ([camera isRotatingReverseRoll])
            {
                [camera stopRotatingReverseRoll];
            } else {
                [camera startRotatingReverseRoll];
            }
        }
        else if (nextChar == 'w') {
            if ([camera isMovingForward])
            {
                [camera stopMovingForward];
            } else {
                [camera startMovingForward];
            }
        }
        else if (nextChar == 's') {
            if ([camera isMovingBackward])
            {
                [camera stopMovingBackward];
            } else {
                [camera startMovingBackward];
            }
        }        
        else if (nextChar == 'n') 
        {
            if ([camera isZoomingIn])
            {
                [camera stopZoomingIn];
            } else {
                [camera startZoomingIn];
            }
        }
        else if (nextChar == 'm')
        {
            if ([camera isZoomingOut])
            {
                [camera stopZoomingOut];
            } else {
                [camera startZoomingOut];
            }
        }
        else if (nextChar == 't')
        {
            [camera stopAllMotion];
        }
        else if (nextChar == 'r')
        {
            [camera resetPosition];
        }
    }
}

- (Camera *) getCamera
{
    return camera;
}


@end
