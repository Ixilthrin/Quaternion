//
//  Behavior.m
//  OpenGL
//
//  Created by David Stover on Sun Jun 27 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import "Behavior.h"
#import "Model.h"

@implementation Behavior

- (id) initWithModel: (Model *) m
{
    [super init];
    previousTime = 0.0f;
    model = m;
    return self;
} 

- (void) updateModel: (double) currentTime
{ 
    double timeInterval = currentTime - previousTime;
    double rotationalSpeed = 180;  // degrees per second
    [model moveYaw:(rotationalSpeed * timeInterval)];
    [model movePitch:(10 * timeInterval)];
    [model moveRoll:(rotationalSpeed * timeInterval * .75)];  
    
    previousTime = currentTime;
    
}

@end
