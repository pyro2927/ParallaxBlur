Pod::Spec.new do |s|
  s.name             = "ParallaxBlur"
  s.version          = "0.1.5"
  s.summary          = "Easy to subclass parallax UITableController w/ blurring image header, floating header, and UIScrollView for content"
  s.homepage         = "https://github.com/pyro2927/ParallaxBlur"
  s.screenshots      = "https://raw.githubusercontent.com/pyro2927/ParallaxBlur/master/preview.gif"
  s.license          = 'MIT'
  s.author           = { "pyro2927" => "joseph@pintozzi.com" }
  s.source           = { :git => "https://github.com/pyro2927/ParallaxBlur.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/pyro2927'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.dependency 'FXBlurView', '~> 1.6.2'
end
