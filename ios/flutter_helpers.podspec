#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint helpers.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_helpers'
  s.version          = '1.0.0'
  s.summary          = 'Flutter helpers tools'
  s.description      = <<-DESC
  Flutter helpers sdk.
                       DESC
  s.homepage         = 'http://gece.dev'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'omr.gven@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end