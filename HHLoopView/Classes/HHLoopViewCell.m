//
//  HHLoopViewCell.m
//  HHLoopView
//
//  Created by hehai on 2018/7/31.
//  Copyright © 2018 riversea2015. All rights reserved.
//

#import "HHLoopViewCell.h"

@interface HHLoopViewCell ()

/// mainImageView
@property (nonatomic, strong) UIImageView *mainImgV;
/// CustomView
@property (nonatomic, strong) UIView *customView;

@end

@implementation HHLoopViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    [self addSubview:self.mainImgV];
}

- (void)setImage:(id)image {
    
    _image = image;
    _mainImgV.hidden = NO;
    
    if ([image isKindOfClass:[UIImage class]]) {
        
        _mainImgV.image = image;
        
    } else if ([image isKindOfClass:[NSURL class]]) {
        
        [_mainImgV sd_setImageWithURL:image];
        
    } else if ([image isKindOfClass:[NSString class]]) {
        
        if ([self isValidUrl:(NSString *)image]) {
            [_mainImgV sd_setImageWithURL:[NSURL URLWithString:image]];
        } else {
            _mainImgV.image = [UIImage imageNamed:image];
        }
        
    } else if ([image isKindOfClass:[UIView class]]) {
        
        _customView = image;
        _customView.userInteractionEnabled = YES;
        
        [self addSubview:_customView];
        
    } else {
        _mainImgV.image = nil;
    }
}

- (BOOL)isValidUrl:(NSString *)url {
    NSString *regex = @"[a-zA-z]+://[^\\s]*";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [urlTest evaluateWithObject:url];
}

- (UIImageView *)mainImgV {
    if (!_mainImgV) {
        _mainImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [_mainImgV sd_setShowActivityIndicatorView:YES];
        _mainImgV.hidden = YES;
    }
    return _mainImgV;
}

#pragma mark - override

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//
//}

#pragma mark - Class Method

+ (NSString *)cellID {
    return NSStringFromClass([self class]);
}

+ (void)registerToCollectionView:(UICollectionView *)collectionView {
    [collectionView registerClass:[self class] forCellWithReuseIdentifier:[self cellID]];
}

@end
