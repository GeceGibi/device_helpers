import 'package:helpers/models.dart';
import 'helpers_platform_interface.dart';

export 'package:helpers/models.dart';

class Helpers {
  const Helpers._();
  static Future<DeviceInfo> getDeviceInfo() {
    return HelpersPlatform.instance.getDeviceInfo();
  }

  static Future<TrackingRequestStatus> requestTrackingAuthorization() {
    return HelpersPlatform.instance.requestTrackingAuthorization();
  }

  static Future<String?> getIdfa() {
    return HelpersPlatform.instance.getIdfa();
  }

  static Future<void> badgeUpdate(int value) {
    return HelpersPlatform.instance.badgeUpdate(value);
  }

  static Future<bool> updateBadgeRequest() {
    return HelpersPlatform.instance.badgeUpdateRequest();
  }

  static Future<void> openAppSettings() {
    return HelpersPlatform.instance.openAppSettings();
  }

  static Future<void> openAppNotificationSettings() {
    return HelpersPlatform.instance.openAppNotificationSettings();
  }
}
