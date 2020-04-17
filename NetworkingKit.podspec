#
# Be sure to run `pod lib lint NetworkingKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NetworkingKit'
  s.version          = '1.1.0'
  s.summary          = 'Simple Dynamic Framework, providing abstraction over Foundation networking classes'
  s.swift_versions   = ['5.0']

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Simple Dynamic Framework, providing abstraction over Foundation's networking classes

NetworkingKit contains wrapper classes of URLSession that give you the option to make a API call by subclassing Endpoint and providing network specific settings as overrides in your class.

Build using Swift 5, XCode 10.2, supports iOS 10.0+
                       DESC

  s.homepage         = 'https://github.com/stoqn4opm/NetworkingKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'stoqn4opm' => 'stoqn.stoqnov.93@gmail.com' }
  s.source           = { :git => 'https://github.com/stoqn4opm/NetworkingKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'Source/NetworkingKit/**/*.swift'
  
  # s.resource_bundles = {
  #   'NetworkingKit' => ['NetworkingKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
