import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.g.dart';
part 'models.freezed.dart';

/// Device information model containing various device details.
@freezed
abstract class DeviceInfo with _$DeviceInfo {
  factory DeviceInfo({
    /// Device manufacturer (e.g., "Apple", "Samsung").
    @Default('') String manufacturer,

    /// Device brand (e.g., "iPhone", "Galaxy").
    @Default('') String brand,

    /// Device model name.
    @Default('') String model,

    /// Unique device identifier.
    @Default('') String uuid,

    /// Application version string.
    @Default('') @JsonKey(name: 'app_version') String appVersion,

    /// Application bundle identifier.
    @Default('') @JsonKey(name: 'app_bundle') String appBundle,

    /// Application build number.
    @Default('') @JsonKey(name: 'app_build') String appBuild,

    /// Application display name.
    @Default('') @JsonKey(name: 'app_name') String appName,

    /// Operating system name.
    @Default('') String os,

    /// Operating system version.
    @Default('') @JsonKey(name: 'os_version') String osVersion,

    /// SDK version information.
    @Default('') @JsonKey(name: 'sdk_version') String sdkVersion,

    /// Whether the device is running in an emulator.
    @Default(false) @JsonKey(name: 'is_emulator') bool isEmulator,

    /// Whether the device is a tablet.
    @Default(false) @JsonKey(name: 'is_tablet') bool isTablet,

    /// Whether the device is running MIUI (Xiaomi).
    @Default(false) @JsonKey(name: 'is_miui') bool isMIUI,

    /// Whether Google Mobile Services are available.
    @Default(false) @JsonKey(name: 'is_gms') bool isGMS,

    /// Whether Huawei Mobile Services are available.
    @Default(false) @JsonKey(name: 'is_hms') bool isHMS,

    /// Whether the device is running HarmonyOS.
    @Default(false) @JsonKey(name: 'is_hmos') bool isHMOS,

    /// Whether the device is a TV.
    @Default(false) @JsonKey(name: 'is_tv') bool isTV,

    /// Number of CPU processors.
    @Default(0) @JsonKey(name: 'number_of_processors') int numberOfProcessors,
  }) = _DeviceInfo;

  /// Creates a DeviceInfo from JSON data.
  factory DeviceInfo.fromJson(Map<String, Object?> json) =>
      _$DeviceInfoFromJson({
        ...json,
        'number_of_processors': Platform.numberOfProcessors,
        'sdk_version': Platform.version,
        'os': Platform.operatingSystem,
      });
}

/// Exception thrown when device info cannot be retrieved.
class DeviceInfoException implements Exception {
  /// Creates a DeviceInfoException with the given cause.
  DeviceInfoException(this.cause);

  /// The cause of the exception.
  String cause;
}

/// Status of tracking authorization request.
enum TrackingRequestStatus {
  /// User has not made a choice yet.
  notDetermined,

  /// User is restricted from making changes.
  restricted,

  /// User denied the request.
  denied,

  /// User authorized the request.
  authorized,

  /// Tracking is not supported on this device.
  notSupported
}
