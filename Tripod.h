//
//  Tripod.h
//  OpenGL
//
//  Created by David Stover on Sun Nov 02 2003.
//  Copyright (c) 2003 __MyCompanyName__. All rights reserved.
//

// A fixture on which a camera is attached.

#import <Foundation/Foundation.h>


@interface Tripod : NSObject {
    float positionX;
    float positionY;
    float positionZ;
    float yaw;
    float pitch;
    float roll;
}

- (void) setPositionX: (float) x;
- (void) setPositionY: (float) y;
- (void) setPositionZ: (float) z;
- (void) setYaw: (float) y;
- (void) setPitch: (float) p;
- (void) setRoll: (float) r;
- (float) getPositionX;
- (float) getPositionY;
- (float) getPositionZ;
- (float) getYaw;
- (float) getPitch;
- (float) getRoll;

@end
