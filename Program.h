//
//  Program.h
//  OpenGL
//
//  Created by David Stover on Sat Jan 17 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Scene.h"
#import "Camera.h"
#import "TimeManager.h"

@interface Program : NSObject
{
}
- (id) init;
- (void) initializeScene;
- (void) updateTime: (double) currentTime;
- (Scene *) getScene;
- (void) setUpOpenGL;
- (void) keyDown: (NSEvent *) theEvent;
- (Camera *) getCamera;
@end