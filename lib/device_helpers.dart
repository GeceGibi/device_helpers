import 'package:device_helpers/models.dart';
import 'device_helpers_platform_interface.dart';

export 'package:device_helpers/models.dart';

class DeviceHelpers {
  const DeviceHelpers._();

  static Future<DeviceInfo> getInfo() {
    return FlutterHelpersPlatform.instance.getInfo();
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
