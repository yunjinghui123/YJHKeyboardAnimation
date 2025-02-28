Pod::Spec.new do |spec|
  spec.name         = "YJHKeyboardAnimation"
  spec.version      = "0.1.3"
  spec.summary      = "keyboard show or hidden animation"
  spec.homepage     = "https://github.com/yunjinghui123/YJHKeyboardAnimation"
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { "yunjinghui" => "1432680302@qq.com" }
  spec.platform     = :ios, "6.0"
  spec.source       = { :git => "https://github.com/yunjinghui123/YJHKeyboardAnimation.git", :tag => "#{spec.version}" }
  spec.requires_arc = true
  spec.source_files  = "YJHKeyboardAnimation/*.{h,m}"
  spec.resource_bundles = {'YJHKeyboardAnimation' => ['YJHKeyboardAnimation/Resources/PrivacyInfo.xcprivacy']}
end
