//
//  SinglePoint.h
//  OpenGL
//
//  Created by David Stover on Tue Mar 02 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "Vertex.h"
#import "Vector.h"

@interface SinglePoint : NSObject {
    Vertex *v;
    float red;
    float green;
    float blue;
    Vector *_normal;
}
-(id)initWithVertex:(Vertex*)V;
-(void)setColor:(float)r:(float)g:(float)b;
-(void)setNormal:(Vector *) n;
-(void)draw;

@end
