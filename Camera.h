//
//  Camera.h
//  OpenGL
//
//  Created by David Stover on Sat Nov 01 2003.
//  Copyright (c) 2003 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tripod.h"
#import <OpenGL/gl.h>

// A Camera moves on its tripod
// Its yaw, pitch, and roll move independently from the tripod's yaw, pitch, and roll,
// but its position in space is solely determined by the tripod's position.

@interface Camera : NSObject {
}
- (id) init;
- (void) prepareView;
- (void) doView;
- (void) doProjection;
- (void) resetPosition;

@end
