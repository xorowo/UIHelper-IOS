Pod::Spec.new do |spec|

  spec.name         = "UIHelper-IOS"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of RequestHelper-IOS."
  spec.homepage     = "https://github.com/xorowo/UIHelper-IOS"

  spec.author       = { "Artem Drebednev" => "drebednev@mail.ru" }
  spec.platform     = :ios
  spec.source       = { :git => "https://github.com/xorowo/UIHelper-IOS", :branch => spec.version }

  spec.ios.deployment_target 	= '11.0'
  spec.source_files 		= 'UIHelper/**/*.{h,m,swift}'
  spec.ios.framework		= 'UIKit'

end
