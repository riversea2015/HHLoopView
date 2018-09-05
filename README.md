# HHLoopView

[![CI Status](https://img.shields.io/travis/riversea2015/HHLoopView.svg?style=flat)](https://travis-ci.org/riversea2015/HHLoopView)
[![Version](https://img.shields.io/cocoapods/v/HHLoopView.svg?style=flat)](https://cocoapods.org/pods/HHLoopView)
[![License](https://img.shields.io/cocoapods/l/HHLoopView.svg?style=flat)](https://cocoapods.org/pods/HHLoopView)
[![Platform](https://img.shields.io/cocoapods/p/HHLoopView.svg?style=flat)](https://cocoapods.org/pods/HHLoopView)

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
HHLoopView *loopViewCustom = [[HHLoopView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 240)
                                                        images:@[imageA, imageB, imageC]
                                                     direction:HHLoopVertical
                                                   clickAction:^(int intIndex)
{
    // Your click action ...
}];
[self.view addSubview:loopViewCustom];
```

## Author

riversea2015, hehai682@126.com

## License

HHLoopView is available under the MIT license. See the LICENSE file for more info.

## Note

The pictures used in the example is collected from the Internet, please do not use them for commercial purposes.
