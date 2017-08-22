Pod::Spec.new do |s|
  s.name         = "AspectsPlus"
  s.version      = "1.0"
  s.summary      = "Delightful, simple library for aspect oriented programming."
  s.homepage     = "https://github.com/heroims/AspectsPlus"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "heroims" => "heroims@163.com" }
  s.ios.deployment_target = '6.0'
  s.osx.deployment_target = '10.7'
  s.watchos.deployment_target = '2.0'
  s.source       = { :git => "https://github.com/steipete/AspectsPlus.git", :tag => "#{s.version}" }
  s.source_files  = 'Aspects.{h,m}'
  s.requires_arc = true;
end
