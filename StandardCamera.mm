//
//  StandardCamera.m
//  OpenGL
//
//  Created by David Stover on Sun Mar 28 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import "StandardCamera.h"
#import "math.h"
#import "Vertex.h"
#import "Vector.h"
#import "TransformUtil.h"

#include "MathLib.h"

@implementation StandardCamera

- (id) init
{    
    [super init];
    
    tripod = nil;
    viewAngle = PI / 8.0f;
    farDistance = 10000.0;
    nearDistance = 1.0;
    maxX = nearDistance * tan(viewAngle/2.0f);
    minX = -1.0f * maxX;
    minY = minX;
    maxY = maxX;
    
    [self resetPosition];
    
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
}

- (void) zoomIn: (float) angle
{
    viewAngle -= angle;
    maxX = nearDistance * tan(viewAngle/2.0f);
    minX = -1.0f * maxX;
    minY = minX;
    maxY = maxX;
}

- (void) zoomOut: (float) angle
{
    viewAngle += angle;
    maxX = nearDistance * tan(viewAngle/2.0f);
    minX = -1.0f * maxX;
    minY = minX;
    maxY = maxX;
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

// Move in direction camera is pointing.
- (void) moveForward: (float) distance
{         
    float deltaX = distance * currentZAxis->x;
    float deltaY = distance * currentZAxis->y;
    float deltaZ = distance * currentZAxis->z;
    
    [self translate:deltaX:deltaY:deltaZ];
}

- (void) setYaw: (float) y
{
    printf("setting yaw = %f\n", y);
    
    currentYaw = y;
    //[self updateDirection];
}

- (void) setPitch: (float) p
{
    currentPitch = p;
    //[self updateDirection];
}

- (void) setRoll: (float) r
{
    currentRoll = r;
    //[self updateDirection];
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
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
       
    // Note: Because the camera is pointing in the negative z direction,
    // the front (near) clipping  plane is the plane z = -nearDistance,
    // and the back (far) clipping plane is the plane z = -farDistance.
    // minX, maxX, minY, and maxY are the parameters for the near plane.
    // nearDistance and farDistance should always be positive (as distances should be)
    
    // 3rd project the points in the frustum to a unit cube
    glFrustum(minX, maxX, minY, maxY, nearDistance, farDistance);
    
}

- (void) prepareView
{
    glMatrixMode(GL_MODELVIEW);
    
    if (initialCameraPosition) {
        glLoadIdentity();
        initialCameraPosition = false;
    } else {
        glPopMatrix();        
    }
    
    glRotatef(-currentRoll, currentZAxis->x, currentZAxis->y, currentZAxis->z);
    glRotatef(-currentYaw, currentYAxis->x, currentYAxis->y, currentYAxis->z);
    glRotatef(-currentPitch, currentXAxis->x, currentXAxis->y, currentXAxis->z);
    
    glPushMatrix();
    
    currentZAxis->rotate(currentYAxis, currentYaw);
    currentZAxis->rotate(currentXAxis, currentPitch);
    currentYAxis->rotate(currentXAxis, currentPitch);
    currentYAxis->rotate(currentZAxis, currentRoll);
    currentXAxis->rotate(currentYAxis, currentYaw);
    currentXAxis->rotate(currentZAxis, currentRoll);
    
    currentYaw = 0.0;
    currentPitch = 0.0;
    currentRoll = 0.0;
}

// Should be called from the system thread through callback
// functions in NSView such as drawRect and keyDown, etc.
- (void) doView
{        
    glPopMatrix();
    glPushMatrix();
    // 1st translate to the proper point of view (the eye position)
    // Note that we are translating the model in the negative
    // translation of the camera to simulate that the camera is being translated.
    glTranslatef(-eyeX, -eyeY, -eyeZ);    
}

- (void) resetPosition
{
    initialCameraPosition = true;
    
    eyeX = 0.0;
    eyeY = 0.0;
    eyeZ = -10.0;
    
    // Orientation of camera with respect to world coordinates.
    currentYaw = 180.0;  // Point the camera in the +z direction.
    currentPitch = 0.0;
    currentRoll = 0.0;
    
    currentXAxis = new Vector3(1.0, 0.0, 0.0);
    currentYAxis = new Vector3(0.0, 1.0, 0.0);
    currentZAxis = new Vector3(0.0, 0.0, -1.0);
    
}
@end
