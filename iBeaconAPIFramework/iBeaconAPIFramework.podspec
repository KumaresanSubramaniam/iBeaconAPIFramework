#
#  Be sure to run `pod spec lint iBeaconAPIFramework.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "iBeaconAPIFramework"
  s.version      = "1.0.0"
  s.summary      = "A three-ring control like the Activity status bars"

  s.description  = "The three-ring is a completely customizable widget that can be used in any iOS app. It also plays a little victory fanfare."

  s.homepage     = "https://skumaresan92.wixsite.com/my-profile"

  s.license      = "MIT"

  s.author             = { "kumaresan.subramani" => "kumaresan.subramani@nexttechnosolutions.co.in" }
  # Or just: s.author    = "kumaresan.subramani"
   s.authors            = { "kumaresan.subramani" => "kumaresan.subramani@nexttechnosolutions.co.in" }

  s.platform     = :ios, “10.0”

  s.source       = { :git => "https://github.com/KumaresanSubramaniam/iBeaconAPIFramework.git", :tag => "1.0.0" }

  s.source_files  = "iBeaconAPIFramework", "iBeaconAPIFramework/**/*.{h,m}"
  s.exclude_files = "iBeaconAPIFramework/Exclude"

  # s.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "iBeaconAPIFramework/*.png"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3' }

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "UIKit"
  s.frameworks = "UIKit", "CoreLocation”, "CoreBluetooth"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
