//
//  Color.h
//  OpenGL
//
//  Created by David Stover on Sun Nov 23 2003.
//  Copyright (c) 2003 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Color : NSObject {
    float red;
    float green;
    float blue;
    float alpha;
}
- (id) initWith: (float) r: (float) g: (float) b: (float) a;
- (float) getRed;
- (float) getGreen;
- (float) getBlue;
- (float) getAlpha;

@end
