//
//  TransformUtil.m
//  OpenGL
//
//  Created by David Stover on Sat Aug 07 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import "TransformUtil.h"
#include "Vector.h"
#include "Vertex.h"
#include "MathLib.h"

@implementation TransformUtil
+ (Vector *) rotate: (Vector *) v: (float) yaw: (float) pitch: (float) roll
{
    float yaw_rad = yaw * DEG_TO_RAD;
    float pitch_rad = pitch * DEG_TO_RAD;
    float roll_rad = roll * DEG_TO_RAD;
    
    //printf("yaw_rad = %f\n", yaw_rad);
    //printf("pitch_rad = %f\n", pitch_rad);
    //printf("roll_rad = %f\n", roll_rad);
    
    float x = [v X];
    float y = [v Y];
    float z = [v Z];
    
    //printf("x = %f\n", x); 
    //printf("y = %f\n", y); 
    //printf("z = %f\n", z);
    
    float xTemp = 0.0;
    float yTemp = 0.0;
    
    // Rotate about x-axis (pitch)
    yTemp = y;
    y = y * cos(pitch_rad) - z * sin(pitch_rad);
    z = yTemp * sin(pitch_rad) + z * cos(pitch_rad);
    
    // Rotate about y-axis (yaw)
    xTemp = x;
    x = x * cos(yaw_rad) + z * sin(yaw_rad);
    z = -xTemp * sin(yaw_rad) + z * cos(yaw_rad);
    
    // Rotate about z-axis (roll)
    xTemp = x;
    x = x * cos(roll_rad) - y * sin(roll_rad);
    y = xTemp * sin(roll_rad) + y * cos(roll_rad);
    
    Vector *result = [[Vector alloc] init:x:y:z];
    result = [result asUnit];
    
    return result;
}
@end
