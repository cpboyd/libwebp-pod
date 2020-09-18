Pod::Spec.new do |s|
  s.name             = 'libwebp'
  s.version          = '1.1.0'
  s.summary          = 'Library to encode and decode images in WebP format.'
  s.description      = 'A replica libwebp podspec that provides pre-compiled binaries/frameworks instead'
  s.homepage         = 'https://developers.google.com/speed/webp/'
  s.authors          = 'Google Inc.'
  s.license          = { :type => 'BSD', :file => 'COPYING' }
  s.source           = { :git => 'https://chromium.googlesource.com/webm/libwebp', :tag => 'v' + s.version.to_s }
  s.cocoapods_version = '>= 1.9.1'
  s.vendored_frameworks = 'libwebp/*.framework'
  s.preserve_paths      = 'libwebp/*.framework'
  s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-lObjC' }
  s.static_framework = true

  s.default_subspecs = 'webp', 'demux', 'mux'

  # webp decoding && encoding
  s.subspec 'webp' do |ss|
    ss.public_header_files = 'libwebp/WebPDecoder.framework/Headers/*.h'
  end

  # animated webp decoding
  s.subspec 'demux' do |ss|
    ss.dependency 'libwebp/webp'
    ss.public_header_files = 'libwebp/WebPDemux.framework/Headers/*.h'
  end

  # animated webp encoding
  s.subspec 'mux' do |ss|
    ss.dependency 'libwebp/demux'
    ss.public_header_files = 'libwebp/WebPMux.framework/Headers/*.h'
  end
  
end