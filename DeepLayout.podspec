#
#  Be sure to run `pod spec lint DeepLayout.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "DeepLayout"
  s.version      = "0.0.1"
  s.summary      = "Deep Layout give your more opportunity to use layout"
  s.description  = <<-DESC
                   You can set different font-sizes for different screen-sizes, not as Apple provide - only one for mobiles and one for iPad, you can specify layout in depend of screen size (e.g. if iPhone 5 - constant will be 30, if iPhone 6 - constant will be 40, e.t.c.), just try.  
DESC
  s.homepage     = "https://github.com/Faktorealchik/DPDeepLayout"
  s.license      = "MIT"

  s.author             = { "nesterov" => "faktorealchik@gmail.com" }
  s.social_media_url   = "http://vk.com/faktorealchik"
  s.platform     = :ios, "8.0"

 # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  s.source       = { :git => "https://github.com/Faktorealchik/DPDeepLayout.git", :tag => "#{s.version}" }

  s.source_files  = "Classes", "Classes/**/*.{h,m,swift}"
  s.exclude_files = "Classes/Exclude"
end
