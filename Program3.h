//
//  Program3.h
//  OpenGL
//
//  Created by David Stover on Sun Mar 28 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Program.h"
#import "TestCamera1.h"
#import "TestScene1.h"

@interface Program3 : Program {    
    TestCamera1 *camera;
    TestScene1 *scene;
}

@end