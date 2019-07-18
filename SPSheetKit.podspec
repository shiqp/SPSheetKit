#
# Be sure to run `pod lib lint SPSheetKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SPSheetKit'
  s.version          = '0.1.0'
  s.summary          = 'SPSheetKit is a light kit to present sheet controller.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  SPSheetKit is a light kit to present sheet controller. It supports to show the sheet controller with up or down direction and customize colors.
                       DESC

  s.homepage         = 'https://github.com/shiqp/SPSheetKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'shiqp' => 'qingpu.shi@gmail.com' }
  s.source           = { :git => 'https://github.com/shiqp/SPSheetKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'
  s.swift_version = '4.0'

  s.source_files = 'SPSheetKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SPSheetKit' => ['SPSheetKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
end
