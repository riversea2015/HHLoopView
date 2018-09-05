//
//  HHViewController.m
//  HHLoopView
//
//  Created by riversea2015 on 07/31/2018.
//  Copyright (c) 2018 riversea2015. All rights reserved.
//

#import "HHViewController.h"
#import <HHLoopView/HHLoopView.h>

static NSString * const imageURLStrA = @"https://img1.360buyimg.com/da/jfs/t24562/184/1418104397/214103/e874a7f/5b5fc408N35c13ba2.jpg";
static NSString * const imageURLStrB = @"https://img1.360buyimg.com/da/jfs/t24274/246/1424986034/488086/9c0f26c4/5b5fd9c7N02885d73.jpg";
static NSString * const imageURLStrC = @"https://img1.360buyimg.com/da/jfs/t22870/361/1339872747/169156/89e765aa/5b5c0b22N29eadd89.jpg";


@interface HHViewController ()

@property (nonatomic, assign) HHImgType imgType;

@end


@implementation HHViewController {
    NSArray *_imageArr;
}

#pragma mark - life cycle

- (instancetype)initWithType:(HHImgType)type {
    self = [super init];
    if (self) {
        _imgType = type;
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
	self.title = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleExecutableKey];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self setupImageLoopView];
}

#pragma mark - init views

- (void)setupImageLoopView {
    
    // Horizontal
    HHLoopView *loopViewNormal = [[HHLoopView alloc] initWithFrame:CGRectMake(0, 64+10, [UIScreen mainScreen].bounds.size.width, 240)
                                                            images:[self imageArrayWithType:_imgType]
                                                         direction:HHLoopHorizontal
                                                       clickAction:^(int intIndex)
    {
        NSLog(@"------ HHLoopView - Horizontal did clicked ------ NO.%d ------", intIndex);
    }];
    [self.view addSubview:loopViewNormal];

    // Vertical
    HHLoopView *loopViewCustom = [[HHLoopView alloc] initWithFrame:CGRectMake(0, 64+240+20, [UIScreen mainScreen].bounds.size.width, 240)
                                                            images:[self imageArrayWithType:_imgType]
                                                         direction:HHLoopVertical
                                                       clickAction:^(int intIndex)
    {
        NSLog(@"++++++ HHLoopView - Vertical did clicked ++++++ NO.%d +++++++", intIndex);
    }];
    [self.view addSubview:loopViewCustom];
}

#pragma mark - prepare data & create view

- (NSArray *)imageArrayWithType:(HHImgType)imgType {
    
    NSArray *imageArr = nil;
    
    switch (imgType) {
        case HHImgType_LocalName:
            imageArr = @[@"HHLoopView_Pic_001", @"HHLoopView_Pic_002", @"HHLoopView_Pic_003"];
            break;
        case HHImgType_URLString:
            imageArr = @[imageURLStrA, imageURLStrB, imageURLStrC];
            break;
        case HHImgType_URL:
            imageArr = @[[NSURL URLWithString:imageURLStrA],
                         [NSURL URLWithString:imageURLStrB],
                         [NSURL URLWithString:imageURLStrC]];
            break;
        case HHImgType_Image:
            imageArr = @[[UIImage imageNamed:@"HHLoopView_Pic_001"],
                         [UIImage imageNamed:@"HHLoopView_Pic_002"],
                         [UIImage imageNamed:@"HHLoopView_Pic_003"]];
            break;
        case HHImgType_CustomView:
            imageArr = @[[self ceateCustomView:[UIColor greenColor] tag:2018080201 imageName:@"HHLoopView_Icon_01"],
                         [self ceateCustomView:[UIColor redColor] tag:2018080202 imageName:@"HHLoopView_Icon_02"],
                         [self ceateCustomView:[UIColor yellowColor] tag:2018080203 imageName:@"HHLoopView_Icon_03"]];
            break;
        default:
            break;
    }
    
    return imageArr;
}

- (UIView *)ceateCustomView:(UIColor *)color tag:(NSInteger)tag imageName:(NSString *)imageName {
    
    UIView *customV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 240)];
    customV.backgroundColor = color;
    
    UILabel *testL = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, [UIScreen mainScreen].bounds.size.width-40, 30)];
    testL.text = [NSString stringWithFormat:@"CustomView -- NO.%ld", tag];
    testL.backgroundColor = [UIColor whiteColor];
    testL.textAlignment = NSTextAlignmentCenter;
    [customV addSubview:testL];
    
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 120-30, 60, 60)];
    imgV.image = [UIImage imageNamed:imageName];
    [customV addSubview:imgV];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 120-30, [UIScreen mainScreen].bounds.size.width-120, 60);
    btn.backgroundColor = [UIColor whiteColor];
    btn.titleLabel.font = [UIFont systemFontOfSize:22];
    btn.tag = tag+10;
    [btn setTitle:[NSString stringWithFormat:@"Click Here! - NO.%ld", tag+10] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [customV addSubview:btn];
    
    return customV;
}

- (void)clickBtn:(UIButton *)sender {
    NSLog(@"---- 🎉 You are clicking the right button : NO.%ld 🎉 ----", sender.tag);
}

#pragma mark - dealloc

#if DEBUG

- (void)dealloc {
    NSLog(@"--- (＾－＾) %s (＾－＾) ---", __FUNCTION__);
}

#endif

@end
