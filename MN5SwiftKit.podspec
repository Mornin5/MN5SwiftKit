Pod::Spec.new do |s|
  s.name = 'MN5SwiftKit'
  s.version = '1.0.0'
  s.license = 'MIT'
  s.summary = 'A collection components for Swift'
  s.homepage = 'https://github.com/Mornin5/MN5SwiftKit'
  # s.authors = { 'Alamofire Software Foundation' => 'info@alamofire.org' }
  s.source = { :git => 'https://github.com/Mornin5/MN5SwiftKit.git', :tag => s.version }
  s.documentation_url = 'https://github.com/Mornin5/MN5SwiftKit/blob/main/README.md'

  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.12'
  s.tvos.deployment_target = '10.0'
  s.watchos.deployment_target = '3.0'

  s.swift_versions = ['5']

  s.source_files = 'Source/*.swift'

  # s.frameworks = 'CFNetwork'
end
