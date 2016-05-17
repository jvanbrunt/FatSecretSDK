#
# Be sure to run `pod lib lint FatSecretSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "FatSecretSDK"
  s.version          = "0.1.0"
  s.summary          = "A library created to interact with FatSecret.com api."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A library for interacting with FatSecret.com food database api.
                       DESC

  s.homepage         = "https://github.com/jvanbrunt/FatSecretSDK"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Jacob Van Brunt" => "jvanbrunt@developertown.com" }
  s.source           = { :git => "https://github.com/jvanbrunt/FatSecretSDK.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'FatSecretSDK/Classes/**/*'
  
  # s.resource_bundles = {
  #   'FatSecretSDK' => ['FatSecretSDK/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
s.dependency 'MRCEnumerable', '~> 0.1.1'
s.dependency 'JSONModel', '~>1.2.0'
end
