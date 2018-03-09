Pod::Spec.new do |s|
  s.name         = "TPMessageShowAction"
  s.version      = "1.0.0"
  s.summary      = "TPMessageShowAction as to show message and do action"
  s.description  = "TPMessageShowAction as to show message and do action An of custom control addtion with cocoapod support."
  s.homepage     = "https://github.com/MrPlusZhao/TPMessageShowAction"
  s.social_media_url   = "http://www.weibo.com/"
  s.license= { :type => "MIT", :file => "LICENSE" }
  s.author       = { "MrPlusZhao" => "zhao" }
  s.source       = { :git => "https://github.com/MrPlusZhao/TPMessageShowAction.git", :tag => s.version }
  s.source_files = "TPMessageShowTools/*.{h,m}"
  s.ios.deployment_target = '8.0'
  s.frameworks   = 'UIKit'
  s.requires_arc = true

end
