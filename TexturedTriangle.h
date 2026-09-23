//
//  TexturedTriangle.h
//  OpenGL
//
//  Created by David Stover on Sat May 29 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Triangle.h"

@interface TexturedTriangle : Triangle {
    float t1_a;
    float t1_b;
    float t2_a;
    float t2_b;
    float t3_a;
    float t3_b;
}
-(id)initWithVertices:(Vertex*)V1:(Vertex*)V2:(Vertex*)V3;
- (void) setTexCoords:(float) _t1_a: (float) _t1_b: (float) _t2_a: (float) _t2_b:
        (float) _t3_a: (float) _t3_b;
-(void)draw;

@end
