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
 @param imgArr 图片数组(UIImage/NSURL/NSString(URLStr or nameStr)/nil
 @param clickAction 点击的block
 @return A HHLoopView object
 */
- (instancetype)initWithFrame:(CGRect)frame images:(NSArray *)imgArr clickAction:(void(^)(int intIndex))clickAction;

@end
