## 1.7.3

### Fixed
- **Android**: `isDeveloperModeEnabled` now correctly detects developer mode on MIUI (Xiaomi) devices
  - Added `Settings.Secure` namespace fallback for devices storing settings there
  - Added MIUI-specific system property check (`persist.sys.development_options`)
  - Fixes issue where developer mode was not detected on Xiaomi devices even when enabled

### Improved
- **iOS Jailbreak Detection**: Added comprehensive rootless jailbreak detection (iOS 15+)
  - Added `/var/jb/` and related rootless jailbreak paths
  - Added modern package managers: Sileo, Zebra, Installer
  - Added Substitute/TweakInject library detection
  - Added dpkg/apt package system paths
  - Enhanced with additional system paths for better coverage

## 1.7.2

### Fixed
- **iOS Build Error**: Removed deprecated `fork()` system call that was causing compilation errors
  - `fork()` is unavailable in modern iOS: "Please use threads or posix_spawn*()"
  - Replaced with symbolic link manipulation check for jailbreak detection
  - Added restricted path checks for enhanced sandbox integrity verification

### Improved
- **iOS Security**: Modern jailbreak detection methods following current iOS best practices
  - File system write tests
  - Symbolic link manipulation detection
  - Restricted system path accessibility checks
  - Compliant with App Store guidelines

## 1.7.1

### Fixed
- **Critical: JSON Key Naming Mismatch** - Fixed inconsistent JSON key naming between native and Dart code
  - Android: Changed `isGms` → `isGMS`, `isHms` → `isHMS`, `isMiui` → `isMIUI`, `isHmos` → `isHMOS`, `isTv` → `isTV`
  - iOS: Changed `isGms` → `isGMS`, `isHms` → `isHMS`, `isMiui` → `isMIUI`, `isHmos` → `isHMOS`, `isTv` → `isTV`
  - This caused all these boolean flags to always return `false` regardless of actual device state
  - **Impact**: Honor and other devices with GMS were incorrectly reporting `isGMS: false` even when Google Play Services was available

### Improved
- **Code Quality**: Removed debug logging statements for production readiness
- **Performance**: Simplified GMS availability check logic
- **Readability**: Cleaner code structure in device info methods

## 1.7.0

### Added
- **Reflection-Based API Checks**: GMS/HMS availability checks now use reflection to avoid hard dependencies
  - Eliminates mandatory dependency on Google Play Services libraries
  - Eliminates mandatory dependency on Huawei Mobile Services libraries
  - Reduces APK size and dependency conflicts
- **Fallback Detection Pattern**: Two-tier detection system for GMS/HMS
  - Primary: Reflection-based API availability check (most accurate)
  - Fallback: Package manager check with enabled state validation
  - Works on devices without GMS/HMS libraries

### Changed
- **GMS Detection**: Now accepts `SERVICE_VERSION_UPDATE_REQUIRED` (code 2) and `SERVICE_UPDATING` (code 18) as available
  - Fixes false negatives on Honor and similar devices with outdated GMS
  - More tolerant of devices requiring GMS updates
- **HMS Detection**: Improved with same fallback pattern as GMS
- **Debug Mode Detection** (Android): Fixed logic that incorrectly flagged emulators as debug mode
  - Now checks debugger attachment instead of emulator status
  - Production builds on emulators no longer report as debug mode
- **Debug Mode Detection** (iOS): Enhanced with additional checks
  - Added debugger attachment check
  - Added sandbox receipt validation
  - More accurate detection across different build configurations

### Improved
- **iOS Jailbreak Detection**: Enhanced sandbox integrity checks
  - Added `fork()` test for more reliable jailbreak detection
  - Improved sandbox violation detection with write tests
- **Android Error Handling**: Better exception handling in settings methods
  - Added try-catch blocks with detailed error messages
  - Stack traces included in error responses
  - Badge count validation (rejects negative values)
- **Code Quality**: Removed unused imports from Android code
  - Removed `GoogleApiAvailability` import (now using reflection)
  - Removed `HuaweiApiAvailability` import (now using reflection)
  - Removed `ConnectionResult` import (constants hardcoded)

### Fixed
- **Honor Devices**: GMS now correctly reports as available on Honor phones with slightly outdated Google Play Services
- **Build Isolation**: Plugin no longer requires GMS/HMS SDKs to compile
- **False Positives**: Emulators running production builds no longer incorrectly report debug mode

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
