version = "1.2.18";

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
  s.frameworks = 'Foundation', 'UIKit'
  s.source   = { :git => 'https://github.com/yuzhidu/YUCategory.git', :tag => "#{version}" }
  s.source_files = 'YUCategory', 'YUCategory/*.{h,m}'
  
  s.subspec 'UIKit' do |ss|
    ss.ios.deployment_target = '7.0'
    ss.source_files = 'YUCategory/UIKit/**/*.{h,m}'

    ss.subspec 'UIView' do |sss|
      sss.ios.deployment_target = '7.0'
      sss.source_files = 'YUCategory/UIKit/UIView/*.{h,m}'
    end
  end

  s.subspec 'Foundation' do |ss|
    ss.ios.deployment_target = '7.0'
    ss.source_files = 'YUCategory/Foundation/**/*.{h,m}'

    ss.subspec 'NSString' do |sss|
      sss.ios.deployment_target = '7.0'
      sss.source_files = 'YUCategory/Foundation/NSString/*.{h,m}'
    end
  end
  
  
end
