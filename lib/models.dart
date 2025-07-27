import 'dart:io';

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
    @Default('') @JsonKey(name: 'app_version') String appVersion,

    /// App bundle identifier
    @Default('') @JsonKey(name: 'app_bundle') String appBundle,

    /// App build number
    @Default('') @JsonKey(name: 'app_build') String appBuild,

    /// App display name
    @Default('') @JsonKey(name: 'app_name') String appName,

    /// Operating system name
    @Default('') String os,

    /// Operating system version
    @Default('') @JsonKey(name: 'os_version') String osVersion,

    /// SDK version
    @Default('') @JsonKey(name: 'sdk_version') String sdkVersion,

    /// True if running in emulator
    @Default(false) @JsonKey(name: 'is_emulator') bool isEmulator,

    /// True if device is tablet
    @Default(false) @JsonKey(name: 'is_tablet') bool isTablet,

    /// True if device has MIUI (Xiaomi)
    @Default(false) @JsonKey(name: 'is_miui') bool isMIUI,

    /// True if Google Mobile Services available
    @Default(false) @JsonKey(name: 'is_gms') bool isGMS,

    /// True if Huawei Mobile Services available
    @Default(false) @JsonKey(name: 'is_hms') bool isHMS,

    /// True if device runs HarmonyOS
    @Default(false) @JsonKey(name: 'is_hmos') bool isHMOS,

    /// True if device is TV
    @Default(false) @JsonKey(name: 'is_tv') bool isTV,

    /// True if developer mode enabled
    @Default(false)
    @JsonKey(name: 'is_developer_mode_enabled')
    bool isDeveloperModeEnabled,

    /// True if device is rooted
    @Default(false) @JsonKey(name: 'is_rooted') bool isRooted,

    /// Number of CPU cores
    @Default(0) @JsonKey(name: 'number_of_processors') int numberOfProcessors,
  }) = _DeviceInfo;

  /// Creates DeviceInfo from JSON
  factory DeviceInfo.fromJson(Map<String, Object?> json) =>
      _$DeviceInfoFromJson({
        ...json,
        'number_of_processors': Platform.numberOfProcessors,
        'sdk_version': Platform.version,
        'os': Platform.operatingSystem,
      });
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
