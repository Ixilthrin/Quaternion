//
//  Program1.h
//  OpenGL
//
//  Created by David Stover on Sat Jan 17 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Program.h"
#import "StandardCamera.h"
#import "ModelScene.h"

@interface Program1 : Program {
    StandardCamera *camera;
    ModelScene *scene;
}

@end
