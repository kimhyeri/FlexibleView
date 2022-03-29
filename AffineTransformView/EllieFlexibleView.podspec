Pod::Spec.new do |spec|

  spec.name         = "EllieFlexibleView"
  spec.version      = "1.0.0"
  spec.summary      = "Supporting flexible view with AffineTransform"
  spec.description  = "translate, rotate, scale view with AffineTransform"

  spec.homepage     = "https://github.com/kimhyeri/FlexibleView"
  spec.license      = "MIT"
  spec.author             = { "kimhyeri" => "hyer1k@naver.com" }
  spec.platform     = :ios, "15.2"
  spec.source       = { :git => "https://github.com/kimhyeri/FlexibleView.git", :tag => spec.version.to_s }

  spec.source_files  = "AffineTransformView/**/*.{swift}"
  spec.swift_version = "5.0"

end
