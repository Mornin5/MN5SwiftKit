#
# Be sure to run `pod lib lint MN5SwiftKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MN5SwiftKit'
  s.version          = '0.1.2'
  s.summary          = 'A collection components for swift. work for objective-c too'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  A collection components for swift. work for objective-c too.
  Lots of common functions/extentions used in my projects.
                       DESC

  s.homepage         = 'https://github.com/Mornin5/MN5SwiftKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mornin5' => 'mornin5.perfect.zhou@gmail.com' }
  s.source           = { :git => 'https://github.com/Mornin5/MN5SwiftKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'
  s.swift_versions = ['5']

  s.source_files = 'Source/**/*.swift'
  
  # s.resource_bundles = {
  #   'MN5SwiftKit' => ['MN5SwiftKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
