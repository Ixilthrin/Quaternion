//
//  ModelScene.m
//  OpenGL
//
//  Created by David Stover on Sun Mar 28 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import "ModelScene.h"
#import <OpenGL/gl.h>

@implementation ModelScene


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
    // the current model-view matrix.
    [lightModel set];
    [light set];
}

- (void) draw
{
    // Do transformation that will affect the entire scene here.
    int index = 0;
    for ( ; index < modelCount; ++index) 
    {
        [camera doView];
        [self doLighting];
        [models[index] draw];
    }
}

@end
