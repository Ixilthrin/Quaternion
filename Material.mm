//
//  Material.m
//  OpenGL
//
//  Created by David Stover on Sun Nov 16 2003.
//  Copyright (c) 2003 __MyCompanyName__. All rights reserved.
//

#import "Material.h"
#import <OpenGL/gl.h>

@implementation Material

- (id) init
{    
    [super init];
    
    return self;
}

- (id) initWithDefaults
{
    ambient = [[Color alloc] initWith:0.0:1.0:1.0:1.0];
    diffuse = [[Color alloc] initWith:0.3:1.0:0.3:1.0];
    specular = [[Color alloc] initWith:0.0:0.0:0.0:1.0];
    emissive = [[Color alloc] initWith:0.0:0.0:0.0:0.0];    
    shininess = 0.0;  // 0 - 128.0
    
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
    
    float emissiveValues[] = {
        [emissive getRed],
        [emissive getGreen],
        [emissive getBlue],
        [emissive getAlpha]
    };
        
    glMaterialfv(GL_FRONT, GL_AMBIENT, ambientValues);
    glMaterialfv(GL_FRONT, GL_DIFFUSE, diffuseValues);
    glMaterialfv(GL_FRONT, GL_SPECULAR, specularValues);
    glMaterialfv(GL_FRONT, GL_EMISSION, emissiveValues);
    glMaterialf(GL_FRONT, GL_SHININESS, shininess);
}

- (void) setAmbient: (Color*) color
{
    ambient = color;
}

- (void) setDiffuse: (Color*) color
{
    diffuse = color;
}

- (void) setSpecular: (Color*) color
{
    specular = color;
}

- (void) setEmissive: (Color*) color
{
    emissive = color;
}

- (void) setShininess: (float) f
{
    shininess = f;
}

@end
