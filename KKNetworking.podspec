#
#  Be sure to run `pod spec lint CLKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "KKNetworking"
  s.version      = "1.0.1"
  s.summary      = "网络请求封装"
  s.description  = <<-DESC
  基于AFNetWorking的封装
                   DESC

  s.homepage     = "https://github.com/colaicode/CLNetworking"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "colaicode" => "colaicode@163.com" } 
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/colaicode/CLNetworking", :tag => "#{s.version}" }

  s.source_files  = "CLNetworking/CLNetworking/*.{h,m}"
  s.public_header_files = "CLNetworking/CLNetworking/*.h" 
  s.requires_arc = true
  s.dependency "AFNetworking", "~> 3.0"
  


end
