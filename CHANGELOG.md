## 1.6.0

### Added
- **Security Checks**: Comprehensive security detection for Android and iOS
  - Debug mode detection
  - USB debugging detection
  - Debugger attached detection
  - Hook framework detection (Xposed, Frida, Substrate, Cycript)
- **Enhanced GMS/HMS Detection**: More reliable Google and Huawei Mobile Services detection
- **Web Platform Support**: Full web platform implementation with browser and OS detection
- **Native OS Information**: OS name and SDK version now provided by native code

### Changed
- **Breaking**: Removed `numberOfProcessors` field
- **Breaking**: Migrated from `dart:html` to `package:web` for web platform
- **Improved**: Better error handling in Android `getPackageInfo` calls
- **Improved**: iOS developer mode detection
- **Improved**: More accurate jailbreak detection on iOS

### Fixed
- GMS detection now checks package existence before API availability
- HMS detection now uses same reliable method as GMS
- Developer mode detection on Android now uses correct settings
- iOS debugger detection using proper sysctl implementation
- Routing methods now properly return results to Flutter

## 0.0.1

* Initial release.
