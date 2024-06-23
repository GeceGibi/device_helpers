import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:device_helpers/models.dart';

import 'device_helpers_platform_interface.dart';

/// An implementation of [HelpersPlatform] that uses method channels.
class MethodChannelHelpers extends FlutterHelpersPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final channel = const MethodChannel('gece.dev/helpers');

  @override
  Future<DeviceInfo> getInfo() async {
    try {
      final data = await channel.invokeMapMethod<String, dynamic>(
        'get_info',
      );

      return DeviceInfo.fromJson(data!);
    } on PlatformException catch (e) {
      throw DeviceInfoError(e.message ?? "Ups..");
    }
  }

  @override
  Future<String?> getIdfa() {
    return channel.invokeMethod<String>('get_idfa');
  }

  @override
  Future<TrackingRequestStatus> requestTrackingAuthorization() async {
    switch (await channel.invokeMethod('request_tracking_authorization')) {
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
    await channel.invokeMethod('badge_update', value);
  }

  @override
  Future<bool> badgeUpdateRequest() async {
    final status = await channel.invokeMethod<bool>(
      'update_badge_request',
    );

    return status ?? false;
  }

  @override
  Future<void> openAppNotificationSettings() async {
    await channel.invokeMethod('app_notification_settings');
  }

  @override
  Future<void> openAppSettings() async {
    await channel.invokeMethod('app_settings');
  }
}
