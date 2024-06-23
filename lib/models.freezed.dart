// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeviceInfo _$DeviceInfoFromJson(Map<String, dynamic> json) {
  return _DeviceInfo.fromJson(json);
}

/// @nodoc
mixin _$DeviceInfo {
  String get manufacturer => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'app_version')
  String get appVersion => throw _privateConstructorUsedError;
  @JsonKey(name: 'app_bundle')
  String get appBundle => throw _privateConstructorUsedError;
  @JsonKey(name: 'app_build')
  String get appBuild => throw _privateConstructorUsedError;
  @JsonKey(name: 'app_name')
  String get appName => throw _privateConstructorUsedError;
  String get os => throw _privateConstructorUsedError;
  @JsonKey(name: 'os_version')
  String get osVersion => throw _privateConstructorUsedError;
  @JsonKey(name: 'sdk_version')
  String get sdkVersion => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_emulator')
  bool get isEmulator => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_tablet')
  bool get isTablet => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_miui')
  bool get isMIUI => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_gms')
  bool get isGMS => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_hms')
  bool get isHMS => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_hmos')
  bool get isHMOS => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_tv')
  bool get isTV => throw _privateConstructorUsedError;
  @JsonKey(name: 'number_of_processors')
  int get numberOfProcessors => throw _privateConstructorUsedError;
  @JsonKey(name: 'memory_total')
  int get memoryTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'storage_total')
  int get storageTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'storage_free')
  int get storageFree => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceInfoCopyWith<DeviceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceInfoCopyWith<$Res> {
  factory $DeviceInfoCopyWith(
          DeviceInfo value, $Res Function(DeviceInfo) then) =
      _$DeviceInfoCopyWithImpl<$Res, DeviceInfo>;
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
class _$DeviceInfoCopyWithImpl<$Res, $Val extends DeviceInfo>
    implements $DeviceInfoCopyWith<$Res> {
  _$DeviceInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      manufacturer: null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      appVersion: null == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      appBundle: null == appBundle
          ? _value.appBundle
          : appBundle // ignore: cast_nullable_to_non_nullable
              as String,
      appBuild: null == appBuild
          ? _value.appBuild
          : appBuild // ignore: cast_nullable_to_non_nullable
              as String,
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      os: null == os
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as String,
      osVersion: null == osVersion
          ? _value.osVersion
          : osVersion // ignore: cast_nullable_to_non_nullable
              as String,
      sdkVersion: null == sdkVersion
          ? _value.sdkVersion
          : sdkVersion // ignore: cast_nullable_to_non_nullable
              as String,
      isEmulator: null == isEmulator
          ? _value.isEmulator
          : isEmulator // ignore: cast_nullable_to_non_nullable
              as bool,
      isTablet: null == isTablet
          ? _value.isTablet
          : isTablet // ignore: cast_nullable_to_non_nullable
              as bool,
      isMIUI: null == isMIUI
          ? _value.isMIUI
          : isMIUI // ignore: cast_nullable_to_non_nullable
              as bool,
      isGMS: null == isGMS
          ? _value.isGMS
          : isGMS // ignore: cast_nullable_to_non_nullable
              as bool,
      isHMS: null == isHMS
          ? _value.isHMS
          : isHMS // ignore: cast_nullable_to_non_nullable
              as bool,
      isHMOS: null == isHMOS
          ? _value.isHMOS
          : isHMOS // ignore: cast_nullable_to_non_nullable
              as bool,
      isTV: null == isTV
          ? _value.isTV
          : isTV // ignore: cast_nullable_to_non_nullable
              as bool,
      numberOfProcessors: null == numberOfProcessors
          ? _value.numberOfProcessors
          : numberOfProcessors // ignore: cast_nullable_to_non_nullable
              as int,
      memoryTotal: null == memoryTotal
          ? _value.memoryTotal
          : memoryTotal // ignore: cast_nullable_to_non_nullable
              as int,
      storageTotal: null == storageTotal
          ? _value.storageTotal
          : storageTotal // ignore: cast_nullable_to_non_nullable
              as int,
      storageFree: null == storageFree
          ? _value.storageFree
          : storageFree // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceInfoImplCopyWith<$Res>
    implements $DeviceInfoCopyWith<$Res> {
  factory _$$DeviceInfoImplCopyWith(
          _$DeviceInfoImpl value, $Res Function(_$DeviceInfoImpl) then) =
      __$$DeviceInfoImplCopyWithImpl<$Res>;
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
class __$$DeviceInfoImplCopyWithImpl<$Res>
    extends _$DeviceInfoCopyWithImpl<$Res, _$DeviceInfoImpl>
    implements _$$DeviceInfoImplCopyWith<$Res> {
  __$$DeviceInfoImplCopyWithImpl(
      _$DeviceInfoImpl _value, $Res Function(_$DeviceInfoImpl) _then)
      : super(_value, _then);

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
    return _then(_$DeviceInfoImpl(
      manufacturer: null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      appVersion: null == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      appBundle: null == appBundle
          ? _value.appBundle
          : appBundle // ignore: cast_nullable_to_non_nullable
              as String,
      appBuild: null == appBuild
          ? _value.appBuild
          : appBuild // ignore: cast_nullable_to_non_nullable
              as String,
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      os: null == os
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as String,
      osVersion: null == osVersion
          ? _value.osVersion
          : osVersion // ignore: cast_nullable_to_non_nullable
              as String,
      sdkVersion: null == sdkVersion
          ? _value.sdkVersion
          : sdkVersion // ignore: cast_nullable_to_non_nullable
              as String,
      isEmulator: null == isEmulator
          ? _value.isEmulator
          : isEmulator // ignore: cast_nullable_to_non_nullable
              as bool,
      isTablet: null == isTablet
          ? _value.isTablet
          : isTablet // ignore: cast_nullable_to_non_nullable
              as bool,
      isMIUI: null == isMIUI
          ? _value.isMIUI
          : isMIUI // ignore: cast_nullable_to_non_nullable
              as bool,
      isGMS: null == isGMS
          ? _value.isGMS
          : isGMS // ignore: cast_nullable_to_non_nullable
              as bool,
      isHMS: null == isHMS
          ? _value.isHMS
          : isHMS // ignore: cast_nullable_to_non_nullable
              as bool,
      isHMOS: null == isHMOS
          ? _value.isHMOS
          : isHMOS // ignore: cast_nullable_to_non_nullable
              as bool,
      isTV: null == isTV
          ? _value.isTV
          : isTV // ignore: cast_nullable_to_non_nullable
              as bool,
      numberOfProcessors: null == numberOfProcessors
          ? _value.numberOfProcessors
          : numberOfProcessors // ignore: cast_nullable_to_non_nullable
              as int,
      memoryTotal: null == memoryTotal
          ? _value.memoryTotal
          : memoryTotal // ignore: cast_nullable_to_non_nullable
              as int,
      storageTotal: null == storageTotal
          ? _value.storageTotal
          : storageTotal // ignore: cast_nullable_to_non_nullable
              as int,
      storageFree: null == storageFree
          ? _value.storageFree
          : storageFree // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceInfoImpl implements _DeviceInfo {
  _$DeviceInfoImpl(
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

  factory _$DeviceInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceInfoImplFromJson(json);

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

  @override
  String toString() {
    return 'DeviceInfo(manufacturer: $manufacturer, brand: $brand, model: $model, uuid: $uuid, appVersion: $appVersion, appBundle: $appBundle, appBuild: $appBuild, appName: $appName, os: $os, osVersion: $osVersion, sdkVersion: $sdkVersion, isEmulator: $isEmulator, isTablet: $isTablet, isMIUI: $isMIUI, isGMS: $isGMS, isHMS: $isHMS, isHMOS: $isHMOS, isTV: $isTV, numberOfProcessors: $numberOfProcessors, memoryTotal: $memoryTotal, storageTotal: $storageTotal, storageFree: $storageFree)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceInfoImpl &&
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceInfoImplCopyWith<_$DeviceInfoImpl> get copyWith =>
      __$$DeviceInfoImplCopyWithImpl<_$DeviceInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceInfoImplToJson(
      this,
    );
  }
}

abstract class _DeviceInfo implements DeviceInfo {
  factory _DeviceInfo(
      {final String manufacturer,
      final String brand,
      final String model,
      final String uuid,
      @JsonKey(name: 'app_version') final String appVersion,
      @JsonKey(name: 'app_bundle') final String appBundle,
      @JsonKey(name: 'app_build') final String appBuild,
      @JsonKey(name: 'app_name') final String appName,
      final String os,
      @JsonKey(name: 'os_version') final String osVersion,
      @JsonKey(name: 'sdk_version') final String sdkVersion,
      @JsonKey(name: 'is_emulator') final bool isEmulator,
      @JsonKey(name: 'is_tablet') final bool isTablet,
      @JsonKey(name: 'is_miui') final bool isMIUI,
      @JsonKey(name: 'is_gms') final bool isGMS,
      @JsonKey(name: 'is_hms') final bool isHMS,
      @JsonKey(name: 'is_hmos') final bool isHMOS,
      @JsonKey(name: 'is_tv') final bool isTV,
      @JsonKey(name: 'number_of_processors') final int numberOfProcessors,
      @JsonKey(name: 'memory_total') final int memoryTotal,
      @JsonKey(name: 'storage_total') final int storageTotal,
      @JsonKey(name: 'storage_free') final int storageFree}) = _$DeviceInfoImpl;

  factory _DeviceInfo.fromJson(Map<String, dynamic> json) =
      _$DeviceInfoImpl.fromJson;

  @override
  String get manufacturer;
  @override
  String get brand;
  @override
  String get model;
  @override
  String get uuid;
  @override
  @JsonKey(name: 'app_version')
  String get appVersion;
  @override
  @JsonKey(name: 'app_bundle')
  String get appBundle;
  @override
  @JsonKey(name: 'app_build')
  String get appBuild;
  @override
  @JsonKey(name: 'app_name')
  String get appName;
  @override
  String get os;
  @override
  @JsonKey(name: 'os_version')
  String get osVersion;
  @override
  @JsonKey(name: 'sdk_version')
  String get sdkVersion;
  @override
  @JsonKey(name: 'is_emulator')
  bool get isEmulator;
  @override
  @JsonKey(name: 'is_tablet')
  bool get isTablet;
  @override
  @JsonKey(name: 'is_miui')
  bool get isMIUI;
  @override
  @JsonKey(name: 'is_gms')
  bool get isGMS;
  @override
  @JsonKey(name: 'is_hms')
  bool get isHMS;
  @override
  @JsonKey(name: 'is_hmos')
  bool get isHMOS;
  @override
  @JsonKey(name: 'is_tv')
  bool get isTV;
  @override
  @JsonKey(name: 'number_of_processors')
  int get numberOfProcessors;
  @override
  @JsonKey(name: 'memory_total')
  int get memoryTotal;
  @override
  @JsonKey(name: 'storage_total')
  int get storageTotal;
  @override
  @JsonKey(name: 'storage_free')
  int get storageFree;
  @override
  @JsonKey(ignore: true)
  _$$DeviceInfoImplCopyWith<_$DeviceInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
