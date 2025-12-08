# Device Helpers

A comprehensive Flutter plugin for device information and utilities across Android, iOS, and Web platforms.

[![pub package](https://img.shields.io/pub/v/device_helpers.svg)](https://pub.dev/packages/device_helpers)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Features

- 📱 **Device Information**: Get detailed device specs, manufacturer, model, OS version, and more
- 🔍 **Device Detection**: Detect emulators, tablets, rooted devices, and developer mode
- 🔒 **Security Checks**: Detect debug mode, USB debugging, debugger attachment, and hooking frameworks (Xposed, Frida, Substrate)
- 📊 **Platform Services**: Check for Google Mobile Services (GMS), Huawei Mobile Services (HMS), and HarmonyOS
- 🎯 **IDFA Support**: Request tracking authorization and get Identifier for Advertisers (iOS)
- 🔔 **Badge Management**: Update app badge count with permission handling
- ⚙️ **Settings Navigation**: Open app settings and notification settings directly

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  device_helpers: ^1.6.0
```

Then run:

```bash
flutter pub get
```

## What's New in 1.6.0

- 🔒 **Enhanced Security**: Comprehensive security checks including debug mode, USB debugging, debugger detection, and hook framework detection (Xposed, Frida, Substrate)
- 🌐 **Web Support**: Full web platform implementation with browser and OS detection
- ✅ **Improved Detection**: More reliable GMS/HMS detection with package verification
- 🚀 **Modern APIs**: Migrated to `package:web` for better web support
- 🔧 **Better Error Handling**: Improved error handling across all platforms

## Quick Start

```dart
import 'package:device_helpers/device_helpers.dart';

// Get comprehensive device information
final deviceInfo = await DeviceHelpers.getInfo();
print('Device: ${deviceInfo.manufacturer} ${deviceInfo.model}');
print('OS: ${deviceInfo.os} ${deviceInfo.osVersion}');
print('Is Emulator: ${deviceInfo.isEmulator}');

// Security checks
print('Debug Mode: ${deviceInfo.isDebugMode}');
print('Rooted: ${deviceInfo.isRooted}');
print('Hook Detected: ${deviceInfo.isHookDetected}');

// Request IDFA (iOS only)
final status = await DeviceHelpers.requestTrackingAuthorization();
if (status == TrackingRequestStatus.authorized) {
  final idfa = await DeviceHelpers.getIdfa();
  print('IDFA: $idfa');
}

// Update app badge (iOS only)
final hasPermission = await DeviceHelpers.updateBadgeRequest();
if (hasPermission) {
  await DeviceHelpers.badgeUpdate(5);
}

// Open settings
await DeviceHelpers.openAppSettings();
await DeviceHelpers.openAppNotificationSettings();
```

## Platform Setup

### iOS Configuration

For IDFA functionality, add the following to your `ios/Runner/Info.plist`:

```xml
<key>NSUserTrackingUsageDescription</key>
<string>This app needs permission to track activity for advertising purposes.</string>
```

### Android Configuration (Huawei Support)

To support Huawei Mobile Services, add the HMS repository to your `android/build.gradle`:

```gradle
buildscript {
    repositories {
        google()
        mavenCentral()
        // Add HMS repository
        maven { url 'https://developer.huawei.com/repo/' }
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
        // Add HMS repository
        maven { url 'https://developer.huawei.com/repo/' }
    }
}
```

## API Reference

### DeviceHelpers

#### Device Information

```dart
Future<DeviceInfo> getInfo()
```

Returns comprehensive device information including:
- `manufacturer` - Device manufacturer (Apple, Samsung, etc.)
- `brand` - Device brand (iPhone, Galaxy, etc.)
- `model` - Device model name
- `uuid` - Unique device identifier
- `appVersion` - App version
- `appBundle` - App bundle identifier
- `appBuild` - App build number
- `appName` - App display name
- `os` - Operating system name
- `osVersion` - Operating system version
- `sdkVersion` - SDK version
- `isEmulator` - Whether running in emulator
- `isTablet` - Whether device is a tablet
- `isMIUI` - Whether device has MIUI (Xiaomi)
- `isGMS` - Whether Google Mobile Services are available
- `isHMS` - Whether Huawei Mobile Services are available
- `isHMOS` - Whether device runs HarmonyOS
- `isTV` - Whether device is a TV
- `isDeveloperModeEnabled` - Whether developer mode is enabled
- `isRooted` - Whether device is rooted
- `isDebugMode` - Whether app is running in debug mode
- `isUsbDebuggingEnabled` - Whether USB debugging is enabled
- `isDebuggerAttached` - Whether debugger is attached to the process
- `isHookDetected` - Whether hooking frameworks are detected (Xposed, Frida, Substrate)

#### IDFA Methods (iOS Only)

```dart
Future<TrackingRequestStatus> requestTrackingAuthorization()
```

Requests user permission for tracking. Returns:
- `TrackingRequestStatus.notDetermined` - User hasn't decided
- `TrackingRequestStatus.restricted` - User is restricted
- `TrackingRequestStatus.denied` - User denied permission
- `TrackingRequestStatus.authorized` - User granted permission
- `TrackingRequestStatus.notSupported` - Tracking not supported

```dart
Future<String?> getIdfa()
```

Gets the Identifier for Advertisers. Requires authorized tracking permission.

#### Badge Methods (iOS Only)

```dart
Future<bool> updateBadgeRequest()
```

Requests permission to update app badge count.

```dart
Future<void> badgeUpdate(int value)
```

Updates the app badge count to the specified value.

#### Settings Navigation

```dart
Future<void> openAppSettings()
```

Opens the app's settings page in system settings.

```dart
Future<void> openAppNotificationSettings()
```

Opens the app's notification settings page.

## Usage Examples

### Complete Device Information

```dart
void printDeviceInfo() async {
  try {
    final info = await DeviceHelpers.getInfo();
    
    print('=== Device Information ===');
    print('Manufacturer: ${info.manufacturer}');
    print('Model: ${info.model}');
    print('OS: ${info.os} ${info.osVersion}');
    print('App: ${info.appName} (${info.appVersion})');
    
    print('\n=== Device Capabilities ===');
    print('Is Emulator: ${info.isEmulator}');
    print('Is Tablet: ${info.isTablet}');
    print('Is Rooted: ${info.isRooted}');
    print('Developer Mode: ${info.isDeveloperModeEnabled}');
    
    print('\n=== Security Status ===');
    print('Debug Mode: ${info.isDebugMode}');
    print('USB Debugging: ${info.isUsbDebuggingEnabled}');
    print('Debugger Attached: ${info.isDebuggerAttached}');
    print('Hook Detected: ${info.isHookDetected}');
    
    print('\n=== Mobile Services ===');
    print('Google Services: ${info.isGMS}');
    print('Huawei Services: ${info.isHMS}');
    print('HarmonyOS: ${info.isHMOS}');
    
  } catch (e) {
    print('Error getting device info: $e');
  }
}
```

### IDFA Implementation

```dart
void handleIDFA() async {
  // Request tracking authorization
  final status = await DeviceHelpers.requestTrackingAuthorization();
  
  switch (status) {
    case TrackingRequestStatus.authorized:
      final idfa = await DeviceHelpers.getIdfa();
      print('IDFA: $idfa');
      break;
    case TrackingRequestStatus.denied:
      print('User denied tracking permission');
      break;
    case TrackingRequestStatus.notDetermined:
      print('User has not decided yet');
      break;
    case TrackingRequestStatus.restricted:
      print('Tracking is restricted');
      break;
    case TrackingRequestStatus.notSupported:
      print('Tracking not supported on this platform');
      break;
  }
}
```

### Badge Management

```dart
void manageBadge() async {
  // Request badge permission
  final hasPermission = await DeviceHelpers.updateBadgeRequest();
  
  if (hasPermission) {
    // Update badge count
    await DeviceHelpers.badgeUpdate(10);
    print('Badge updated successfully');
    
    // Clear badge
    await DeviceHelpers.badgeUpdate(0);
  } else {
    print('Badge permission denied');
    // Optionally open settings
    await DeviceHelpers.openAppNotificationSettings();
  }
}
```

### Security Checks

```dart
void checkSecurity() async {
  final info = await DeviceHelpers.getInfo();
  
  print('\n=== Security Status ===');
  print('Debug Mode: ${info.isDebugMode}');
  print('USB Debugging: ${info.isUsbDebuggingEnabled}');
  print('Debugger Attached: ${info.isDebuggerAttached}');
  print('Hook Detected: ${info.isHookDetected}');
  print('Rooted: ${info.isRooted}');
  
  // Check for security risks
  if (info.isDebugMode || info.isUsbDebuggingEnabled || 
      info.isDebuggerAttached || info.isHookDetected || info.isRooted) {
    print('⚠️ Security warning: Device may be compromised');
    // Implement your security logic here
  }
}
```

#### Security Detection Details

The plugin detects various security threats:

- **Debug Mode**: Checks if the app was built with debug flag enabled
- **USB Debugging**: Detects if USB debugging is enabled on the device
- **Debugger Attached**: Detects if a debugger is currently attached to the process
- **Hook Detection**: Detects common hooking frameworks:
  - **Xposed Framework**: Checks for Xposed classes, files, and system properties
  - **Frida**: Detects Frida server process, files, and memory maps
  - **Substrate**: Checks for Substrate framework files
  - **General Hooks**: Scans for suspicious patterns in loaded libraries

## Platform Support

| Feature | Android | iOS | Web |
|---------|---------|-----|-----|
| Device Info | ✅ | ✅ | ✅ (Limited) |
| OS Detection | ✅ | ✅ | ✅ |
| Browser Detection | ❌ | ❌ | ✅ |
| Tablet Detection | ✅ | ✅ | ✅ |
| Manufacturer Detection | ✅ | ✅ | ✅ (Limited) |
| IDFA | ❌ | ✅ | ❌ |
| Badge Update | ❌ | ✅ | ❌ |
| Settings Navigation | ✅ | ✅ | ❌ |
| Emulator Detection | ✅ | ✅ | ❌ |
| Root Detection | ✅ | ✅ | ❌ |
| Security Checks | ✅ | ✅ | ⚠️ (Limited) |

### Web Platform Details

On web platform, the following information is available:

**Available:**
- OS detection (Windows, macOS, Linux, Android, iOS)
- Browser type (Chrome, Safari, Firefox, Edge, Opera)
- OS version
- Tablet detection (based on screen size and user agent)
- Manufacturer detection (limited, based on user agent)
- Debug mode detection (checks for localhost/127.0.0.1)

**Not Available:**
- Root/Jailbreak detection
- Emulator detection
- GMS/HMS availability
- USB debugging detection
- Debugger attached detection
- Hook framework detection
- IDFA/Advertising ID
- Settings navigation
- Badge management

**Example Web Output:**
```dart
DeviceInfo(
  os: 'windows',               // Detected from user agent
  osVersion: '10.0',           // Windows version
  manufacturer: 'Unknown',     // Limited detection
  brand: 'Chrome',            // Browser name
  model: 'Chrome on WINDOWS', // Browser + OS
  isTablet: false,           // Screen-based detection
  isDebugMode: true,         // localhost detection
  // All security flags are false on web
)
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.