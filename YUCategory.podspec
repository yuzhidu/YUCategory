Pod::Spec.new do |s|
  s.name     = 'YUCategory'
  s.version  = '1.0.9'
  s.summary  = 'Large category for you.'
  s.description  = "YUCategory is iPad and iPhone compatible. Supports landscape and portrait orientations and can be used inside UINavigationController."
  s.homepage = 'https://github.com/yuzhidu/YUCategory'
  s.authors  = { '马裕博' => '1632212092@qq.com' }
  s.platform              = :ios, '7.0'
  s.requires_arc = true
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.source   = { :git => 'https://github.com/yuzhidu/YUCategory.git', :tag => s.version.to_s }
  s.source_files          = 'YUCategory/*.{h,m}'
end
