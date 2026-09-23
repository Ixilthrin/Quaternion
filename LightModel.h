//
//  LightModel.h
//  OpenGL
//
//  Created by David Stover on Sun Nov 16 2003.
//  Copyright (c) 2003 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LightModel : NSObject {
    float ambientRed;
    float ambientGreen;
    float ambientBlue;
    float ambientAlpha;
}
- (id) init;
- (void) set;  // Call the OpenGL functions.

@end
