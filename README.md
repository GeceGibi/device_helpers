# Device Helpers

A comprehensive Flutter plugin for device information and utilities across Android, iOS, and Web platforms.

## Features

- 📱 **Device Information**: Get detailed device specs, manufacturer, model, OS version, and more
- 🔍 **Device Detection**: Detect emulators, tablets, rooted devices, and developer mode
- 📊 **Platform Services**: Check for Google Mobile Services (GMS), Huawei Mobile Services (HMS), and HarmonyOS
- 🎯 **IDFA Support**: Request tracking authorization and get Identifier for Advertisers (iOS)
- 🔔 **Badge Management**: Update app badge count with permission handling
- ⚙️ **Settings Navigation**: Open app settings and notification settings directly

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  device_helpers: ^1.5.1
```

Then run:

```bash
flutter pub get
```

## Quick Start

```dart
import 'package:device_helpers/device_helpers.dart';

// Get comprehensive device information
final deviceInfo = await DeviceHelpers.getInfo();
print('Device: ${deviceInfo.manufacturer} ${deviceInfo.model}');
print('OS: ${deviceInfo.os} ${deviceInfo.osVersion}');
print('Is Emulator: ${deviceInfo.isEmulator}');

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
- `numberOfProcessors` - Number of CPU cores

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
    
    print('\n=== Mobile Services ===');
    print('Google Services: ${info.isGMS}');
    print('Huawei Services: ${info.isHMS}');
    print('HarmonyOS: ${info.isHMOS}');
    
    print('\n=== Hardware ===');
    print('CPU Cores: ${info.numberOfProcessors}');
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

## Platform Support

| Feature | Android | iOS | Web |
|---------|---------|-----|-----|
| Device Info | ✅ | ✅ | ✅ |
| IDFA | ❌ | ✅ | ❌ |
| Badge Update | ❌ | ✅ | ❌ |
| Settings Navigation | ✅ | ✅ | ❌ |
| Emulator Detection | ✅ | ✅ | ❌ |
| Root Detection | ✅ | ✅ | ❌ |

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.