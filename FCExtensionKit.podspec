Pod::Spec.new do |s|
  s.name             = 'FCExtensionKit'
  s.version          = '1.1.2'
  s.swift_version    = '5.0'
  s.summary          = 'A little helper library for Swift.'

  s.description      = <<-DESC
Collection of Swift Extensions for Hepsiburada
                       DESC

  s.homepage         = 'https://github.com/fatihcimen/FCExtensionKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Fatih Cimen' => 'fatih@fatihcimen.com' }
  s.source           = { :git => 'https://github.com/fatihcimen/FCExtensionKit.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/cimenft'

  s.ios.deployment_target = '11.0'

  s.source_files = 'Sources/**/*.{h,m,swift}'
  s.pod_target_xcconfig = {
    'USER_HEADER_SEARCH_PATHS' => '$(inherited) $(SRCROOT)/libwebp/src'
  }

  s.dependency 'Kingfisher', '~> 6.3.0'
  s.dependency 'libwebp', '>= 1.2.0'
end
