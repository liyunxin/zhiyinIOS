use_frameworks!
platform:ios, '11.0'

source 'https://github.com/CocoaPods/Specs.git' #官方库

flutter_project_path = 'https://github.com/liyunxin/zhiyin_flutter.git'
flutter_application_path = './zhiyin_flutter'

installing_pods = ARGV.include?('install') || ARGV.include?('update')
if installing_pods
  if !File.exist?(flutter_application_path)
    system "git clone #{flutter_project_path}"
    Dir.chdir(flutter_application_path)
    system 'git checkout master'
    Dir.chdir('../')
  end
  Dir.chdir(flutter_application_path)
  #system 'git fetch'
  #system 'git checkout 0.0.1'
  system 'git pull'
  system 'flutter pub get'
  Dir.chdir('../')
end

load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

target 'ZhiyinIOS' do
   pod 'MJRefresh'
   install_all_flutter_pods(flutter_application_path)
end

post_install do |installer|
  flutter_post_install(installer) if defined?(flutter_post_install)
end