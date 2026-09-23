//
//  Program4.h
//  OpenGL
//
//  Created by David Stover on Sun Apr 04 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Program.h"
#import "DeluxeCamera.h"
#import "ModelScene.h"

@interface Program4 : Program {
    DeluxeCamera *camera;
    ModelScene *scene;
}

@end
