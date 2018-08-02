//
//  HHLoopView.h
//  HHLoopView
//
//  Created by hehai on 2018/7/31.
//  Copyright © 2018 riversea2015. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HHLoopDirection) {
    HHLoopHorizontal,
    HHLoopVertical
};

@interface HHLoopView : UIView

/// 是否需要展示 pageControl，默认为YES
@property (nonatomic, assign) BOOL needPageControl;

/**
 初始化方法 - UIImageView

 @param frame 当前view的frame
 @param imgArr 图片数组(支持：UIImage/NSURL/NSString(URLStr or nameStr))
 @param clickAction 点击的回调
 @return 当前类的实例
 */
- (instancetype)initWithFrame:(CGRect)frame
                       images:(NSArray *)imgArr
                    direction:(HHLoopDirection)loopDirection
                  clickAction:(void(^)(int intIndex))clickAction;

/**
 初始化方法 - 自定义视图
 
 @param frame 当前view的frame
 @param customViews 用户自定义视图数组
 @direction 滚动方向
 @param clickAction 点击的回调
 @return 当前类的实例
 */
- (instancetype)initWithFrame:(CGRect)frame
                  customViews:(NSArray *)customViews
                    direction:(HHLoopDirection)loopDirection
                  clickAction:(void (^)(int))clickAction;

@end
