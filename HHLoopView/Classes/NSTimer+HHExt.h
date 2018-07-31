//
//  NSTimer+HHExt.h
//  HHLoopView
//
//  Created by hehai on 2018/7/31.
//

#import <Foundation/Foundation.h>

@interface NSTimer (HHExt)

+ (NSTimer *)rs_timerwithTimeInterval:(NSTimeInterval)interval block:(void(^)())block repeat:(BOOL)repeat;

@end
