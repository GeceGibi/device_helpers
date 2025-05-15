// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceInfo {
  String get manufacturer;
  String get brand;
  String get model;
  String get uuid;
  @JsonKey(name: 'app_version')
  String get appVersion;
  @JsonKey(name: 'app_bundle')
  String get appBundle;
  @JsonKey(name: 'app_build')
  String get appBuild;
  @JsonKey(name: 'app_name')
  String get appName;
  String get os;
  @JsonKey(name: 'os_version')
  String get osVersion;
  @JsonKey(name: 'sdk_version')
  String get sdkVersion;
  @JsonKey(name: 'is_emulator')
  bool get isEmulator;
  @JsonKey(name: 'is_tablet')
  bool get isTablet;
  @JsonKey(name: 'is_miui')
  bool get isMIUI;
  @JsonKey(name: 'is_gms')
  bool get isGMS;
  @JsonKey(name: 'is_hms')
  bool get isHMS;
  @JsonKey(name: 'is_hmos')
  bool get isHMOS;
  @JsonKey(name: 'is_tv')
  bool get isTV;
  @JsonKey(name: 'number_of_processors')
  int get numberOfProcessors;
  @JsonKey(name: 'memory_total')
  int get memoryTotal;
  @JsonKey(name: 'storage_total')
  int get storageTotal;
  @JsonKey(name: 'storage_free')
  int get storageFree;

  /// Create a copy of DeviceInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeviceInfoCopyWith<DeviceInfo> get copyWith =>
      _$DeviceInfoCopyWithImpl<DeviceInfo>(this as DeviceInfo, _$identity);

  /// Serializes this DeviceInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceInfo &&
            (identical(other.manufacturer, manufacturer) ||
                other.manufacturer == manufacturer) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.appBundle, appBundle) ||
                other.appBundle == appBundle) &&
            (identical(other.appBuild, appBuild) ||
                other.appBuild == appBuild) &&
            (identical(other.appName, appName) || other.appName == appName) &&
            (identical(other.os, os) || other.os == os) &&
            (identical(other.osVersion, osVersion) ||
                other.osVersion == osVersion) &&
            (identical(other.sdkVersion, sdkVersion) ||
                other.sdkVersion == sdkVersion) &&
            (identical(other.isEmulator, isEmulator) ||
                other.isEmulator == isEmulator) &&
            (identical(other.isTablet, isTablet) ||
                other.isTablet == isTablet) &&
            (identical(other.isMIUI, isMIUI) || other.isMIUI == isMIUI) &&
            (identical(other.isGMS, isGMS) || other.isGMS == isGMS) &&
            (identical(other.isHMS, isHMS) || other.isHMS == isHMS) &&
            (identical(other.isHMOS, isHMOS) || other.isHMOS == isHMOS) &&
            (identical(other.isTV, isTV) || other.isTV == isTV) &&
            (identical(other.numberOfProcessors, numberOfProcessors) ||
                other.numberOfProcessors == numberOfProcessors) &&
            (identical(other.memoryTotal, memoryTotal) ||
                other.memoryTotal == memoryTotal) &&
            (identical(other.storageTotal, storageTotal) ||
                other.storageTotal == storageTotal) &&
            (identical(other.storageFree, storageFree) ||
                other.storageFree == storageFree));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        manufacturer,
        brand,
        model,
        uuid,
        appVersion,
        appBundle,
        appBuild,
        appName,
        os,
        osVersion,
        sdkVersion,
        isEmulator,
        isTablet,
        isMIUI,
        isGMS,
        isHMS,
        isHMOS,
        isTV,
        numberOfProcessors,
        memoryTotal,
        storageTotal,
        storageFree
      ]);

  @override
  String toString() {
    return 'DeviceInfo(manufacturer: $manufacturer, brand: $brand, model: $model, uuid: $uuid, appVersion: $appVersion, appBundle: $appBundle, appBuild: $appBuild, appName: $appName, os: $os, osVersion: $osVersion, sdkVersion: $sdkVersion, isEmulator: $isEmulator, isTablet: $isTablet, isMIUI: $isMIUI, isGMS: $isGMS, isHMS: $isHMS, isHMOS: $isHMOS, isTV: $isTV, numberOfProcessors: $numberOfProcessors, memoryTotal: $memoryTotal, storageTotal: $storageTotal, storageFree: $storageFree)';
  }
}

/// @nodoc
abstract mixin class $DeviceInfoCopyWith<$Res> {
  factory $DeviceInfoCopyWith(
          DeviceInfo value, $Res Function(DeviceInfo) _then) =
      _$DeviceInfoCopyWithImpl;
  @useResult
  $Res call(
      {String manufacturer,
      String brand,
      String model,
      String uuid,
      @JsonKey(name: 'app_version') String appVersion,
      @JsonKey(name: 'app_bundle') String appBundle,
      @JsonKey(name: 'app_build') String appBuild,
      @JsonKey(name: 'app_name') String appName,
      String os,
      @JsonKey(name: 'os_version') String osVersion,
      @JsonKey(name: 'sdk_version') String sdkVersion,
      @JsonKey(name: 'is_emulator') bool isEmulator,
      @JsonKey(name: 'is_tablet') bool isTablet,
      @JsonKey(name: 'is_miui') bool isMIUI,
      @JsonKey(name: 'is_gms') bool isGMS,
      @JsonKey(name: 'is_hms') bool isHMS,
      @JsonKey(name: 'is_hmos') bool isHMOS,
      @JsonKey(name: 'is_tv') bool isTV,
      @JsonKey(name: 'number_of_processors') int numberOfProcessors,
      @JsonKey(name: 'memory_total') int memoryTotal,
      @JsonKey(name: 'storage_total') int storageTotal,
      @JsonKey(name: 'storage_free') int storageFree});
}

/// @nodoc
class _$DeviceInfoCopyWithImpl<$Res> implements $DeviceInfoCopyWith<$Res> {
  _$DeviceInfoCopyWithImpl(this._self, this._then);

  final DeviceInfo _self;
  final $Res Function(DeviceInfo) _then;

  /// Create a copy of DeviceInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manufacturer = null,
    Object? brand = null,
    Object? model = null,
    Object? uuid = null,
    Object? appVersion = null,
    Object? appBundle = null,
    Object? appBuild = null,
    Object? appName = null,
    Object? os = null,
    Object? osVersion = null,
    Object? sdkVersion = null,
    Object? isEmulator = null,
    Object? isTablet = null,
    Object? isMIUI = null,
    Object? isGMS = null,
    Object? isHMS = null,
    Object? isHMOS = null,
    Object? isTV = null,
    Object? numberOfProcessors = null,
    Object? memoryTotal = null,
    Object? storageTotal = null,
    Object? storageFree = null,
  }) {
    return _then(_self.copyWith(
      manufacturer: null == manufacturer
          ? _self.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _self.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      appVersion: null == appVersion
          ? _self.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      appBundle: null == appBundle
          ? _self.appBundle
          : appBundle // ignore: cast_nullable_to_non_nullable
              as String,
      appBuild: null == appBuild
          ? _self.appBuild
          : appBuild // ignore: cast_nullable_to_non_nullable
              as String,
      appName: null == appName
          ? _self.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      os: null == os
          ? _self.os
          : os // ignore: cast_nullable_to_non_nullable
              as String,
      osVersion: null == osVersion
          ? _self.osVersion
          : osVersion // ignore: cast_nullable_to_non_nullable
              as String,
      sdkVersion: null == sdkVersion
          ? _self.sdkVersion
          : sdkVersion // ignore: cast_nullable_to_non_nullable
              as String,
      isEmulator: null == isEmulator
          ? _self.isEmulator
          : isEmulator // ignore: cast_nullable_to_non_nullable
              as bool,
      isTablet: null == isTablet
          ? _self.isTablet
          : isTablet // ignore: cast_nullable_to_non_nullable
              as bool,
      isMIUI: null == isMIUI
          ? _self.isMIUI
          : isMIUI // ignore: cast_nullable_to_non_nullable
              as bool,
      isGMS: null == isGMS
          ? _self.isGMS
          : isGMS // ignore: cast_nullable_to_non_nullable
              as bool,
      isHMS: null == isHMS
          ? _self.isHMS
          : isHMS // ignore: cast_nullable_to_non_nullable
              as bool,
      isHMOS: null == isHMOS
          ? _self.isHMOS
          : isHMOS // ignore: cast_nullable_to_non_nullable
              as bool,
      isTV: null == isTV
          ? _self.isTV
          : isTV // ignore: cast_nullable_to_non_nullable
              as bool,
      numberOfProcessors: null == numberOfProcessors
          ? _self.numberOfProcessors
          : numberOfProcessors // ignore: cast_nullable_to_non_nullable
              as int,
      memoryTotal: null == memoryTotal
          ? _self.memoryTotal
          : memoryTotal // ignore: cast_nullable_to_non_nullable
              as int,
      storageTotal: null == storageTotal
          ? _self.storageTotal
          : storageTotal // ignore: cast_nullable_to_non_nullable
              as int,
      storageFree: null == storageFree
          ? _self.storageFree
          : storageFree // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DeviceInfo implements DeviceInfo {
  _DeviceInfo(
      {this.manufacturer = '',
      this.brand = '',
      this.model = '',
      this.uuid = '',
      @JsonKey(name: 'app_version') this.appVersion = '',
      @JsonKey(name: 'app_bundle') this.appBundle = '',
      @JsonKey(name: 'app_build') this.appBuild = '',
      @JsonKey(name: 'app_name') this.appName = '',
      this.os = '',
      @JsonKey(name: 'os_version') this.osVersion = '',
      @JsonKey(name: 'sdk_version') this.sdkVersion = '',
      @JsonKey(name: 'is_emulator') this.isEmulator = false,
      @JsonKey(name: 'is_tablet') this.isTablet = false,
      @JsonKey(name: 'is_miui') this.isMIUI = false,
      @JsonKey(name: 'is_gms') this.isGMS = false,
      @JsonKey(name: 'is_hms') this.isHMS = false,
      @JsonKey(name: 'is_hmos') this.isHMOS = false,
      @JsonKey(name: 'is_tv') this.isTV = false,
      @JsonKey(name: 'number_of_processors') this.numberOfProcessors = 0,
      @JsonKey(name: 'memory_total') this.memoryTotal = 0,
      @JsonKey(name: 'storage_total') this.storageTotal = 0,
      @JsonKey(name: 'storage_free') this.storageFree = 0});
  factory _DeviceInfo.fromJson(Map<String, dynamic> json) =>
      _$DeviceInfoFromJson(json);

  @override
  @JsonKey()
  final String manufacturer;
  @override
  @JsonKey()
  final String brand;
  @override
  @JsonKey()
  final String model;
  @override
  @JsonKey()
  final String uuid;
  @override
  @JsonKey(name: 'app_version')
  final String appVersion;
  @override
  @JsonKey(name: 'app_bundle')
  final String appBundle;
  @override
  @JsonKey(name: 'app_build')
  final String appBuild;
  @override
  @JsonKey(name: 'app_name')
  final String appName;
  @override
  @JsonKey()
  final String os;
  @override
  @JsonKey(name: 'os_version')
  final String osVersion;
  @override
  @JsonKey(name: 'sdk_version')
  final String sdkVersion;
  @override
  @JsonKey(name: 'is_emulator')
  final bool isEmulator;
  @override
  @JsonKey(name: 'is_tablet')
  final bool isTablet;
  @override
  @JsonKey(name: 'is_miui')
  final bool isMIUI;
  @override
  @JsonKey(name: 'is_gms')
  final bool isGMS;
  @override
  @JsonKey(name: 'is_hms')
  final bool isHMS;
  @override
  @JsonKey(name: 'is_hmos')
  final bool isHMOS;
  @override
  @JsonKey(name: 'is_tv')
  final bool isTV;
  @override
  @JsonKey(name: 'number_of_processors')
  final int numberOfProcessors;
  @override
  @JsonKey(name: 'memory_total')
  final int memoryTotal;
  @override
  @JsonKey(name: 'storage_total')
  final int storageTotal;
  @override
  @JsonKey(name: 'storage_free')
  final int storageFree;

  /// Create a copy of DeviceInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeviceInfoCopyWith<_DeviceInfo> get copyWith =>
      __$DeviceInfoCopyWithImpl<_DeviceInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeviceInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeviceInfo &&
            (identical(other.manufacturer, manufacturer) ||
                other.manufacturer == manufacturer) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.appBundle, appBundle) ||
                other.appBundle == appBundle) &&
            (identical(other.appBuild, appBuild) ||
                other.appBuild == appBuild) &&
            (identical(other.appName, appName) || other.appName == appName) &&
            (identical(other.os, os) || other.os == os) &&
            (identical(other.osVersion, osVersion) ||
                other.osVersion == osVersion) &&
            (identical(other.sdkVersion, sdkVersion) ||
                other.sdkVersion == sdkVersion) &&
            (identical(other.isEmulator, isEmulator) ||
                other.isEmulator == isEmulator) &&
            (identical(other.isTablet, isTablet) ||
                other.isTablet == isTablet) &&
            (identical(other.isMIUI, isMIUI) || other.isMIUI == isMIUI) &&
            (identical(other.isGMS, isGMS) || other.isGMS == isGMS) &&
            (identical(other.isHMS, isHMS) || other.isHMS == isHMS) &&
            (identical(other.isHMOS, isHMOS) || other.isHMOS == isHMOS) &&
            (identical(other.isTV, isTV) || other.isTV == isTV) &&
            (identical(other.numberOfProcessors, numberOfProcessors) ||
                other.numberOfProcessors == numberOfProcessors) &&
            (identical(other.memoryTotal, memoryTotal) ||
                other.memoryTotal == memoryTotal) &&
            (identical(other.storageTotal, storageTotal) ||
                other.storageTotal == storageTotal) &&
            (identical(other.storageFree, storageFree) ||
                other.storageFree == storageFree));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        manufacturer,
        brand,
        model,
        uuid,
        appVersion,
        appBundle,
        appBuild,
        appName,
        os,
        osVersion,
        sdkVersion,
        isEmulator,
        isTablet,
        isMIUI,
        isGMS,
        isHMS,
        isHMOS,
        isTV,
        numberOfProcessors,
        memoryTotal,
        storageTotal,
        storageFree
      ]);

  @override
  String toString() {
    return 'DeviceInfo(manufacturer: $manufacturer, brand: $brand, model: $model, uuid: $uuid, appVersion: $appVersion, appBundle: $appBundle, appBuild: $appBuild, appName: $appName, os: $os, osVersion: $osVersion, sdkVersion: $sdkVersion, isEmulator: $isEmulator, isTablet: $isTablet, isMIUI: $isMIUI, isGMS: $isGMS, isHMS: $isHMS, isHMOS: $isHMOS, isTV: $isTV, numberOfProcessors: $numberOfProcessors, memoryTotal: $memoryTotal, storageTotal: $storageTotal, storageFree: $storageFree)';
  }
}

/// @nodoc
abstract mixin class _$DeviceInfoCopyWith<$Res>
    implements $DeviceInfoCopyWith<$Res> {
  factory _$DeviceInfoCopyWith(
          _DeviceInfo value, $Res Function(_DeviceInfo) _then) =
      __$DeviceInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String manufacturer,
      String brand,
      String model,
      String uuid,
      @JsonKey(name: 'app_version') String appVersion,
      @JsonKey(name: 'app_bundle') String appBundle,
      @JsonKey(name: 'app_build') String appBuild,
      @JsonKey(name: 'app_name') String appName,
      String os,
      @JsonKey(name: 'os_version') String osVersion,
      @JsonKey(name: 'sdk_version') String sdkVersion,
      @JsonKey(name: 'is_emulator') bool isEmulator,
      @JsonKey(name: 'is_tablet') bool isTablet,
      @JsonKey(name: 'is_miui') bool isMIUI,
      @JsonKey(name: 'is_gms') bool isGMS,
      @JsonKey(name: 'is_hms') bool isHMS,
      @JsonKey(name: 'is_hmos') bool isHMOS,
      @JsonKey(name: 'is_tv') bool isTV,
      @JsonKey(name: 'number_of_processors') int numberOfProcessors,
      @JsonKey(name: 'memory_total') int memoryTotal,
      @JsonKey(name: 'storage_total') int storageTotal,
      @JsonKey(name: 'storage_free') int storageFree});
}

/// @nodoc
class __$DeviceInfoCopyWithImpl<$Res> implements _$DeviceInfoCopyWith<$Res> {
  __$DeviceInfoCopyWithImpl(this._self, this._then);

  final _DeviceInfo _self;
  final $Res Function(_DeviceInfo) _then;

  /// Create a copy of DeviceInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? manufacturer = null,
    Object? brand = null,
    Object? model = null,
    Object? uuid = null,
    Object? appVersion = null,
    Object? appBundle = null,
    Object? appBuild = null,
    Object? appName = null,
    Object? os = null,
    Object? osVersion = null,
    Object? sdkVersion = null,
    Object? isEmulator = null,
    Object? isTablet = null,
    Object? isMIUI = null,
    Object? isGMS = null,
    Object? isHMS = null,
    Object? isHMOS = null,
    Object? isTV = null,
    Object? numberOfProcessors = null,
    Object? memoryTotal = null,
    Object? storageTotal = null,
    Object? storageFree = null,
  }) {
    return _then(_DeviceInfo(
      manufacturer: null == manufacturer
          ? _self.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _self.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      appVersion: null == appVersion
          ? _self.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      appBundle: null == appBundle
          ? _self.appBundle
          : appBundle // ignore: cast_nullable_to_non_nullable
              as String,
      appBuild: null == appBuild
          ? _self.appBuild
          : appBuild // ignore: cast_nullable_to_non_nullable
              as String,
      appName: null == appName
          ? _self.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      os: null == os
          ? _self.os
          : os // ignore: cast_nullable_to_non_nullable
              as String,
      osVersion: null == osVersion
          ? _self.osVersion
          : osVersion // ignore: cast_nullable_to_non_nullable
              as String,
      sdkVersion: null == sdkVersion
          ? _self.sdkVersion
          : sdkVersion // ignore: cast_nullable_to_non_nullable
              as String,
      isEmulator: null == isEmulator
          ? _self.isEmulator
          : isEmulator // ignore: cast_nullable_to_non_nullable
              as bool,
      isTablet: null == isTablet
          ? _self.isTablet
          : isTablet // ignore: cast_nullable_to_non_nullable
              as bool,
      isMIUI: null == isMIUI
          ? _self.isMIUI
          : isMIUI // ignore: cast_nullable_to_non_nullable
              as bool,
      isGMS: null == isGMS
          ? _self.isGMS
          : isGMS // ignore: cast_nullable_to_non_nullable
              as bool,
      isHMS: null == isHMS
          ? _self.isHMS
          : isHMS // ignore: cast_nullable_to_non_nullable
              as bool,
      isHMOS: null == isHMOS
          ? _self.isHMOS
          : isHMOS // ignore: cast_nullable_to_non_nullable
              as bool,
      isTV: null == isTV
          ? _self.isTV
          : isTV // ignore: cast_nullable_to_non_nullable
              as bool,
      numberOfProcessors: null == numberOfProcessors
          ? _self.numberOfProcessors
          : numberOfProcessors // ignore: cast_nullable_to_non_nullable
              as int,
      memoryTotal: null == memoryTotal
          ? _self.memoryTotal
          : memoryTotal // ignore: cast_nullable_to_non_nullable
              as int,
      storageTotal: null == storageTotal
          ? _self.storageTotal
          : storageTotal // ignore: cast_nullable_to_non_nullable
              as int,
      storageFree: null == storageFree
          ? _self.storageFree
          : storageFree // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
