//
//  DeluxeCamera.m
//  OpenGL
//
//  Created by David Stover on Sun Nov 02 2003.
//  Copyright (c) 2003 __MyCompanyName__. All rights reserved.
//

#import "DeluxeCamera.h"
#import <OpenGL/gl.h>

@implementation DeluxeCamera

- (id) init
{        
    [super init];
    translationSpeed = 15.0f;
    rotationSpeed = 30.0f;
    zoomSpeed = 1.0f;
    [self stopAllMotion];
    previousTime = 0.0f;
    return self;
}

- (void) updateTime: (double) currentTime
{
    double timeInterval = currentTime - previousTime;
    float rotation = timeInterval * rotationSpeed;
    float translation = timeInterval * translationSpeed;
    float zoom = timeInterval * zoomSpeed;
    if (isMovingForward)
    {
        [self moveForward:translation];
        //[self translate:0.0:0.0:translation];
    }
    if (isMovingBackward)
    {
        [self moveForward:-translation];
        //[self translate:0.0:0.0:(-1.0 *translation)];
    }
    if (isRotatingYaw)
    {
        [self moveYaw:rotation];
    }
    if (isRotatingPitch)
    {
        [self movePitch:rotation];
    }
    if (isRotatingRoll)
    {
        [self moveRoll:rotation];
    }
    if (isRotatingReverseYaw) 
    {
        [self moveYaw:-rotation];
    }
    if (isRotatingReversePitch) 
    {
        [self movePitch:-rotation];
    }
    if (isRotatingReverseRoll) 
    {
        [self moveRoll:-rotation];
    }
    if (isZoomingIn)
    {
        [self zoomIn:zoom];
    }
    if (isZoomingOut) 
    {
        [self zoomOut:zoom];
    }
    previousTime = currentTime;
}

- (void) setRotationSpeed: (float) s
{
    rotationSpeed = s;
}

- (void) setTranslationSpeed: (float) s
{
    translationSpeed = s;
}

- (void) stopAllMotion
{
    isRotatingYaw = FALSE;
    isRotatingReverseYaw = FALSE;
    isRotatingRoll = FALSE;
    isRotatingReverseRoll = FALSE;
    isRotatingPitch = FALSE;
    isRotatingReversePitch = FALSE;
    isZoomingIn = FALSE;
    isZoomingOut = FALSE;
    isMovingForward = FALSE;
    isMovingBackward = FALSE;    
}

- (void) startMovingForward
{
    isMovingForward = TRUE;
    isMovingBackward = FALSE;
}

- (void) stopMovingForward
{
    isMovingForward = FALSE;
}

- (void) startMovingBackward
{
    isMovingBackward = TRUE;
    isMovingForward = FALSE;
}

- (void) stopMovingBackward
{
    isMovingBackward = FALSE;
}

- (void) startRotatingYaw
{
    isRotatingYaw = TRUE;
    isRotatingReverseYaw = FALSE;
}

- (void) stopRotatingYaw
{
    isRotatingYaw = FALSE;
}

- (void) startRotatingReverseYaw
{
    isRotatingYaw = FALSE;
    isRotatingReverseYaw = TRUE;
    
}

- (void) stopRotatingReverseYaw
{
    isRotatingReverseYaw = FALSE;
}

- (void) startRotatingRoll
{
    isRotatingRoll = TRUE;
    isRotatingReverseRoll = FALSE;
    
}

- (void) stopRotatingRoll
{
    isRotatingRoll = FALSE;
}

- (void) startRotatingReverseRoll
{
    isRotatingRoll = FALSE;
    isRotatingReverseRoll = TRUE;
    
}

- (void) stopRotatingReverseRoll
{
    isRotatingReverseRoll = FALSE;
}

- (void) startRotatingPitch
{
    isRotatingPitch = TRUE;
    isRotatingReversePitch = FALSE;
}

- (void) stopRotatingPitch
{
    isRotatingPitch = FALSE;
}

- (void) startRotatingReversePitch
{
    isRotatingPitch = FALSE;
    isRotatingReversePitch = TRUE;
}

- (void) stopRotatingReversePitch
{
    isRotatingReversePitch = FALSE;
}

- (void) startZoomingIn
{
    isZoomingIn = TRUE;
    isZoomingOut = FALSE;
}

- (void) stopZoomingIn
{
    isZoomingIn = FALSE;
}

- (void) startZoomingOut
{
    isZoomingOut = TRUE;
    isZoomingIn = FALSE;
}

- (void) stopZoomingOut
{
    isZoomingOut = FALSE;
}

- (bool) isMovingForward
{
    return isMovingForward;
}

- (bool) isMovingBackward
{
    return isMovingBackward;
}

- (bool) isRotatingYaw
{
    return isRotatingYaw;
}

- (bool) isRotatingReverseYaw
{
    return isRotatingReverseYaw;
}

- (bool) isRotatingRoll
{
    return isRotatingRoll;
}

- (bool) isRotatingReverseRoll
{
    return isRotatingReverseRoll;
}

- (bool) isRotatingPitch
{
    return isRotatingPitch;
}

- (bool) isRotatingReversePitch
{
    return isRotatingReversePitch;
}

- (bool) isZoomingIn
{
    return isZoomingIn;
}

- (bool) isZoomingOut
{
    return isZoomingOut;
}
@end
