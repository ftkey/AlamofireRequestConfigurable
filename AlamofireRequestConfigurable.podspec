#
# Be sure to run `pod lib lint JKKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|

  s.name         = "AlamofireRequestConfigurable"
  s.version      = "1.0.0"
  s.summary      = "Alamofire Request Configurable"
  s.homepage     = "https://futao.me/"
  s.license      = "Apache License, Version 2.0"
  s.author       = "'Ftkey' => 'ftkey@qq.com'"
  s.platform     = :ios, "8.0"
  s.requires_arc = true
  s.source       = {:git => 'https://github.com/Ftkey/AlamofireRequestConfigurable.git', :tag => s.version.to_s }

  s.frameworks  = 'Foundation'
  s.source_files = 'Source/**/*'
  
  s.dependency 'Alamofire', '~> 3.0'

end