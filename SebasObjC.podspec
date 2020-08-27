Pod::Spec.new do |s|
  s.name         = "SebasObjC"
  s.version      = "1.13.2"
  s.summary      = "Utility Extensions written in Objective-C."
  s.description  = <<-DESC
SebasObjC is utility extensions written in Objective-C for iOS.
                   DESC
  s.homepage     = "https://github.com/HituziANDO/SebasObjC"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = "Hituzi Ando"
  s.platform     = :ios, "9.3"
  s.source       = { :git => "https://github.com/HituziANDO/SebasObjC.git", :tag => "#{s.version}" }
  s.source_files = "SebasObjC/**/*.{h,m}"
  s.requires_arc = true
end
