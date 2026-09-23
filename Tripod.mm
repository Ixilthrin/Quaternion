//
//  Tripod.m
//  OpenGL
//
//  Created by David Stover on Sun Nov 02 2003.
//  Copyright (c) 2003 __MyCompanyName__. All rights reserved.
//

#import "Tripod.h"


@implementation Tripod
- (void) setPositionX: (float) x
{
    positionX = x;
}

- (void) setPositionY: (float) y
{
    positionY = y;
}

- (void) setPositionZ: (float) z
{
    positionZ = z;
}

- (void) setYaw: (float) y
{
    yaw = y;
}

- (void) setPitch: (float) p
{
    pitch = p;
}

- (void) setRoll: (float) r
{
    roll = r;
}

- (float) getPositionX
{
    return positionX;
}

- (float) getPositionY
{
    return positionY;
}

- (float) getPositionZ
{
    return positionZ;
}

- (float) getYaw
{
    return yaw;
}

- (float) getPitch
{
    return pitch;
}

- (float) getRoll
{
    return roll;
}

@end
