//
//  NSTimer+HHExt.h
//  HHLoopView
//
//  Created by hehai on 2018/7/31.
//  Copyright © 2018 riversea2015. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (HHExt)

+ (NSTimer *)hh_timerwithTimeInterval:(NSTimeInterval)interval block:(void(^)(void))block repeat:(BOOL)repeat;

@end
