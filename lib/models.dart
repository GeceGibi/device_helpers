import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.g.dart';
part 'models.freezed.dart';

/// Device information model
@freezed
abstract class DeviceInfo with _$DeviceInfo {
  /// Creates a new DeviceInfo instance with device information
  /// All parameters have default values for optional usage
  factory DeviceInfo({
    /// Device manufacturer (Apple, Samsung, etc.)
    @Default('') String manufacturer,

    /// Device brand (iPhone, Galaxy, etc.)
    @Default('') String brand,

    /// Device model name
    @Default('') String model,

    /// Unique device identifier
    @Default('') String uuid,

    /// App version
    @Default('') String appVersion,

    /// App bundle identifier
    @Default('') String appBundle,

    /// App build number
    @Default('') String appBuild,

    /// App display name
    @Default('') String appName,

    /// Operating system name
    @Default('') String os,

    /// Operating system version
    @Default('') String osVersion,

    /// SDK version
    @Default('') String sdkVersion,

    /// True if running in emulator
    @Default(false) bool isEmulator,

    /// True if device is tablet
    @Default(false) bool isTablet,

    /// True if device has MIUI (Xiaomi)
    @Default(false) bool isMIUI,

    /// True if Google Mobile Services available
    @Default(false) bool isGMS,

    /// True if Huawei Mobile Services available
    @Default(false) bool isHMS,

    /// True if device runs HarmonyOS
    @Default(false) bool isHMOS,

    /// True if device is TV
    @Default(false) bool isTV,

    /// True if developer mode enabled
    @Default(false) bool isDeveloperModeEnabled,

    /// True if device is rooted
    @Default(false) bool isRooted,

    /// True if app is running in debug mode
    @Default(false) bool isDebugMode,

    /// True if USB debugging is enabled
    @Default(false) bool isUsbDebuggingEnabled,

    /// True if debugger is attached
    @Default(false) bool isDebuggerAttached,

    /// True if hooking frameworks detected (Xposed, Frida, etc.)
    @Default(false) bool isHookDetected,
  }) = _DeviceInfo;

  /// Creates DeviceInfo from JSON
  factory DeviceInfo.fromJson(Map<String, Object?> json) =>
      _$DeviceInfoFromJson(json);
}

/// Exception when device info cannot be retrieved
class DeviceInfoException implements Exception {
  /// Creates exception with cause
  DeviceInfoException(this.cause);

  /// Error cause
  String cause;
}

/// Tracking authorization status
enum TrackingRequestStatus {
  /// User hasn't made choice yet
  notDetermined,

  /// User is restricted
  restricted,

  /// User denied request
  denied,

  /// User authorized request
  authorized,

  /// Tracking not supported
  notSupported
}
