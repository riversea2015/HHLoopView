#
# Be sure to run `pod lib lint HHLoopView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HHLoopView'
  s.version          = '0.1.1'
  s.summary          = 'A kind of loopView.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
这是一个可以自动或手动无限轮播的控件.
                       DESC

  s.homepage         = 'https://github.com/riversea2015/HHLoopView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'riversea2015' => 'hehai682@126.com' }
  s.source           = { :git => 'https://github.com/riversea2015/HHLoopView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'HHLoopView/Classes/**/*.{h,m}'
  
  # s.resource_bundles = {
  #   'HHLoopView' => ['HHLoopView/Assets/*.{jpg,png}']
  # }
  # s.resources = 'HHLoopView/Assets/**/*.{jpg,png}'
  

  s.public_header_files = 'HHLoopView/Classes/**/*.h'

  s.prefix_header_contents = '#ifdef __OBJC__','#import "HHLoopView_Macro.h"','#import "UIImageView+WebCache.h"','#import "UIView+WebCache.h"','#endif'

  s.frameworks = 'UIKit'
  s.dependency 'SDWebImage'

end
