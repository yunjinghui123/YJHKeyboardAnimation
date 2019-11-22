Pod::Spec.new do |spec|
  spec.name         = "YJHKeyboardAnimation"
  spec.version      = "0.0.4"
  spec.summary      = "keyboard show or hidden animation"
  spec.homepage     = "https://github.com/yunjinghui123/YJHKeyboardAnimation"
  spec.license      = "MIT"
  spec.author       = { "yunjinghui" => "1432680302@qq.com" }
  spec.platform     = :ios, "6.0"
  spec.source       = { :git => "https://github.com/yunjinghui123/YJHKeyboardAnimation.git", :tag => "#{spec.version}" }
  spec.source_files  = "YJHKeyboardAnimation", "YJHKeyboardAnimation/**/*.{h,m}"
  spec.requires_arc = true
end
