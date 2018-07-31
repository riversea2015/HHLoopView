//
//  HHViewController.m
//  HHLoopView
//
//  Created by riversea2015 on 07/31/2018.
//  Copyright (c) 2018 riversea2015. All rights reserved.
//

#import "HHViewController.h"
#import <HHLoopView/HHLoopView.h>

@implementation HHViewController {
    NSArray *_imageArr;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleExecutableKey];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self setupImageLoopView];
}

- (void)setupImageLoopView {
    
    _imageArr = @[@"HHLoopView_Pic_001", @"HHLoopView_Pic_002", @"HHLoopView_Pic_003"];
    
    HHLoopView *loopV = [[HHLoopView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 200) images:_imageArr clickAction:^(int intIndex) {
        NSLog(@"-------------------");
        NSLog(@"---点击了第%d个图片---", intIndex);
        NSLog(@"-------------------");
    }];
    
    [self.view addSubview:loopV];
}

- (void)dealloc {
    NSLog(@"---%s被销毁了---", __FUNCTION__);
}

@end
