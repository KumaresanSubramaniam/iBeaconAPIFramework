#
#  Be sure to run `pod spec lint iBeaconAPIFramework.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "iBeaconAPIFramework"
  s.version      = "1.0.0"
  s.summary      = “Sort description of 'iBeaconAPIFramework' framework”
  s.platform     = :ios, "10.0"
  s.homepage     = "https://skumaresan92.wixsite.com/my-profile"
  s.license      = "MIT"
  s.author	  = { "kumaresan.subramani" => "kumaresan.subramani@nexttechnosolutions.co.in" }
 
  s.source       = { :git => "https://gitlab.com/sadhasivam.karthaalabs/iBeaconAPI.git", :tag => "1.0.0" }

  s.source_files  = "iBeaconAPIFramework", "iBeaconAPIFramework/**/*.{h,m}"
  s.exclude_files = "iBeaconAPIFramework/Exclude"

end
