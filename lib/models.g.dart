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
      appVersion: json['appVersion'] as String? ?? '',
      appBundle: json['appBundle'] as String? ?? '',
      appBuild: json['appBuild'] as String? ?? '',
      appName: json['appName'] as String? ?? '',
      os: json['os'] as String? ?? '',
      osVersion: json['osVersion'] as String? ?? '',
      sdkVersion: json['sdkVersion'] as String? ?? '',
      isEmulator: json['isEmulator'] as bool? ?? false,
      isTablet: json['isTablet'] as bool? ?? false,
      isMIUI: json['isMIUI'] as bool? ?? false,
      isGMS: json['isGMS'] as bool? ?? false,
      isHMS: json['isHMS'] as bool? ?? false,
      isHMOS: json['isHMOS'] as bool? ?? false,
      isTV: json['isTV'] as bool? ?? false,
      isDeveloperModeEnabled: json['isDeveloperModeEnabled'] as bool? ?? false,
      isRooted: json['isRooted'] as bool? ?? false,
      isDebugMode: json['isDebugMode'] as bool? ?? false,
      isUsbDebuggingEnabled: json['isUsbDebuggingEnabled'] as bool? ?? false,
      isDebuggerAttached: json['isDebuggerAttached'] as bool? ?? false,
      isHookDetected: json['isHookDetected'] as bool? ?? false,
      numberOfProcessors: (json['numberOfProcessors'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$DeviceInfoToJson(_DeviceInfo instance) =>
    <String, dynamic>{
      'manufacturer': instance.manufacturer,
      'brand': instance.brand,
      'model': instance.model,
      'uuid': instance.uuid,
      'appVersion': instance.appVersion,
      'appBundle': instance.appBundle,
      'appBuild': instance.appBuild,
      'appName': instance.appName,
      'os': instance.os,
      'osVersion': instance.osVersion,
      'sdkVersion': instance.sdkVersion,
      'isEmulator': instance.isEmulator,
      'isTablet': instance.isTablet,
      'isMIUI': instance.isMIUI,
      'isGMS': instance.isGMS,
      'isHMS': instance.isHMS,
      'isHMOS': instance.isHMOS,
      'isTV': instance.isTV,
      'isDeveloperModeEnabled': instance.isDeveloperModeEnabled,
      'isRooted': instance.isRooted,
      'isDebugMode': instance.isDebugMode,
      'isUsbDebuggingEnabled': instance.isUsbDebuggingEnabled,
      'isDebuggerAttached': instance.isDebuggerAttached,
      'isHookDetected': instance.isHookDetected,
      'numberOfProcessors': instance.numberOfProcessors,
    };
