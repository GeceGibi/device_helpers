import 'package:device_helpers/device_helpers_method_channel.dart';
import 'package:device_helpers/models.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// Platform interface for device helpers functionality.
abstract class FlutterHelpersPlatform extends PlatformInterface {
  /// Constructs a HelpersPlatform.
  FlutterHelpersPlatform() : super(token: _token);

  /// Token used to verify platform implementations.
  static final Object _token = Object();

  /// The current platform implementation instance.
  static FlutterHelpersPlatform _instance = MethodChannelHelpers();

  /// The default instance of [HelpersPlatform] to use.
  ///
  /// Defaults to [MethodChannelHelpers].
  static FlutterHelpersPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [HelpersPlatform] when
  /// they register themselves.
  static set instance(FlutterHelpersPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Updates the app badge count.
  Future<void> badgeUpdate(int value) {
    throw UnimplementedError(
      'badgeUpdate(int value) has not been implemented.',
    );
  }

  /// Requests permission to update badge count.
  Future<bool> badgeUpdateRequest() {
    throw UnimplementedError(
      'badgeUpdateRequest() has not been implemented.',
    );
  }

  /// Gets the IDFA (Identifier for Advertisers) if available.
  Future<String?> getIdfa() {
    throw UnimplementedError(
      'getIdfa() has not been implemented.',
    );
  }

  /// Requests tracking authorization for IDFA.
  Future<TrackingRequestStatus> requestTrackingAuthorization() {
    throw UnimplementedError(
      'requestTrackingAuthorization() has not been implemented.',
    );
  }

  /// Opens the app settings page.
  Future<void> openAppSettings() {
    throw UnimplementedError(
      'openAppSettings() has not been implemented.',
    );
  }

  /// Opens the app notification settings page.
  Future<void> openAppNotificationSettings() {
    throw UnimplementedError(
      'openAppNotificationSettings() has not been implemented.',
    );
  }

  /// Gets device information.
  Future<DeviceInfo> getInfo() {
    throw UnimplementedError(
      'getInfo() has not been implemented.',
    );
  }
}
