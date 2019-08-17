Pod::Spec.new do |s|
s.name         = 'LYPopupTools'
s.version      = '1.0.2'
s.summary      = '四种常见弹窗'
s.homepage     = 'https://github.com/zhangliyong1024/LYPopupTools'
s.license      = 'MIT'
s.authors      = { "zhangliyong" => "zhangliyong1997@gmail.com" }
s.platform     = :ios, '8.0'
s.source       = {:git => 'https://github.com/zhangliyong1024/LYPopupTools.git', :tag => s.version}
s.source_files = 'LYPopupTools/LYPopupTools/**/*.{h,m}'
s.resource     = 'LYPopupTools/LYPopupTools/Resources/LYPopupTools.bundle'
s.requires_arc = true
s.dependency 'MBProgressHUD'
end


