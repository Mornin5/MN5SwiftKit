Pod::Spec.new do |s|
  s.name             = 'MN5SwiftKit'
  s.version          = '0.2.1'
  s.summary          = 'A collection components for swift. work for objective-c too'

  s.description      = <<-DESC
  A collection components for swift. work for objective-c too.
  Lots of common functions/extentions used in my projects.
                       DESC

  s.homepage         = 'https://github.com/Mornin5/MN5SwiftKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mornin5' => 'mornin5.perfect.zhou@gmail.com' }
  s.source           = { :git => 'https://github.com/Mornin5/MN5SwiftKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.swift_versions = ['5']
  s.source_files = 'Source/**/*.swift'
  s.frameworks = 'UIKit'
end
