//
//  Program.m
//  OpenGL
//
//  Created by David Stover on Sat Jan 17 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import "Program.h"
#import "MyOpenGLView.h"
#import "Material.h"


@implementation Program

- (id) init
{
    [super init];
    
    return self;
}

- (void) initializeScene
{
}

- (void) updateTime: (double) currentTime
{ 
}

- (Scene *) getScene
{
    return nil;
}

- (void) setUpOpenGL
{
    // Sub classes take care of this
}

- (void) keyDown: (NSEvent *) theEvent
{
}

- (Camera *) getCamera
{
    return nil;
}

@end
