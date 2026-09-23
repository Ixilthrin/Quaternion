//
//  Line.h
//  OpenGL
//
//  Created by David Stover on Tue Mar 02 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "Vertex.h"
#import "Vector.h"

@interface GraphicsLine : NSObject {
    Vertex *v1;
    Vertex *v2;
    float red;
    float green;
    float blue;
}
-(id)initWithVertices:(Vertex*)V1:(Vertex*)V2;
-(void)setColor:(float)r:(float)g:(float)b;
-(void)draw;

@end