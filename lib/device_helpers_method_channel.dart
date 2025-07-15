import 'package:device_helpers/device_helpers_platform_interface.dart';
import 'package:device_helpers/models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// An implementation of [DeviceHelpersPlatform] that uses method channels.
class MethodChannelHelpers extends FlutterHelpersPlatform {
  /// The method channel used to interact with the native platform.
  ///
  /// This channel is used to communicate with the native Android and iOS implementations.
  @visibleForTesting
  final channel = const MethodChannel('gece.dev/helpers');

  /// Gets device information from the native platform.
  @override
  Future<DeviceInfo> getInfo() async {
    try {
      final data = await channel.invokeMapMethod<String, dynamic>(
        'get_info',
      );

      return DeviceInfo.fromJson(data!);
    } on PlatformException catch (e) {
      throw DeviceInfoException(
        e.message ?? 'An error occurred while getting device info.',
      );
    }
  }

  /// Gets the IDFA from the native platform.
  @override
  Future<String?> getIdfa() {
    return channel.invokeMethod<String>('get_idfa');
  }

  /// Requests tracking authorization from the native platform.
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

  /// Updates the app badge count on the native platform.
  @override
  Future<void> badgeUpdate(int value) async {
    await channel.invokeMethod('badge_update', value);
  }

  /// Requests permission to update badge count on the native platform.
  @override
  Future<bool> badgeUpdateRequest() async {
    final status = await channel.invokeMethod<bool>(
      'update_badge_request',
    );

    return status ?? false;
  }

  /// Opens the app notification settings on the native platform.
  @override
  Future<void> openAppNotificationSettings() async {
    await channel.invokeMethod('app_notification_settings');
  }

  /// Opens the app settings on the native platform.
  @override
  Future<void> openAppSettings() async {
    await channel.invokeMethod('app_settings');
  }
}
