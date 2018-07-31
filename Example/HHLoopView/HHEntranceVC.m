//
//  HHEntranceVC.m
//  HHLoopView_Example
//
//  Created by hehai on 2018/7/31.
//  Copyright © 2018 riversea2015. All rights reserved.
//

#import "HHEntranceVC.h"
#import "HHViewController.h"

@interface HHEntranceVC ()

@end

@implementation HHEntranceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createBtnNodeWithTitle:@"点击跳转" tag:201811];
}

- (UIButton *)createBtnNodeWithTitle:(NSString *)strTitle tag:(NSInteger)intTag {
    
    UIButton *btnNode = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnNode setTitle:strTitle forState:UIControlStateNormal];
    btnNode.titleLabel.font = [UIFont systemFontOfSize:24];
    btnNode.tag = intTag;
    btnNode.backgroundColor = [UIColor redColor];
    [btnNode addTarget:self action:@selector(jumpToMainVC:) forControlEvents:UIControlEventTouchUpInside];
    btnNode.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width-100)/2, 100, 100, 100);
    [self.view addSubview:btnNode];
    
    return btnNode;
}

- (void)jumpToMainVC:(UIButton *)sender {
    HHViewController *vc = [HHViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
