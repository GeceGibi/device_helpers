import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:helpers/models.dart';

import 'helpers_platform_interface.dart';

/// An implementation of [HelpersPlatform] that uses method channels.
class MethodChannelHelpers extends HelpersPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('gece.dev/helpers');

  @override
  Future<DeviceInfo> getDeviceInfo() async {
    try {
      final data = await methodChannel.invokeMapMethod<String, dynamic>(
        'device_info',
      );

      return DeviceInfo.fromJson(data!);
    } catch (e) {
      throw DeviceInfoError('Upps..');
    }
  }

  @override
  Future<String?> getIdfa() {
    return methodChannel.invokeMethod<String>('get_idfa');
  }

  @override
  Future<TrackingRequestStatus> requestTrackingAuthorization() async {
    switch (
        await methodChannel.invokeMethod('request_tracking_authorization')) {
      case 1:
        return TrackingRequestStatus.restricted;
      case 2:
        return TrackingRequestStatus.denied;
      case 3:
        return TrackingRequestStatus.authorized;
      case 4:
        return TrackingRequestStatus.notSupported;

      case 0:
      default:
        return TrackingRequestStatus.notDetermined;
    }
  }

  @override
  Future<void> badgeUpdate(int value) async {
    await methodChannel.invokeMethod('badge_update', value);
  }

  @override
  Future<bool> badgeUpdateRequest() async {
    final status = await methodChannel.invokeMethod<bool>(
      'update_badge_request',
    );

    return status ?? false;
  }

  @override
  Future<void> openAppNotificationSettings() async {
    await methodChannel.invokeMethod('app_notification_settings');
  }

  @override
  Future<void> openAppSettings() async {
    await methodChannel.invokeMethod('app_settings');
  }
}
