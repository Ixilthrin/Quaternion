//
//  StandardCamera.h
//  OpenGL
//
//  Created by David Stover on Sun Mar 28 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Camera.h"

#import <Cocoa/Cocoa.h>

class Vector3;

@interface StandardCamera : Camera {
    Tripod *tripod;
    float viewAngle;
    float farDistance;
    float nearDistance;
    float minX;  
    float maxX;
    float minY;
    float maxY;
    float eyeX;
    float eyeY;
    float eyeZ;
    float currentYaw;
    float currentPitch;
    float currentRoll;
    Vector3 *currentXAxis;
    Vector3 *currentYAxis;
    Vector3 *currentZAxis;
    bool initialCameraPosition;
}
- (id) init;
- (void) prepareView;
- (void) doView;
- (void) doProjection;
- (void) setTripod: (Tripod *) t;
- (void) translate: (float) x: (float) y: (float) z;
- (void) zoomIn: (float) distance;
- (void) zoomOut: (float) distance;
- (void) moveYaw: (float) degrees;
- (void) movePitch: (float) degrees;
- (void) moveRoll: (float) degrees;
- (void) moveForward: (float) distance;  // Move in direction camera is pointing.
- (void) setYaw: (float) y;
- (void) setPitch: (float) p;
- (void) setRoll: (float) r;
- (void) setFarDistance: (float) distance;
- (void) setNearDistance: (float) distance;
- (void) setMinX: (float) m;
- (void) setMaxX: (float) m;
- (void) setMinY: (float) m;
- (void) setMaxY: (float) m;
- (void) setEyeX: (float) e;
- (void) setEyeY: (float) e;
- (void) setEyeZ: (float) e;
- (float) getYaw;
- (float) getPitch;
- (float) getRoll;
- (float) getFarDistance;
- (float) getNearDistance;
- (float) getMinX;
- (float) getMaxX;
- (float) getMinY;
- (float) getMaxY;
- (float) getEyeX;
- (float) getEyeY;
- (float) getEyeZ;
- (void) resetPosition;

@end
