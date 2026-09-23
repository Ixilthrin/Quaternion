//
//  Color.m
//  OpenGL
//
//  Created by David Stover on Sun Nov 23 2003.
//  Copyright (c) 2003 __MyCompanyName__. All rights reserved.
//

#import "Color.h"


@implementation Color
- (id) initWith: (float) r: (float) g: (float) b: (float) a
{
    [super init];
    
    red = r;
    green = g;
    blue = b;
    alpha = a;
    
    return self;
}

- (float) getRed
{
    return red;
}

- (float) getGreen
{
    return green;
}

- (float) getBlue
{
    return blue;
}

- (float) getAlpha
{
    return alpha;
}

@end
