
Pod::Spec.new do |s|

  s.name         = "AlamofireRequestConfigurable"
  s.version      = "1.1.0"
  s.summary      = "Alamofire Request Configurable"
  s.homepage     = "https://futao.me/"
  s.license      = "MIT"
  s.author       = "'Ftkey' => 'ftkey@qq.com'"
  s.requires_arc = true
  s.source       = {:git => 'https://github.com/Ftkey/AlamofireRequestConfigurable.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.frameworks  = 'Foundation'
  s.source_files = 'Source/**/*'
  
  s.dependency 'Alamofire', '~> 3.0'

end