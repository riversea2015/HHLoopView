//
//  HHEntranceVC.m
//  HHLoopView_Example
//
//  Created by hehai on 2018/7/31.
//  Copyright © 2018 riversea2015. All rights reserved.
//

#import "HHEntranceVC.h"
#import "HHViewController.h"
#import "HHLoopView_Macro.h"

static const NSInteger HHBtnTag = 180900;
static const NSInteger HHBtnW = 220;
static const NSInteger HHBtnH = 50;
static const NSInteger HHBtnY = 200;
static const NSInteger HHBtnMargin = 20;

@interface HHEntranceVC ()

/// title Array
@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation HHEntranceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleExecutableKey];
    
    [self setupViews];
}

- (void)setupViews {
    
    _titleArray = @[@"LoopView - LocalName",
                    @"LoopView - URLString",
                    @"LoopView - URL",
                    @"LoopView - Image",
                    @"LoopView - CustomView"];
    
    for (int i = 0; i < _titleArray.count; i++) {
        [self createBtnNodeWithTitle:_titleArray[i] tag:HHBtnTag+i];
    }
}

- (UIButton *)createBtnNodeWithTitle:(NSString *)strTitle tag:(NSInteger)intTag {
    
    UIButton *btnNode = [UIButton buttonWithType:UIButtonTypeCustom];
    btnNode.titleLabel.font = [UIFont systemFontOfSize:18];
    [btnNode setTitle:strTitle forState:UIControlStateNormal];
    btnNode.tag = intTag;
    btnNode.backgroundColor = intTag%2 ? [UIColor redColor] : [UIColor greenColor];
    [btnNode addTarget:self action:@selector(jumpToMainVC:) forControlEvents:UIControlEventTouchUpInside];
    btnNode.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width-HHBtnW)/2, HHBtnY+(HHBtnH+HHBtnMargin)*(intTag-HHBtnTag), HHBtnW, HHBtnH);
    [self.view addSubview:btnNode];
    
    return btnNode;
}

- (void)jumpToMainVC:(UIButton *)sender {
    HHViewController *vc = [[HHViewController alloc] initWithType:sender.tag-HHBtnTag];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
