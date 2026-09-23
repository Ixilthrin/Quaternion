//
//  Scene.h
//  OpenGL
//
//  Created by David Stover on Sun Oct 26 2003.
//  Copyright (c) 2003 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Camera.h"

@interface Scene : NSObject {
    Camera *camera;
}
- (void) setCamera: (Camera *) camera;
- (void) doLighting;
- (void) draw;
@end