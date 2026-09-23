//
//  Vertex.h
//  OpenGL
//
//  Created by David Stover on Sun Oct 26 2003.
//  Copyright (c) 2003 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
#define PI 3.14159265359
// conversions
#define DEGTORAD 0.0174532925199
#define RADTODEG 57.295779513082
*/
 
@interface Vertex : NSObject {
    float x;
    float y;
    float z;
}
- (id) initWithX:(float)X:(float)Y:(float)Z;
- (float) getX;
- (float) getY;
- (float) getZ;
- (void) setX: (float) _x;
- (void) setY: (float) _y;
- (void) setZ: (float) _z;
+ (Vertex *) midPoint: (Vertex *) v1: (Vertex *) v2;
@end
