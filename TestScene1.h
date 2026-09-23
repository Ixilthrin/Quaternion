//
//  TestScene1.h
//  OpenGL
//
//  Created by David Stover on Sun Mar 28 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Scene.h"
#import "Model.h"
#import "LightModel.h"
#import "Light.h"


@interface TestScene1 : Scene {
    
    Model **models;
    int modelCount;
    LightModel *lightModel;
    Light *light;
}

- (id) init;
- (int) getModelCount;
- (void) setModelCount:(int)count;
- (void) setModel:(int)index:(Model*)model;
- (void) updateTime: (double) timeInterval;
/*
- (void) doLighting;
- (void) draw;
*/
@end
