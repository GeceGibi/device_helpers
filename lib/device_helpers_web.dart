// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;

import 'package:device_helpers/device_helpers_platform_interface.dart';
import 'package:device_helpers/models.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

/// A web implementation of the DeviceHelpersPlatform of the DeviceHelpers plugin.
class DeviceHelpers extends FlutterHelpersPlatform {
  /// Constructs a DeviceHelpersWeb
  DeviceHelpers();

  /// Registers the web implementation with the plugin registrar.
  ///
  /// This method is called by Flutter to register the web implementation
  /// of the device_helpers plugin.
  static void registerWith(Registrar registrar) {
    FlutterHelpersPlatform.instance = DeviceHelpers();
  }

  /// Updates the app badge count (not supported on web).
  @override
  Future<void> badgeUpdate(int value) async {}

  /// Requests permission to update badge count (not supported on web).
  @override
  Future<bool> badgeUpdateRequest() async {
    return false;
  }

  /// Gets the IDFA (not available on web).
  @override
  Future<String?> getIdfa() async {
    return null;
  }

  /// Requests tracking authorization (not supported on web).
  @override
  Future<TrackingRequestStatus> requestTrackingAuthorization() async {
    return TrackingRequestStatus.notSupported;
  }

  /// Opens the app settings (not supported on web).
  @override
  Future<void> openAppSettings() async {}

  /// Opens the app notification settings (not supported on web).
  @override
  Future<void> openAppNotificationSettings() async {}

  /// Gets basic device information from the web browser.
  @override
  Future<DeviceInfo> getInfo() async {
    return DeviceInfo().copyWith(
      appName: html.window.navigator.appName,
      appVersion: html.window.navigator.appVersion,
      appBuild: html.window.navigator.appCodeName,
      sdkVersion: html.window.navigator.userAgent,
    );
  }
}
