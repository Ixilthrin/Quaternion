//
//  Model.h
//  OpenGL
//
//  Created by David Stover on Sun Oct 26 2003.
//  Copyright (c) 2003 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GraphicsComponent.h"
#import "Behavior.h"

@interface Model : NSObject {
    GraphicsComponent **components;
    Behavior **behaviors;
    int componentCount;
    int behaviorCount;
    bool isDynamic;
    NSLock *lock;
    
    float x;
    float y;
    float z;
    
    // yaw, pitch, and roll are specified in degrees.
    float yaw;
    float pitch;
    float roll;
}
- (id) init;
- (bool) isDynamic;
- (void) setDynamic: (bool) value;
- (void) setX: (float) f;
- (void) setY: (float) f;
- (void) setZ: (float) f;
- (void) setYaw: (float) f;
- (void) setPitch: (float) f;
- (void) setRoll: (float) f;
- (void) moveX: (float) f;
- (void) moveY: (float) f;
- (void) moveZ: (float) f;
- (void) moveYaw: (float) f;
- (void) movePitch: (float) f;
- (void) moveRoll: (float) f;
- (int) getComponentCount;
- (void) setComponentCount:(int)count;
- (void) setComponent:(int)index:(GraphicsComponent*)component;
- (void) setBehaviorCount:(int) count;
- (void) setBehavior: (int) index: (Behavior *) behavior;
- (void) draw;
- (void) updateTime: (double) currentTime;

@end
