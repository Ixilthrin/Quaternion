//
//  Model.m
//  OpenGL
//
//  Created by David Stover on Sun Oct 26 2003.
//  Copyright (c) 2003 __MyCompanyName__. All rights reserved.
//

#import "Model.h"
#import <OpenGL/gl.h>

@implementation Model

- (id) init
{
    [super init];
    isDynamic = false;
       
    lock = [[NSLock alloc] init];
    
    x = 0;
    y = 0;
    z = 0;
    yaw = 0;
    pitch = 0;
    roll = 0;
   
    [self setBehaviorCount:1];
    Behavior *behavior = [[Behavior alloc] initWithModel:self];
    [self setBehavior:0:behavior];

    return self;
} 

- (bool) isDynamic
{
    return isDynamic;
}

- (void) setDynamic: (bool) value
{
    isDynamic = value;
}

- (void) setX: (float) f
{
    x = f;
}

- (void) setY: (float) f
{
    y = f;
}

- (void) setZ: (float) f
{
    z = f;
}

- (void) setYaw: (float) f
{
    yaw = f;
}

- (void) setPitch: (float) f
{
    pitch = f;
}

- (void) setRoll: (float) f
{
    roll = f;
}

- (void) moveX: (float) f
{
    x += f;
}

- (void) moveY: (float) f
{
    y += f;
}

- (void) moveZ: (float) f
{
    z += f;
}

- (void) moveYaw: (float) degrees
{
    yaw += degrees;
    if (yaw > 360.0) {
        yaw -= 360.0;
    }
}

- (void) movePitch: (float) degrees
{
    pitch += degrees;
    if (pitch > 360.0) {
        pitch -= 360.0;
    }
}

- (void) moveRoll: (float) degrees
{
    roll += degrees;
    if (roll > 360.0) {
        roll -= 360.0;
    }
}

- (int) getComponentCount
{
    return componentCount;
}

- (void) setComponentCount:(int)count
{
    componentCount = count;
    components = (GraphicsComponent **) malloc(count * sizeof(GraphicsComponent*));
}

- (void) setComponent:(int)index:(GraphicsComponent*)component
{
    components[index] = component;
}

- (void) setBehaviorCount:(int)count
{
    behaviorCount = count;
    behaviors = (Behavior **) malloc(count * sizeof(Behavior *));
}

- (void) setBehavior: (int) index: (Behavior *) behavior
{
    behaviors[index] = behavior;
}

- (void) updateTime: (double) currentTime
{
    if ([lock tryLock])
    {
        //printf("behaviorCount = %d\n", behaviorCount);
        int i;
        for (i = 0; i < behaviorCount; ++i) {
            [behaviors[i] updateModel:currentTime];
        }
        
        [lock unlock];
    }
}

- (void) draw
{ 
    if ([lock tryLock]) 
    {
        glTranslatef(x, y, z);        
        glRotatef(pitch, 1, 0, 0);
        glRotatef(yaw, 0, 1, 0);
        glRotatef(roll, 0, 0, 1);
        int index = 0;
        for ( ; index < componentCount; ++index) {
            [components[index] drawTriangles];
        }
        index = 0;
        for ( ; index < componentCount; ++index) {
            [components[index] drawPoints];
        }
        index = 0;
        for ( ; index < componentCount; ++index) {
            [components[index] drawLines];
        }
        
        [lock unlock];
    }
}
@end
