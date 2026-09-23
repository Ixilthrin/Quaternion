//
//  Behavior.h
//  OpenGL
//
//  Created by David Stover on Sun Jun 27 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

// Forward declaration since Model already imports this file
@class Model;

@interface Behavior : NSObject {    
    double previousTime;
    Model *model;
}

- (id) initWithModel: (Model *) m;
- (void) updateModel: (double) currentTime;
@end
