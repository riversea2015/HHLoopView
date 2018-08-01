//
//  HHLoopViewCell.m
//  HHLoopView
//
//  Created by hehai on 2018/7/31.
//

#import "HHLoopViewCell.h"

@interface HHLoopViewCell ()

/// mainImageView
@property (nonatomic, strong) UIImageView *mainImgV;

@end

@implementation HHLoopViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    
    [self addSubview:self.mainImgV];
}

- (void)setImage:(id)image {
    _image = image;
    
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
