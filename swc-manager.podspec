#
# Be sure to run `pod lib lint swc-manager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'swc-manager'
  s.version          = '0.1.2'
  s.summary          = 'SKYWARE Co., Ltd. swc-manager.'
  s.swift_version    = ['3.2', '4.0','4.2','5.0']

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "프로젝트 공통 라이브러리 by SKYWARE Co., Ltd."

  s.homepage         = 'http://www.skyware.co.kr'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'SKYWARE-INC' => 'skyware0704@gmail.com' }
  s.source           = { :git => 'https://github.com/SKYWARE-INC/swc-manager.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  #s.source_files = ["swc-manager/Classes/**/*", "Screens/**/*.{h,m,swift}"]
  s.source_files = 'swc-manager/Classes/**/*'
  
  # s.resource_bundles = {
  #   'swc-manager' => ['swc-manager/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'SwiftyJSON', '~> 4.0'
end
