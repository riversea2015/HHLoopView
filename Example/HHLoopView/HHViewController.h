//
//  HHViewController.h
//  HHLoopView
//
//  Created by riversea2015 on 07/31/2018.
//  Copyright (c) 2018 riversea2015. All rights reserved.
//

@import UIKit;

typedef NS_ENUM(NSInteger, HHImgType) {
    HHImgType_LocalName,
    HHImgType_URLString,
    HHImgType_URL,
    HHImgType_Image,
    HHImgType_CustomView
};

@interface HHViewController : UIViewController

- (instancetype)initWithType:(HHImgType)type;

@end
