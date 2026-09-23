//
//  TestScene1.m
//  OpenGL
//
//  Created by David Stover on Sun Mar 28 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import "TestScene1.h"
#import <OpenGL/gl.h>
#import <OpenGL/glu.h>

@implementation TestScene1


- (id) init
{
    [super init];
    
    lightModel = [[LightModel alloc] init];
    
    light = [[Light alloc] init];
    
    return self;
}

- (int) getModelCount
{
    return modelCount;
}

- (void) setModelCount:(int)count
{
    modelCount = count;
    models = (Model **) malloc(count * sizeof(Model*));
}

- (void) setModel:(int)index:(Model*)model
{
    models[index] = model;
}

- (void) updateTime: (double) currentTime
{
    int index = 0;
    for ( ; index < modelCount; ++index) 
    {
        Model *currentModel = models[index];
        if ([currentModel isDynamic]) 
        {
            [currentModel updateTime:currentTime];
        }
    }
}

- (void) doLighting
{
    // The position of the light will be set according to
    // the current model-view matrix, so load the identity transformation.
    //glMatrixMode(GL_MODELVIEW);
    //glLoadIdentity();
    [lightModel set];
    [light set];
}

- (void) draw
{
    //glMatrixMode(GL_MODELVIEW);
    //glLoadIdentity();
    glTranslatef(0.0, 0.0, -5.0);
    //gluLookAt(0.0, 0.0, -10.0, 0.0, 0.0, 100.0, 0.0, 1.0, 0.0);
    //glScalef(1.0, 2.0, 1.0);
    int index = 0;
    for ( ; index < modelCount; ++index) 
    {
        //[camera doView];
        [models[index] draw];
    }
}

@end
