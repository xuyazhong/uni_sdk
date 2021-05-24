Pod::Spec.new do |s|
  s.name             = 'uni_sdk'
  s.version          = '0.0.1'
  s.summary          = 'uniapp pod 集成'


  s.description      = <<-DESC
  uniapp 集成太麻烦了，弄到项目里更新太麻烦，所以做了一个pod库来使用。
                       DESC

  s.homepage         = 'https://github.com/xuyazhong/uni_sdk'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xuyazhong' => 'xuyazhong@foxmail.com' }
  s.source           = { :git => 'https://github.com/xuyazhong/uni_sdk.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.pod_target_xcconfig = { 'VALID_ARCHS' => 'arm64', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.xcconfig = { "OTHER_LDFLAGS" => "-ObjC", "ENABLE_BITCODE" => "NO"}

  # s.source_files = 'uniapp/uni_sdk.h'

  s.default_subspec = 'Core'

  # s.pod_target_xcconfig = {
  #   'SUPPORTS_MACCATALYST' => 'YES',
  #   'DERIVE_MACCATALYST_PRODUCT_BUNDLE_IDENTIFIER' => 'NO'
  # }

  s.subspec 'Core' do |core|
    core.source_files = 'uniapp/Core/**/*.h'
    core.vendored_libraries =  "uniapp/Core/**/*.a"
    core.vendored_frameworks = "uniapp/Core/**/*.framework"
    core.resources = ['uniapp/Core/Resources/PandoraApi.bundle', 'uniapp/Core/Resources/*.js', 'uniapp/Core/Resources/*.ttf']
  end

  s.subspec 'Camera' do |camera|
    camera.source_files = 'uniapp/Camera/**/*.h' 
    camera.vendored_libraries =  "uniapp/Camera/*.a"
    camera.resources = ['uniapp/Camera/DCMediaEditingController.bundle']
    camera.dependency 'uni_sdk/Core'
    camera.frameworks = 'AssetsLibrary', 'Photos', 'CoreMedia', 'MetalKit', 'GLKit'
  end

  s.subspec 'Video' do |video|
    video.source_files = 'uniapp/Video/**/*.h'
    video.vendored_libraries =  "uniapp/Video/*.a", 'libbz2.tbd', 'libz.tbd', 'libc++.tbd'
    video.vendored_frameworks = "uniapp/Video/**/*.framework"
    video.resources = ['uniapp/Video/DCMediaVideo.bundle', 'uniapp/Video/DCPGVideo.bundle', 'uniapp/Video/DCSVProgressHUD.bundle']
    video.dependency 'uni_sdk/Core'
    video.frameworks = 'AudioToolbox', 'AVFoundation', 'CoreGraphics', 'CoreMedia', 'CoreVideo', 'VideoToolbox', 'DCUniVideoPublic', 'IJKMediaFramework', 'MediaPlayer', 'MobileCoreServices', 'OpenGLES', 'QuartzCore', 'UIKit', 'VideoToolbox'
  end

  s.subspec 'Zip' do |zip|
    zip.vendored_libraries =  "uniapp/Zip/liblibZip.a"
    zip.dependency 'uni_sdk/Core'
  end

  s.frameworks = 'JavaScriptCore', 'CoreMedia', 'MediaPlayer', 'AVFoundation', 'AVKit', 'GLKit', 'OpenGLES', 'CoreText', 'QuartzCore', 'CoreGraphics', 'QuickLook', 'CoreTelephony', 'AssetsLibrary', 'CoreLocation', 'AddressBook'
  # s.dependency 'AFNetworking'

end
