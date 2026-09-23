//
//  Light.m
//  OpenGL
//
//  Created by David Stover on Sun Nov 16 2003.
//  Copyright (c) 2003 __MyCompanyName__. All rights reserved.
//

#import "Light.h"
#import <OpenGL/gl.h>

@implementation Light
- (id) init
{
    lightType = DIRECTIONAL;
    ambient = [[Color alloc] initWith:0.0:0.0:0.0:1.0];
    diffuse = [[Color alloc] initWith:1.0:1.0:1.0:1.0];
    specular = [[Color alloc] initWith:0.0:0.0:0.0:1.0];
    positionX = -5.0;
    positionY = 5.0;
    positionZ = -10.0;
    positionW = 0.0;  // If w=0 the light is directional, if w = 1 it is positional
    directionX = 0.0;
    directionY = 0.0;
    directionZ = 1.0;
    spotlightExponent = 0.0;
    spotlightCutoffAngle = 180.0; // Degrees
    constantAttenuationFactor = 1.0;
    linearAttenuationFactor = 0.0;
    quadraticAttenuationFactor = 0.0;
    
    [super init];
    
    return self;
}

- (void) set
{
    float ambientValues[] = {
        [ambient getRed],
        [ambient getGreen],
        [ambient getBlue],
        [ambient getAlpha]
    };
    
    float diffuseValues[] = {
        [diffuse getRed],
        [diffuse getGreen],
        [diffuse getBlue],
        [diffuse getAlpha]
    };
    
    float specularValues[] = {
        [specular getRed],
        [specular getGreen],
        [specular getBlue],
        [specular getAlpha]
    };
    
    glLightfv(GL_LIGHT0, GL_AMBIENT, ambientValues);
    glLightfv(GL_LIGHT0, GL_DIFFUSE, diffuseValues);
    glLightfv(GL_LIGHT0, GL_SPECULAR, specularValues);
    
    if (lightType == DIRECTIONAL) {
        GLfloat lightDirection[] = {
            directionX, directionY, directionZ, 0.0
        };
        glLightfv(GL_LIGHT0, GL_POSITION, lightDirection);        
    } else {
        GLfloat lightPosition[] = {
            positionX, positionY, positionZ, 1.0
        };        
        GLfloat spotDirection[] = {
            directionX,
            directionY,
            directionZ
        };
        glLightfv(GL_LIGHT0, GL_POSITION, lightPosition);        
        glLightfv(GL_LIGHT0, GL_SPOT_DIRECTION, spotDirection);
    }
    glLightf(GL_LIGHT0, GL_SPOT_EXPONENT, spotlightExponent);
    glLightf(GL_LIGHT0, GL_SPOT_CUTOFF, spotlightCutoffAngle);
    glLightf(GL_LIGHT0, GL_CONSTANT_ATTENUATION, constantAttenuationFactor);
    glLightf(GL_LIGHT0, GL_LINEAR_ATTENUATION, linearAttenuationFactor);
    glLightf(GL_LIGHT0, GL_QUADRATIC_ATTENUATION, quadraticAttenuationFactor);
}
@end
