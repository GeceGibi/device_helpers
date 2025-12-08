import 'package:device_helpers/device_helpers_platform_interface.dart';
import 'package:device_helpers/models.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:web/web.dart' as web;

/// A web implementation of the DeviceHelpersPlatform of the DeviceHelpers plugin.
class DeviceHelpers extends FlutterHelpersPlatform {
  /// Constructs a DeviceHelpersWeb
  DeviceHelpers();

  /// Registers the web implementation with the plugin registrar.
  static void registerWith(Registrar registrar) {
    FlutterHelpersPlatform.instance = DeviceHelpers();
  }

  /// Cached navigator reference
  static final web.Navigator _navigator = web.window.navigator;
  
  /// Cached user agent (lowercase)
  static final String _userAgentLower = _navigator.userAgent.toLowerCase();
  
  /// Cached user agent (original)
  static final String _userAgent = _navigator.userAgent;
  
  /// Cached platform
  static final String _platform = _navigator.platform.toLowerCase();

  /// Detects the operating system from user agent
  String _detectOS() {
    if (_userAgentLower.contains('android')) return 'android';
    if (_userAgentLower.contains('iphone') || _userAgentLower.contains('ipad')) return 'ios';
    if (_platform.contains('mac')) return 'macos';
    if (_platform.contains('win')) return 'windows';
    if (_platform.contains('linux')) return 'linux';
    return 'web';
  }

  /// Detects the browser name
  String _detectBrowser() {
    if (_userAgentLower.contains('edg/')) return 'Edge';
    if (_userAgentLower.contains('chrome')) return 'Chrome';
    if (_userAgentLower.contains('safari')) return 'Safari';
    if (_userAgentLower.contains('firefox')) return 'Firefox';
    if (_userAgentLower.contains('opera') || _userAgentLower.contains('opr/')) return 'Opera';
    return 'Unknown';
  }

  /// Checks if the device is a tablet
  bool _isTablet() {
    if (_userAgentLower.contains('ipad')) return true;
    if (_userAgentLower.contains('android') && !_userAgentLower.contains('mobile')) return true;
    
    final width = web.window.screen.width;
    return width >= 768 && width < 1024;
  }

  /// Detects device manufacturer
  String _detectManufacturer() {
    const manufacturers = {
      'samsung': 'Samsung',
      'huawei': 'Huawei',
      'xiaomi': 'Xiaomi',
      'oppo': 'Oppo',
      'vivo': 'Vivo',
      'oneplus': 'OnePlus',
    };
    
    for (final entry in manufacturers.entries) {
      if (_userAgentLower.contains(entry.key)) return entry.value;
    }
    
    if (_userAgentLower.contains('iphone') || _userAgentLower.contains('ipad') || _userAgentLower.contains('mac')) {
      return 'Apple';
    }
    
    return 'Unknown';
  }

  /// Gets the OS version
  String _getOSVersion() {
    final patterns = {
      r'OS (\d+)_(\d+)': (Match m) => '${m.group(1)}.${m.group(2)}',
      r'Android (\d+\.?\d*)': (Match m) => m.group(1) ?? '',
      r'Windows NT (\d+\.\d+)': (Match m) => m.group(1) ?? '',
      r'Mac OS X (\d+[._]\d+)': (Match m) => m.group(1)?.replaceAll('_', '.') ?? '',
    };
    
    for (final entry in patterns.entries) {
      final match = RegExp(entry.key).firstMatch(_userAgent);
      if (match != null) return entry.value(match);
    }
    
    return '';
  }

  /// Checks if running in debug mode
  bool _isDebugMode() {
    final href = web.window.location.href;
    return href.contains('localhost') || href.contains('127.0.0.1') || href.contains('debug=true');
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

  /// Gets comprehensive device information from the web browser.
  @override
  Future<DeviceInfo> getInfo() async {
    final nav = web.window.navigator;
    final os = _detectOS();
    
    return DeviceInfo(
      // App information (limited on web)
      appName: nav.appName,
      appVersion: nav.appVersion,
      appBuild: 'web',
      appBundle: web.window.location.host,
      
      // Device information
      manufacturer: _detectManufacturer(),
      brand: _detectBrowser(),
      model: '${_detectBrowser()} on ${os.toUpperCase()}',

      // OS information
      os: os,
      osVersion: _getOSVersion(),
      sdkVersion: nav.userAgent,
      isTablet: _isTablet(),
      isDebugMode: _isDebugMode(),
    );
  }
}
