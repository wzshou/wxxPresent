#
# Be sure to run `pod lib lint wxxPresent.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'wxxPresent'
  s.version          = '0.1.0'
s.summary          = '此分类是专门适应 各式各样 UI 弹框而设定. 主要有以下功能:1.提示框;  2.可以做为下拉框使用;  3.可以使用内置的几个常用动画,也可以自定义动画.'

s.description      = <<-DESC
TODO: 此分类是专门适应 各式各样 UI 弹框而设定. 主要有以下功能:1.提示框;  2.可以做为下拉框使用;  3.可以使用内置的几个常用动画,也可以自定义动画.
                       DESC

  s.homepage         = 'https://github.com/wzshou/wxxPresent.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '1224708605@qq.com' => '1224708605@qq.com' }
  s.source           = { :git => 'https://github.com/wzshou/wxxPresent.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'wxxPresent/Classes/**/*'
  
  # s.resource_bundles = {
  #   'wxxPresent' => ['wxxPresent/Assets/*.png']
  # }

  s.public_header_files = 'wxxPresent/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
