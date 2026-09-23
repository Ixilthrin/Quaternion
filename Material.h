//
//  Material.h
//  OpenGL
//
//  Created by David Stover on Sun Nov 16 2003.
//  Copyright (c) 2003 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Color.h"

@interface Material : NSObject {
    Color *ambient;
    Color *diffuse;
    Color *specular;
    Color *emissive;
    float shininess;
}
- (id) init;
- (id) initWithDefaults;
- (void) set;
- (void) setAmbient: (Color*) color;
- (void) setDiffuse: (Color*) color;
- (void) setSpecular: (Color*) color;
- (void) setEmissive: (Color*) color;
- (void) setShininess: (float) f;

@end
