//
//  Light.h
//  OpenGL
//
//  Created by David Stover on Sun Nov 16 2003.
//  Copyright (c) 2003 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Color.h"

@interface Light : NSObject {
    enum {
        DIRECTIONAL,
        POSITIONAL
    };
    int lightType;
    Color *ambient;
    Color *diffuse;
    Color *specular;
    float positionX;
    float positionY;
    float positionZ;
    float positionW;
    float directionX;
    float directionY;
    float directionZ;
    float spotlightExponent;
    float spotlightCutoffAngle;
    float constantAttenuationFactor;
    float linearAttenuationFactor;
    float quadraticAttenuationFactor;
}
- (id) init;
- (void) set;
@end
