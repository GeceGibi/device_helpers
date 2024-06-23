import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.g.dart';
part 'models.freezed.dart';

@freezed
class DeviceInfo with _$DeviceInfo {
  factory DeviceInfo({
    @Default('') String manufacturer,
    @Default('') String brand,
    @Default('') String model,
    @Default('') String uuid,
    @Default('') @JsonKey(name: 'app_version') String appVersion,
    @Default('') @JsonKey(name: 'app_bundle') String appBundle,
    @Default('') @JsonKey(name: 'app_build') String appBuild,
    @Default('') @JsonKey(name: 'app_name') String appName,
    @Default('') String os,
    @Default('') @JsonKey(name: 'os_version') String osVersion,
    @Default('') @JsonKey(name: 'sdk_version') String sdkVersion,
    @Default(false) @JsonKey(name: 'is_emulator') bool isEmulator,
    @Default(false) @JsonKey(name: 'is_tablet') bool isTablet,
    @Default(false) @JsonKey(name: 'is_miui') bool isMIUI,
    @Default(false) @JsonKey(name: 'is_gms') bool isGMS,
    @Default(false) @JsonKey(name: 'is_hms') bool isHMS,
    @Default(false) @JsonKey(name: 'is_hmos') bool isHMOS,
    @Default(false) @JsonKey(name: 'is_tv') bool isTV,
    @Default(0) @JsonKey(name: 'number_of_processors') int numberOfProcessors,
    @Default(0) @JsonKey(name: 'memory_total') int memoryTotal,
    @Default(0) @JsonKey(name: 'storage_total') int storageTotal,
    @Default(0) @JsonKey(name: 'storage_free') int storageFree,
  }) = _DeviceInfo;

  factory DeviceInfo.fromJson(Map<String, Object?> json) =>
      _$DeviceInfoFromJson({
        ...json,
        'number_of_processors': Platform.numberOfProcessors,
        'sdk_version': Platform.version,
        'os': Platform.operatingSystem,
      });
}

class DeviceInfoError implements Exception {
  DeviceInfoError(this.cause);
  String cause;
}

enum TrackingRequestStatus {
  notDetermined,
  restricted,
  denied,
  authorized,
  notSupported
}
