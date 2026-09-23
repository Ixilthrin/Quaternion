//
//  DeluxeCamera.h
//  OpenGL
//
//  Created by David Stover on Sun Nov 02 2003.
//  Copyright (c) 2003 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StandardCamera.h"

@interface DeluxeCamera : StandardCamera {    
    float rotationSpeed;  // degrees per second
    float translationSpeed;
    float zoomSpeed;
    double previousTime;
    
    bool isMovingForward;
    bool isMovingBackward;
    bool isRotatingYaw;
    bool isRotatingReverseYaw;
    bool isRotatingRoll;
    bool isRotatingReverseRoll;
    bool isRotatingPitch;
    bool isRotatingReversePitch;
    bool isZoomingIn;
    bool isZoomingOut;
}
- (void) updateTime: (double) timeInterval;
- (void) setRotationSpeed: (float) s;
- (void) setTranslationSpeed: (float) s;
- (void) stopAllMotion;
- (void) startMovingForward;
- (void) stopMovingForward;
- (void) startMovingBackward;
- (void) stopMovingBackward;
- (void) startRotatingYaw;
- (void) stopRotatingYaw;
- (void) startRotatingReverseYaw;
- (void) stopRotatingReverseYaw;
- (void) startRotatingRoll;
- (void) stopRotatingRoll;
- (void) startRotatingReverseRoll;
- (void) stopRotatingReverseRoll;
- (void) startRotatingPitch;
- (void) stopRotatingPitch;
- (void) startRotatingReversePitch;
- (void) stopRotatingReversePitch;
- (void) startZoomingIn;
- (void) stopZoomingIn;
- (void) startZoomingOut;
- (void) stopZoomingOut;
- (bool) isMovingForward;
- (bool) isMovingBackward;
- (bool) isRotatingYaw;
- (bool) isRotatingReverseYaw;
- (bool) isRotatingRoll;
- (bool) isRotatingReverseRoll;
- (bool) isRotatingPitch;
- (bool) isRotatingReversePitch;
- (bool) isZoomingIn;
- (bool) isZoomingOut;
@end
