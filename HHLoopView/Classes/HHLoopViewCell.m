//
//  HHLoopViewCell.m
//  HHLoopView
//
//  Created by hehai on 2018/7/31.
//

#import "HHLoopViewCell.h"

@interface HHLoopViewCell ()

/// 主图
@property (nonatomic, strong) UIImageView *mainImgV;

@end

@implementation HHLoopViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    
    [self addSubview:self.mainImgV];
}

- (void)setImageName:(NSString *)imageName {
    _imageName = imageName;
    
    _mainImgV.image = [UIImage imageNamed:imageName];
}

- (UIImageView *)mainImgV {
    if (!_mainImgV) {
        _mainImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    }
    return _mainImgV;
}

+ (NSString *)cellID {
    return NSStringFromClass([self class]);
}

+ (void)registerToCollectionView:(UICollectionView *)collectionView {
    [collectionView registerClass:[self class] forCellWithReuseIdentifier:[self cellID]];
}

@end
