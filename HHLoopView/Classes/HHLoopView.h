//
//  HHLoopView.h
//  HHLoopView
//
//  Created by hehai on 2018/7/31.
//

#import <UIKit/UIKit.h>

@interface HHLoopView : UIView

/**
 init method

 @param frame frame
 @param imgArr imgArr
 @param clickAction clickAction
 @return A HHLoopView object
 */
- (instancetype)initWithFrame:(CGRect)frame images:(NSArray *)imgArr clickAction:(void(^)(int intIndex))clickAction;

@end
