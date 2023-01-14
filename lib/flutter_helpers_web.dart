// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window, Platform;

import 'package:flutter_helpers/models.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'flutter_helpers_platform_interface.dart';

/// A web implementation of the HelpersPlatform of the Helpers plugin.
class FlutterHelpersWeb extends FlutterHelpersPlatform {
  /// Constructs a HelpersWeb
  FlutterHelpersWeb();

  static void registerWith(Registrar registrar) {
    FlutterHelpersPlatform.instance = FlutterHelpersWeb();
  }

  @override
  Future<void> badgeUpdate(int value) async {}

  @override
  Future<bool> badgeUpdateRequest() async {
    return false;
  }

  @override
  Future<String?> getIdfa() async {
    return null;
  }

  @override
  Future<TrackingRequestStatus> requestTrackingAuthorization() async {
    return TrackingRequestStatus.notSupported;
  }

  @override
  Future<void> openAppSettings() async {}

  @override
  Future<void> openAppNotificationSettings() async {}

  @override
  Future<DeviceInfo> getDeviceInfo() async {
    return DeviceInfo.fallback().copyWith(
      appName: html.window.navigator.appName,
      appVersion: html.window.navigator.appVersion,
      appBuild: html.window.navigator.appCodeName,
      sdkVersion: html.window.navigator.userAgent,
    );
  }
}
