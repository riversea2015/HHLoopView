# HHLoopView

[![CI Status](https://img.shields.io/travis/riversea2015/HHLoopView.svg?style=flat)](https://travis-ci.org/riversea2015/HHLoopView)
[![Version](https://img.shields.io/cocoapods/v/HHLoopView.svg?style=flat)](https://cocoapods.org/pods/HHLoopView)
[![License](https://img.shields.io/cocoapods/l/HHLoopView.svg?style=flat)](https://cocoapods.org/pods/HHLoopView)
[![Platform](https://img.shields.io/cocoapods/p/HHLoopView.svg?style=flat)](https://cocoapods.org/pods/HHLoopView)

## 中文介绍

## 示例工程

拷贝 repo 到本地，切换到 Example 目录下，终端运行 `pod install` 后就可以正常使用了^_^

## 屏幕截图

![Mou icon](https://github.com/riversea2015/HHLoopView/blob/master/ScreenShot/HHLoopView.gif?raw=true)

## 安装

HHLoopView 支持 [CocoaPods](https://cocoapods.org)，集成非常简单，只需要在你的 `Podfile` 文件中加上下边的语句，当然，你也可以直接把源文件拷贝到项目里^_^
```ruby
pod 'HHLoopView'
```

## 使用

首先，需要以下边的方式导入头文件：
```ruby
#import <HHLoopView/HHLoopView.h>
```

然后，像下边这是使用即可，其中的 images 支持 LocalImageNames、URLStrings、URLs、UIImages 和 CustomViews，详见 Example。
```ruby
HHLoopView *loopView = [[HHLoopView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 240)
                                                  images:@[imageA, imageB, imageC]
                                               direction:HHLoopVertical
                                             clickAction:^(int intIndex)
{
    // Your click action ...
}];

[self.view addSubview:loopView];
```

---

## 英文介绍

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## ScreenShot

![Mou icon](https://github.com/riversea2015/HHLoopView/blob/master/ScreenShot/HHLoopView.gif?raw=true)

## Requirements

## Installation

HHLoopView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'HHLoopView'
```

## Use

Include HHLoopView wherever you need it with the following line:

```ruby
#import <HHLoopView/HHLoopView.h>
```

You just need use it like these codes bellow, and the images can be assigned with a set of LocalImageNames/URLStrings/URLs/UIImages or CustomViews.

```ruby
HHLoopView *loopView = [[HHLoopView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 240)
                                                  images:@[imageA, imageB, imageC]
                                               direction:HHLoopVertical
                                             clickAction:^(int intIndex)
{
    // Your click action ...
}];

[self.view addSubview:loopView];
```

## Author

riversea2015, hehai682@126.com

## License

HHLoopView is available under the MIT license. See the LICENSE file for more info.

## Note

The pictures used in the example is collected from the Internet, please do not use them for commercial purposes.
