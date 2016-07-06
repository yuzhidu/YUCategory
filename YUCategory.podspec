version = "1.2.9";

Pod::Spec.new do |s|
  s.name     = 'YUCategory'
  s.version  = version
  s.summary  = 'Large category for you.'
  s.description  = "YUCategory is iPad and iPhone compatible. Supports landscape and portrait orientations."
  s.homepage = 'https://github.com/yuzhidu/YUCategory'
  s.authors  = { '马裕博' => '1632212092@qq.com' }
  s.platform              = :ios, '7.0'
  s.requires_arc = true
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.frameworks = 'Foundation', 'UIKit', 'CoreData', 'QuartzCore', 'CoreLocation', 'MapKit'
  s.source   = { :git => 'https://github.com/yuzhidu/YUCategory.git', :tag => "#{version}" }
  s.source_files = "YUCategory", "YUCategory/*.{h,m}","YUCategory/**/*.{h,m}"
  #s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
end
