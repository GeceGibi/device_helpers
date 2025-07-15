import 'package:device_helpers/device_helpers_platform_interface.dart';
import 'package:device_helpers/models.dart';

export 'package:device_helpers/models.dart';

/// A Flutter plugin for device information and utilities.
class DeviceHelpers {
  /// Private constructor to prevent instantiation.
  const DeviceHelpers._();

  /// Gets device information including manufacturer, model, OS version, etc.
  static Future<DeviceInfo> getInfo() {
    return FlutterHelpersPlatform.instance.getInfo();
  }

  /// Requests tracking authorization for IDFA (iOS only).
  static Future<TrackingRequestStatus> requestTrackingAuthorization() {
    return FlutterHelpersPlatform.instance.requestTrackingAuthorization();
  }

  /// Gets the IDFA (Identifier for Advertisers) if available.
  static Future<String?> getIdfa() {
    return FlutterHelpersPlatform.instance.getIdfa();
  }

  /// Updates the app badge count.
  static Future<void> badgeUpdate(int value) {
    return FlutterHelpersPlatform.instance.badgeUpdate(value);
  }

  /// Requests permission to update badge count.
  static Future<bool> updateBadgeRequest() {
    return FlutterHelpersPlatform.instance.badgeUpdateRequest();
  }

  /// Opens the app settings page.
  static Future<void> openAppSettings() {
    return FlutterHelpersPlatform.instance.openAppSettings();
  }

  /// Opens the app notification settings page.
  static Future<void> openAppNotificationSettings() {
    return FlutterHelpersPlatform.instance.openAppNotificationSettings();
  }
}
