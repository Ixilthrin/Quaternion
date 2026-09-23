#import "TimeManager.h"
#import <sys/time.h>

#define MILLION 1000000.000000

static TimeManager *instance = nil;

@implementation TimeManager

+ (TimeManager *) getInstance
{
    if (instance == nil) {
        instance = [[TimeManager alloc] init];
    }
    [instance start];
    return instance;
}

- (id) init
{
    initialTime = [TimeManager getTimeInSeconds];
    previousStopTime = 0.0f;
    totalStopTime = 0.0f;
    isStopped = false;
    return [super init];
}

+ (double) getTimeInSeconds
{
    /*  Declarations in time.h - Shown here for convenience.
    struct timeval {
	int32_t	tv_sec;		// seconds
	int32_t	tv_usec;	// and microseconds
    };
    struct timezone {
	int	tz_minuteswest;	// minutes west of Greenwich
	int	tz_dsttime;	// type of dst correction
    };
    */
    
    struct timeval tVal;
    struct timezone tZone;
    
    gettimeofday(&tVal, &tZone);
    
    int i_seconds = tVal.tv_sec;
    int microseconds = tVal.tv_usec;
    double seconds = (double) i_seconds + (double) ((double) microseconds / (double) MILLION);
    //printf("seconds = %f\n", seconds);
    
    return seconds;
}

- (double) getGameTime
{
    double currentTime = [TimeManager getTimeInSeconds];
    //printf("currenttime=%f\n", currentTime);
    //printf("initial=%f\n", initialTime);
    //printf("total stop=%f\n", totalStopTime);
    return currentTime - totalStopTime - initialTime;
}

-(void)stop
{
    if (isStopped) {
        return;
    }
    isStopped = true;
    previousStopTime = [TimeManager getTimeInSeconds];
}

-(void)start
{
    if (!isStopped) {
        return;
    }
    totalStopTime += [TimeManager getTimeInSeconds] - previousStopTime;
    isStopped = false;
}

-(bool)isStopped
{
    return isStopped;
}

@end
