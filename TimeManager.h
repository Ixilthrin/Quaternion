/*
 *  TimeManager.h
 *  OpenGLTest
 *
 *  Created by David Stover on Mon Oct 13 2003.
 *  Copyright (c) 2003 __MyCompanyName__. All rights reserved.
 *
 */

#import <Carbon/Carbon.h>

@interface TimeManager : NSObject
{
    double initialTime;
    double previousStopTime;
    double totalStopTime;
    bool isStopped;
}
+ (TimeManager *) getInstance;
-(id) init;
+ (double) getTimeInSeconds;
- (double) getGameTime;
- (void) stop;
- (void) start;
- (bool) isStopped;

@end