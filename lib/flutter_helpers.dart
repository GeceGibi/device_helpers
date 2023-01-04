import 'package:flutter_helpers/models.dart';
import 'flutter_helpers_platform_interface.dart';

export 'package:flutter_helpers/models.dart';

class FlutterHelpers {
  const FlutterHelpers._();

  static Future<DeviceInfo> getDeviceInfo() {
    return FlutterHelpersPlatform.instance.getDeviceInfo();
  }

  static Future<TrackingRequestStatus> requestTrackingAuthorization() {
    return FlutterHelpersPlatform.instance.requestTrackingAuthorization();
  }

  static Future<String?> getIdfa() {
    return FlutterHelpersPlatform.instance.getIdfa();
  }

  static Future<void> badgeUpdate(int value) {
    return FlutterHelpersPlatform.instance.badgeUpdate(value);
  }

  static Future<bool> updateBadgeRequest() {
    return FlutterHelpersPlatform.instance.badgeUpdateRequest();
  }

  static Future<void> openAppSettings() {
    return FlutterHelpersPlatform.instance.openAppSettings();
  }

  static Future<void> openAppNotificationSettings() {
    return FlutterHelpersPlatform.instance.openAppNotificationSettings();
  }
}
