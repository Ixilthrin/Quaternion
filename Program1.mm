//
//  Program1.m
//  OpenGL
//
//  Created by David Stover on Sat Jan 17 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import "Program1.h"
#import "MyOpenGLView.h"
#import "Material.h"

#import <OpenGL/gl.h>
#import <OpenGL/glu.h>

@implementation Program1

static Model *getModel()
{
    Vertex *top = [[Vertex alloc] initWithX:0.0f:0.66667f:0.0f];
    Vertex *base1 = [[Vertex alloc] initWithX:0.0f:-0.33333f:0.666667f];
    Vertex *base2 = [[Vertex alloc] initWithX:0.5f:-0.33333f:-0.33333f];
    Vertex *base3 = [[Vertex alloc] initWithX:-0.5f:-0.33333f:-0.333333f];
    
    Triangle *triangle1 = [[Triangle alloc] initWithVertices:top:base2:base1];
    Triangle *triangle2 = [[Triangle alloc] initWithVertices:top:base3:base2];
    Triangle *triangle3 = [[Triangle alloc] initWithVertices:top:base1:base3];
    Triangle *triangle4 = [[Triangle alloc] initWithVertices:base1:base2:base3];
    
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
    
    Material *mat2 = [[Material alloc] init];
    [mat2 setAmbient: [[Color alloc] initWith:0.0:0.0:0.0:0.0]];
    [mat2 setDiffuse: [[Color alloc] initWith:0.0:1.0:0.0:0.0]];
    [mat2 setSpecular: [[Color alloc] initWith:0.0:0.0:0.0:0.0]];
    [mat2 setEmissive: [[Color alloc] initWith:0.0:0.0:0.0:0.0]];
    [mat2 setShininess: 0.0];
    
    GraphicsComponent *component2 = [[GraphicsComponent alloc] initWithMaterial:mat2];
    [component2 setTriangleCount:1];
    [component2 setTriangle:0:triangle2];
    
    Material *mat3 = [[Material alloc] init];
    [mat3 setAmbient: [[Color alloc] initWith:0.0:0.0:0.0:0.0]];
    [mat3 setDiffuse: [[Color alloc] initWith:1.0:1.0:0.0:0.0]];
    [mat3 setSpecular: [[Color alloc] initWith:0.0:0.0:0.0:0.0]];
    [mat3 setEmissive: [[Color alloc] initWith:0.0:0.0:0.0:0.0]];
    [mat3 setShininess: 0.0];
    
    GraphicsComponent *component3 = [[GraphicsComponent alloc] initWithMaterial:mat3];
    [component3 setTriangleCount:1];
    [component3 setTriangle:0:triangle3];
    
    Material *mat4 = [[Material alloc] init];
    [mat4 setAmbient: [[Color alloc] initWith:0.0:0.0:0.0:0.0]];
    [mat4 setDiffuse: [[Color alloc] initWith:0.0:0.0:1.0:0.0]];
    [mat4 setSpecular: [[Color alloc] initWith:0.0:0.0:0.0:0.0]];
    [mat4 setEmissive: [[Color alloc] initWith:0.0:0.0:0.0:0.0]];
    [mat4 setShininess: 0.0];
    
    GraphicsComponent *component4 = [[GraphicsComponent alloc] initWithMaterial:mat4];
    [component4 setTriangleCount:1];
    [component4 setTriangle:0:triangle4];
    
    Model *model = [[Model alloc] init];
    [model setDynamic:true];    
    
    [model setComponentCount:4];
    [model setComponent:0:component1];
    [model setComponent:1:component2];
    [model setComponent:2:component3];
    [model setComponent:3:component4];
    
    //[model moveX:10.0];
    
    return model;
}

- (id) init
{
    camera = [[StandardCamera alloc] init];
    
    [super init];
    
    return self;
}

- (void) initializeScene
{
    
    Model *model0 = getModel();
    [model0 moveX:1.0];
    
    
     Model *model1 = getModel();
     [model1 moveY:2.0];
     /*
     Model *model2 = getModel();
     [model2 moveY:10.0];
     Model *model3 = getModel();
     [model3 moveZ:10.0];
     Model *model4 = getModel();
     [model4 moveX:3.0];
     Model *model5 = getModel();
     [model5 moveY:4.0];
     Model *model6 = getModel();
     [model6 moveZ:7.0];
     Model *model7 = getModel();
     [model7 moveX:8.0];
     Model *model8 = getModel();
     [model8 moveY:0.0];
     Model *model9 = getModel();
     [model9 moveZ:12.0];
     */
    
    scene = [[ModelScene alloc] init];
    [scene setModelCount:2];    
    [scene setModel:0:model0];
    [scene setModel:1:model1];
    /*
     [scene setModel:1:model1];
     [scene setModel:2:model2];
     [scene setModel:3:model3];
     [scene setModel:4:model4];
     [scene setModel:5:model5];
     [scene setModel:6:model6];
     [scene setModel:7:model7];
     [scene setModel:8:model8];
     [scene setModel:9:model9];
     */
    
    // NYI: The scene will dealloc the model, the model will dealloc its graphics components, etc.
}

- (void) updateTime: (double) currentTime
{   
    [scene updateTime:currentTime];
}

- (Scene *) getScene
{
    return scene;
}

// Must be called from the OpenGL Thread
-(void) setUpOpenGL
{
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
            [camera movePitch:10.0];
        } 
        else if (nextChar == 'j') 
        {
            [camera movePitch:-10.0];
        } 
        else if (nextChar == 'd') 
        {
            [camera moveYaw:10.0];
        } 
        else if (nextChar == 'a') {
            [camera moveYaw:-10.0];
        } else if (nextChar == 'k') 
        {
            [camera moveRoll:10.0];
        } 
        else if (nextChar == 'h') {
            [camera moveRoll:-10.0];
        }
        else if (nextChar == 'w') {
            [camera translate:0.0:0.0:1.0];
        }
        else if (nextChar == 's') {
            [camera translate:0.0:0.0:-1.0];
        }        
        else if (nextChar == 'n') 
        {
            [camera zoomIn:0.05];
        }
        else if (nextChar == 'm')
        {
            [camera zoomOut:0.05];
        }
    }
}

- (Camera *) getCamera
{
    return camera;
}


@end
