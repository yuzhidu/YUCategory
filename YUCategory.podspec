version = "2.2.2";

Pod::Spec.new do |s|
  s.name     = 'YUCategory'
  s.version  = version
  s.summary  = 'Large category for you.'
  s.description  = "YUCategory is iPad and iPhone compatible. Supports landscape and portrait orientations."
  s.homepage = 'https://github.com/yuzhidu/YUCategory'
  s.authors  = { '马裕博' => '1632212092@qq.com' }
  s.platform              = :ios, '8.0'
  s.requires_arc = true
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.frameworks = 'Foundation', 'UIKit', 'CoreData', 'QuartzCore', 'CoreLocation', 'MapKit'
  s.source   = { :git => 'https://github.com/yuzhidu/YUCategory.git', :tag => "#{version}" }
  s.source_files = 'YUCategory', 'YUCategory/*.{h}'
  
  s.subspec 'UIKit' do |ss|

    ss.subspec 'UIBarButtonItem' do |sss|
      sss.ios.deployment_target = '8.0'
      sss.source_files = 'YUCategory/UIKit/UIBarButtonItem/*.{h,m}'
    end

    ss.subspec 'UIImage' do |sss|
      sss.ios.deployment_target = '8.0'
      sss.source_files = 'YUCategory/UIKit/UIImage/*.{h,m}'
    end

    ss.subspec 'UIImageView' do |sss|
      sss.ios.deployment_target = '8.0'
      sss.source_files = 'YUCategory/UIKit/UIImageView/*.{h,m}'
    end

    ss.subspec 'UILabel' do |sss|
      sss.ios.deployment_target = '8.0'
      sss.source_files = 'YUCategory/UIKit/UILabel/*.{h,m}'
    end

    ss.subspec 'UISearchBar' do |sss|
      sss.ios.deployment_target = '8.0'
      sss.source_files = 'YUCategory/UIKit/UISearchBar/*.{h,m}'
    end

    ss.subspec 'UIView' do |sss|
      sss.ios.deployment_target = '8.0'
      sss.source_files = 'YUCategory/UIKit/UIView/*.{h,m}'
    end

  end

  s.subspec 'Foundation' do |ss|

    ss.subspec 'NSArray' do |sss|
      sss.ios.deployment_target = '8.0'
      sss.source_files = 'YUCategory/Foundation/NSArray/*.{h,m}'
    end

    ss.subspec 'NSAttributedString' do |sss|
      sss.ios.deployment_target = '8.0'
      sss.source_files = 'YUCategory/Foundation/NSAttributedString/*.{h,m}'
    end

    ss.subspec 'NSDate' do |sss|
      sss.ios.deployment_target = '8.0'
      sss.source_files = 'YUCategory/Foundation/NSDate/*.{h,m}'
    end

    ss.subspec 'NSDictionary' do |sss|
      sss.ios.deployment_target = '8.0'
      sss.source_files = 'YUCategory/Foundation/NSDictionary/*.{h,m}'
    end

    ss.subspec 'NSObject' do |sss|
      sss.ios.deployment_target = '8.0'
      sss.source_files = 'YUCategory/Foundation/NSObject/*.{h,m}'
    end

    ss.subspec 'NSString' do |sss|
      sss.ios.deployment_target = '8.0'
      sss.source_files = 'YUCategory/Foundation/NSString/*.{h,m}'
    end

  end
  
  
end
