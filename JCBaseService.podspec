#
# Be sure to run `pod lib lint JCBaseService.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JCBaseService'
  s.version          = '1.0.0'
  s.summary          = '基础服务'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/zk1947/JCBaseService'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zk1947@163.com' => 'zk1947@163.com' }
  s.source           = { :git => 'https://github.com/zk1947/JCBaseService.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'
  
  #s.source_files = 'JCBaseService/Classes/**/*'
  
  s.subspec 'Base' do |ss|
    ss.source_files = 'JCBaseService/Base/*'
  end
  
  s.subspec 'Tool' do |ss|
    ss.source_files = 'JCBaseService/Tool/*'
  end
  
  # s.resource_bundles = {
  #   'JCBaseService' => ['JCBaseService/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
