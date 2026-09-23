//
//  Program2.h
//  OpenGL
//
//  Created by David Stover on Sun Feb 15 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Program.h"
#import "StandardCamera.h"
#import "ModelScene.h"

@interface Program2 : Program {    
    StandardCamera *camera;
    ModelScene *scene;
}

@end
