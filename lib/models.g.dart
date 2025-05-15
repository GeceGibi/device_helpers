// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceInfo _$DeviceInfoFromJson(Map<String, dynamic> json) => _DeviceInfo(
      manufacturer: json['manufacturer'] as String? ?? '',
      brand: json['brand'] as String? ?? '',
      model: json['model'] as String? ?? '',
      uuid: json['uuid'] as String? ?? '',
      appVersion: json['app_version'] as String? ?? '',
      appBundle: json['app_bundle'] as String? ?? '',
      appBuild: json['app_build'] as String? ?? '',
      appName: json['app_name'] as String? ?? '',
      os: json['os'] as String? ?? '',
      osVersion: json['os_version'] as String? ?? '',
      sdkVersion: json['sdk_version'] as String? ?? '',
      isEmulator: json['is_emulator'] as bool? ?? false,
      isTablet: json['is_tablet'] as bool? ?? false,
      isMIUI: json['is_miui'] as bool? ?? false,
      isGMS: json['is_gms'] as bool? ?? false,
      isHMS: json['is_hms'] as bool? ?? false,
      isHMOS: json['is_hmos'] as bool? ?? false,
      isTV: json['is_tv'] as bool? ?? false,
      numberOfProcessors: (json['number_of_processors'] as num?)?.toInt() ?? 0,
      memoryTotal: (json['memory_total'] as num?)?.toInt() ?? 0,
      storageTotal: (json['storage_total'] as num?)?.toInt() ?? 0,
      storageFree: (json['storage_free'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$DeviceInfoToJson(_DeviceInfo instance) =>
    <String, dynamic>{
      'manufacturer': instance.manufacturer,
      'brand': instance.brand,
      'model': instance.model,
      'uuid': instance.uuid,
      'app_version': instance.appVersion,
      'app_bundle': instance.appBundle,
      'app_build': instance.appBuild,
      'app_name': instance.appName,
      'os': instance.os,
      'os_version': instance.osVersion,
      'sdk_version': instance.sdkVersion,
      'is_emulator': instance.isEmulator,
      'is_tablet': instance.isTablet,
      'is_miui': instance.isMIUI,
      'is_gms': instance.isGMS,
      'is_hms': instance.isHMS,
      'is_hmos': instance.isHMOS,
      'is_tv': instance.isTV,
      'number_of_processors': instance.numberOfProcessors,
      'memory_total': instance.memoryTotal,
      'storage_total': instance.storageTotal,
      'storage_free': instance.storageFree,
    };
