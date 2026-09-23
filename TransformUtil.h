//
//  TransformUtil.h
//  OpenGL
//
//  Created by David Stover on Sat Aug 07 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Vector;

@interface TransformUtil : NSObject {    
}

+ (Vector *) rotate: (Vector *) v: (float) yaw: (float) pitch: (float) roll;

@end
