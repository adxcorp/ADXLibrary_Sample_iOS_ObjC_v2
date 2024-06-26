source 'https://github.com/adxcorp/AdxLibrary_iOS_Release.git'
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '12.0'

target 'ADXSample' do
  use_frameworks!

  # 라이브러리 전체를 포함할 경우 
  pod 'ADXLibrary', '2.5.6'

  # 네이티브만 포함할 경우
  # pod 'ADXLibrary/Native', '2.5.6'

  # 전면/배너만 포함할 경우
  # pod 'ADXLibrary/Standard', '2.5.6'

  # 리워드만 포함할 경우 
  # pod 'ADXLibrary/Rewarded', '2.5.6'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
        xcconfig_path = config.base_configuration_reference.real_path
        xcconfig = File.read(xcconfig_path)
        xcconfig_mod = xcconfig.gsub(/DT_TOOLCHAIN_DIR/, "TOOLCHAIN_DIR")
        File.open(xcconfig_path, "w") { |file| file << xcconfig_mod }
        end
    end
end