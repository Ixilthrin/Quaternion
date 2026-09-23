//
//  Triangle.h
//  OpenGL
//
//  Created by David Stover on Sun Oct 26 2003.
//  Copyright (c) 2003 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Vertex.h"
#import "Vector.h"

@interface Triangle : NSObject {
    Vertex *v1;
    Vertex *v2;
    Vertex *v3;
    float red;
    float green;
    float blue;
    Vector *_normal;
}
-(id)initWithVertices:(Vertex*)V1:(Vertex*)V2:(Vertex*)V3;
-(void)setColor:(float)r:(float)g:(float)b;
-(void)draw;

@end
