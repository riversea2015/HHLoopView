//
//  NSTimer+HHExt.m
//  HHLoopView
//
//  Created by hehai on 2018/7/31.
//  Copyright © 2018 riversea2015. All rights reserved.
//

#import "NSTimer+HHExt.h"

@implementation NSTimer (HHExt)

+ (NSTimer *)hh_timerwithTimeInterval:(NSTimeInterval)interval block:(void(^)(void))block repeat:(BOOL)repeat {
    NSTimer *timer = [self scheduledTimerWithTimeInterval:interval
                                                   target:self
                                                 selector:@selector(hh_blockAction:)
                                                 userInfo:[block copy]
                                                  repeats:repeat];
    return timer;
}

+ (void)hh_blockAction:(NSTimer *)timer {
    void(^block)(void) = timer.userInfo;
    if (block) {
        block();
    }
}

@end
