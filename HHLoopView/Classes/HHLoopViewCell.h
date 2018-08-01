//
//  HHLoopViewCell.h
//  HHLoopView
//
//  Created by hehai on 2018/7/31.
//

#import <UIKit/UIKit.h>

@interface HHLoopViewCell : UICollectionViewCell

/// image(UIImage/NSURL/NSStirng)
@property (nonatomic, strong) id image;

+ (NSString *)cellID;

+ (void)registerToCollectionView:(UICollectionView *)collectionView;

@end
