//
//  HHLoopViewCell.h
//  HHLoopView
//
//  Created by hehai on 2018/7/31.
//

#import <UIKit/UIKit.h>

@interface HHLoopViewCell : UICollectionViewCell

/// 图片名称
@property (nonatomic, copy) NSString *imageName;

+ (NSString *)cellID;

+ (void)registerToCollectionView:(UICollectionView *)collectionView;

@end
