//
//  GraphicsComponent.h
//  OpenGL
//
//  Created by David Stover on Sun Oct 26 2003.
//  Copyright (c) 2003 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Triangle.h"
#import "SinglePoint.h"
#import "GraphicsLine.h"
#import "Material.h"

@interface GraphicsComponent : NSObject {
    Triangle **triangles;
    SinglePoint **points;
    GraphicsLine **lines;
    int triangleCount;
    int pointCount;
    int lineCount;
    Material *material;
    int textureID;
}
- (id) init;
- (id) initWithMaterial: (Material *) m;
- (int) getTriangleCount;
- (int) getPointCount;
- (void) setTriangleCount:(int)count;
- (void) setPointCount: (int) count;
- (void) setLineCount: (int) count;
- (void) setTriangle:(int)index:(Triangle*)triangle;
- (void) setPoint: (int) index: (SinglePoint *) point;
- (void) setLine: (int) index: (GraphicsLine *) line;
- (Triangle*) getTriangle:(int)index;
- (SinglePoint *) getPoint: (int) index;
- (GraphicsLine *) getLine: (int) index;
- (void) drawTriangles;
- (void) drawPoints;
- (void) drawLines;
- (void) setTextureID: (unsigned int) id;

@end
