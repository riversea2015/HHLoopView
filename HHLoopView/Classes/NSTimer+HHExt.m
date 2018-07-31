//
//  NSTimer+HHExt.m
//  HHLoopView
//
//  Created by hehai on 2018/7/31.
//

#import "NSTimer+HHExt.h"

@implementation NSTimer (HHExt)

+ (NSTimer *)hh_timerwithTimeInterval:(NSTimeInterval)interval block:(void(^)(void))block repeat:(BOOL)repeat {
    NSTimer *timer = [self scheduledTimerWithTimeInterval:interval
                                                   target:self
                                                 selector:@selector(rs_blockAction:)
                                                 userInfo:[block copy]
                                                  repeats:repeat];
    return timer;
}

+ (void)rs_blockAction:(NSTimer *)timer {
    void(^block)(void) = timer.userInfo;
    if (block) {
        block();
    }
}

@end
