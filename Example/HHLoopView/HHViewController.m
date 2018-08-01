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

    HHLoopView *loopV = [[HHLoopView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 240) images:_imageArr clickAction:^(int intIndex) {
        NSLog(@"-------------------------");
        NSLog(@"------点击了第%d个图片------", intIndex);
        NSLog(@"-------------------------");
    }];
    
    [self.view addSubview:loopV];
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

#pragma mark - dealloc

#if DEBUG

- (void)dealloc {
    NSLog(@"--- (＾－＾) %s (＾－＾) ---", __FUNCTION__);
}

#endif

@end
