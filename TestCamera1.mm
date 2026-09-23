//
//  TestCamera1.m
//  OpenGL
//
//  Created by David Stover on Sun Mar 28 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import "TestCamera1.h"

#import <OpenGL/gl.h>
#import <OpenGL/glu.h>

@implementation TestCamera1
- (id) init
{
    tripod = nil;
    farDistance = 200.0;
    nearDistance = 50.0;
    minX = -2.0;
    maxX = 2.0;
    minY = -2.0;
    maxY = 2.0;
    eyeX = 0.0;
    eyeY = 0.0;
    eyeZ = -55.0;
    currentYaw = 0.0;
    currentPitch = 0.0;
    currentRoll = 0.0;
    
    [super init];
    
    return self;
}

- (void) setTripod: (Tripod *) t
{
    tripod = t;
}


- (void) translate: (float) x: (float) y: (float) z
{
    eyeX += x;
    eyeY += y;
    eyeZ += z;
    nearDistance += z;
    farDistance += z;
}

- (void) zoomIn: (float) distance
{
    // NYI: Make sure minX does not become greater than maxX, etc.
    minX += distance;
    maxX -= distance;
    minY += distance;
    maxY -= distance;
}

- (void) zoomOut: (float) distance
{
    minX -= distance;
    maxX += distance;
    minY -= distance;
    maxY += distance;
}

- (void) moveYaw: (float) degrees
{
    currentYaw += degrees;
    if (currentYaw > 360.0) {
        currentYaw -= 360.0;
    }
}

- (void) movePitch: (float) degrees
{
    currentPitch += degrees;
    if (currentPitch > 360.0) {
        currentPitch -= 360.0;
    }
}

- (void) moveRoll: (float) degrees
{
    currentRoll += degrees;
    if (currentRoll > 360.0) {
        currentRoll -= 360.0;
    }
}

- (void) setYaw: (float) y
{
    currentYaw = y;
}

- (void) setPitch: (float) p
{
    currentPitch = p;
}

- (void) setRoll: (float) r
{
    currentRoll = r;
}

- (void) setFarDistance: (float) distance
{
    farDistance = distance;
}

- (void) setNearDistance: (float) distance
{
    nearDistance = distance;
}

- (void) setMinX: (float) m
{
    minX = m;
}

- (void) setMaxX: (float) m
{
    maxX = m;
}

- (void) setMinY: (float) m
{
    minY = m;
}

- (void) setMaxY: (float) m
{
    maxY = m;
}

- (void) setEyeX: (float) e
{
    eyeX = e;
}

- (void) setEyeY: (float) e
{
    eyeY = e;
}

- (void) setEyeZ: (float) e
{
    eyeZ = e;
}

- (float) getYaw
{
    return currentYaw;
}

- (float) getPitch
{
    return currentPitch;
}

- (float) getRoll
{
    return currentRoll;
}

- (float) getFarDistance
{
    return farDistance;
}

- (float) getNearDistance
{
    return nearDistance;
}

- (float) getMinX
{
    return minX;
}

- (float) getMaxX
{
    return maxX;
}

- (float) getMinY
{
    return minY;
}

- (float) getMaxY
{
    return maxY;
}

- (float) getEyeX
{
    return eyeX;
}

- (float) getEyeY
{
    return eyeY;
}

- (float) getEyeZ
{
    return eyeZ;
}

// Should be called from the system thread through callback
// functions in NSView such as drawRect and keyDown, etc.
- (void) doProjection
{
    //glViewport(0, 0, 20, 20);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glFrustum(-1.0, 1.0, -1.0, 1.0, 1.5, 20.0);
}

// Should be called from the system thread through callback
// functions in NSView such as drawRect and keyDown, etc.
- (void) doView
{
    
    
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
}
@end
