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

@implementation HHViewController {
    NSArray *_imageArr;
}

#pragma mark - life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleExecutableKey];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self setupImageLoopView];
}

#pragma mark - init views

- (void)setupImageLoopView {
    
    [self creatImagesArray];

    // 常规
    HHLoopView *loopViewNormal = [[HHLoopView alloc] initWithFrame:CGRectMake(0, 64+10, [UIScreen mainScreen].bounds.size.width, 240)
                                                            images:_imageArr
                                                         direction:HHLoopHorizontal
                                                       clickAction:^(int intIndex)
    {
        NSLog(@"--------------------------------------------------");
        NSLog(@"------ UIImageView did clicked ------ NO.%d ------", intIndex);
        NSLog(@"--------------------------------------------------");
    }];
    [self.view addSubview:loopViewNormal];

    // 用户自定义
    HHLoopView *loopViewCustom = [[HHLoopView alloc] initWithFrame:CGRectMake(0, 64+240+20, [UIScreen mainScreen].bounds.size.width, 240)
                                                            images:@[[self ceateCustomView:[UIColor greenColor] tag:2018080201 imageName:@"HHLoopView_Icon_01"],
                                                                     [self ceateCustomView:[UIColor redColor] tag:2018080202 imageName:@"HHLoopView_Icon_02"],
                                                                     [self ceateCustomView:[UIColor yellowColor] tag:2018080203 imageName:@"HHLoopView_Icon_03"]]
                                                         direction:HHLoopVertical
                                                       clickAction:^(int intIndex)
    {
        NSLog(@"++++++++++++++++++++++++++++++++++++++++++++++++++");
        NSLog(@"++++++ CustomView did clicked ++++++ NO.%d +++++++", intIndex);
        NSLog(@"++++++++++++++++++++++++++++++++++++++++++++++++++");
    }];
    [self.view addSubview:loopViewCustom];
}

- (void)creatImagesArray {
    
    // 1.Local image name
    _imageArr = @[@"HHLoopView_Pic_001", @"HHLoopView_Pic_002", @"HHLoopView_Pic_003"];
    
    // 2.Image URLString
//    _imageArr = @[imageURLStrA, imageURLStrB, imageURLStrC];

    // 3.Image NSURL
//    _imageArr = @[[NSURL URLWithString:imageURLStrA],
//                  [NSURL URLWithString:imageURLStrB],
//                  [NSURL URLWithString:imageURLStrC]];
    
    // 4.UIImage
//    _imageArr = @[[UIImage imageNamed:@"HHLoopView_Pic_001"],
//                  [UIImage imageNamed:@"HHLoopView_Pic_002"],
//                  [UIImage imageNamed:@"HHLoopView_Pic_003"]];
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
