require 'json'
package = JSON.parse(File.read('package.json'))

Pod::Spec.new do |s|
  s.name                = "RNFirebase"
  s.version             = package["version"]
  s.summary             = package["description"]
  s.description         = <<-DESC
                            A well tested feature rich Firebase implementation for React Native, supporting iOS & Android.
                          DESC
  s.homepage            = "http://invertase.io/react-native-firebase"
  s.license             = package['license']
  s.authors             = "Invertase Limited"
  s.source              = { :git => "https://github.com/invertase/react-native-firebase.git", :tag => "v#{s.version}" }
  s.social_media_url    = 'http://twitter.com/mikediarmid'
  s.platform            = :ios, "8.0"
  s.preserve_paths      = 'README.md', 'package.json', '*.js'
  s.source_files        = 'ios/RNFirebase/**/*.{h,m}'
  s.dependency          'React'
  
  # Vendor firebase
  s.xcconfig = {
    'OTHER_LDFLAGS' => '"-ObjC"'
  }
  s.vendored_frameworks = 'vendor/Firebase/Analytics/FirebaseAnalytics.framework',
                          'vendor/Firebase/Analytics/FirebaseCore.framework',
                          'vendor/Firebase/Analytics/FirebaseCoreDiagnostics.framework',
                          'vendor/Firebase/Analytics/FirebaseNanoPB.framework',
                          'vendor/Firebase/Analytics/FirebaseInstanceID.framework',
                          'vendor/Firebase/Analytics/GoogleToolboxForMac.framework',
                          'vendor/Firebase/Analytics/nanopb.framework',
                          'vendor/Firebase/Database/FirebaseDatabase.framework',
                          'vendor/Firebase/Database/leveldb-library.framework',
                          'vendor/Firebase/Auth/FirebaseAuth.framework',
                          'vendor/Firebase/Auth/GTMSessionFetcher.framework'
end
