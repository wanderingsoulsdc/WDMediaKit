#
# Be sure to run `pod lib lint WDMediaKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WDMediaKit'
  s.version          = '1.2.0'
  s.summary          = '微店音视频处理SDK'
  s.homepage         = 'https://gitlab.vdian.net/mobile/WDMediaKit.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'qiyun' => 'qiyun@weidian.com' }
  s.source           = { :git => 'ssh://git@gitlab.vdian.net:60022/mobile/WDMediaKit.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.requires_arc     = true
  
  s.resource_bundles = {
      # 'WDMediaKit' => ['WDMediaKit/*.bundle']
      'WDMediaKit' => ['WDMediaKit/Assets/MediaKit_LUT.bundle']
    #'WDMediaKit' => ['WDMediaKit/Assets/MediaKit_LUT.bundle', 'WDMediaKit/WDMediaKit/Assets/MediaKit_Resources.bundle']
  }

#  s.source_files = 'WDMediaKit/Classes/WDMediaKit.framework/Headers/*.h'
  s.frameworks = 'UIKit', 'OpenGLES', 'MobileCoreServices'
  #s.vendored_frameworks = 'WDMediaKit/WDMediaKit/Classes/WDMediaKit.framework'
  # s.dependency 'AFNetworking', '~> 2.3'

  s.public_header_files = "WDMediaKit/**/*.h"
  s.source_files        = "WDMediaKit/**/*.{h,m, bundle}"
  s.resources           = "WDMediaKit/WDMediaKit/Assets/MediaKit_LUT.bundle"

  s.attributes_hash['extended'] ||= {'cocoapods-binary-source-swithcer' => '~> 1.0.0'} 
end
