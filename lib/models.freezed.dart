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
  /// Device manufacturer (Apple, Samsung, etc.)
  String get manufacturer;

  /// Device brand (iPhone, Galaxy, etc.)
  String get brand;

  /// Device model name
  String get model;

  /// Unique device identifier
  String get uuid;

  /// App version
  String get appVersion;

  /// App bundle identifier
  String get appBundle;

  /// App build number
  String get appBuild;

  /// App display name
  String get appName;

  /// Operating system name
  String get os;

  /// Operating system version
  String get osVersion;

  /// SDK version
  String get sdkVersion;

  /// True if running in emulator
  bool get isEmulator;

  /// True if device is tablet
  bool get isTablet;

  /// True if device has MIUI (Xiaomi)
  bool get isMIUI;

  /// True if Google Mobile Services available
  bool get isGMS;

  /// True if Huawei Mobile Services available
  bool get isHMS;

  /// True if device runs HarmonyOS
  bool get isHMOS;

  /// True if device is TV
  bool get isTV;

  /// True if developer mode enabled
  bool get isDeveloperModeEnabled;

  /// True if device is rooted
  bool get isRooted;

  /// Number of CPU cores
  int get numberOfProcessors;

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
            (identical(other.isDeveloperModeEnabled, isDeveloperModeEnabled) ||
                other.isDeveloperModeEnabled == isDeveloperModeEnabled) &&
            (identical(other.isRooted, isRooted) ||
                other.isRooted == isRooted) &&
            (identical(other.numberOfProcessors, numberOfProcessors) ||
                other.numberOfProcessors == numberOfProcessors));
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
        isDeveloperModeEnabled,
        isRooted,
        numberOfProcessors
      ]);

  @override
  String toString() {
    return 'DeviceInfo(manufacturer: $manufacturer, brand: $brand, model: $model, uuid: $uuid, appVersion: $appVersion, appBundle: $appBundle, appBuild: $appBuild, appName: $appName, os: $os, osVersion: $osVersion, sdkVersion: $sdkVersion, isEmulator: $isEmulator, isTablet: $isTablet, isMIUI: $isMIUI, isGMS: $isGMS, isHMS: $isHMS, isHMOS: $isHMOS, isTV: $isTV, isDeveloperModeEnabled: $isDeveloperModeEnabled, isRooted: $isRooted, numberOfProcessors: $numberOfProcessors)';
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
      String appVersion,
      String appBundle,
      String appBuild,
      String appName,
      String os,
      String osVersion,
      String sdkVersion,
      bool isEmulator,
      bool isTablet,
      bool isMIUI,
      bool isGMS,
      bool isHMS,
      bool isHMOS,
      bool isTV,
      bool isDeveloperModeEnabled,
      bool isRooted,
      int numberOfProcessors});
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
    Object? isDeveloperModeEnabled = null,
    Object? isRooted = null,
    Object? numberOfProcessors = null,
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
      isDeveloperModeEnabled: null == isDeveloperModeEnabled
          ? _self.isDeveloperModeEnabled
          : isDeveloperModeEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isRooted: null == isRooted
          ? _self.isRooted
          : isRooted // ignore: cast_nullable_to_non_nullable
              as bool,
      numberOfProcessors: null == numberOfProcessors
          ? _self.numberOfProcessors
          : numberOfProcessors // ignore: cast_nullable_to_non_nullable
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
      this.appVersion = '',
      this.appBundle = '',
      this.appBuild = '',
      this.appName = '',
      this.os = '',
      this.osVersion = '',
      this.sdkVersion = '',
      this.isEmulator = false,
      this.isTablet = false,
      this.isMIUI = false,
      this.isGMS = false,
      this.isHMS = false,
      this.isHMOS = false,
      this.isTV = false,
      this.isDeveloperModeEnabled = false,
      this.isRooted = false,
      this.numberOfProcessors = 0});
  factory _DeviceInfo.fromJson(Map<String, dynamic> json) =>
      _$DeviceInfoFromJson(json);

  /// Device manufacturer (Apple, Samsung, etc.)
  @override
  @JsonKey()
  final String manufacturer;

  /// Device brand (iPhone, Galaxy, etc.)
  @override
  @JsonKey()
  final String brand;

  /// Device model name
  @override
  @JsonKey()
  final String model;

  /// Unique device identifier
  @override
  @JsonKey()
  final String uuid;

  /// App version
  @override
  @JsonKey()
  final String appVersion;

  /// App bundle identifier
  @override
  @JsonKey()
  final String appBundle;

  /// App build number
  @override
  @JsonKey()
  final String appBuild;

  /// App display name
  @override
  @JsonKey()
  final String appName;

  /// Operating system name
  @override
  @JsonKey()
  final String os;

  /// Operating system version
  @override
  @JsonKey()
  final String osVersion;

  /// SDK version
  @override
  @JsonKey()
  final String sdkVersion;

  /// True if running in emulator
  @override
  @JsonKey()
  final bool isEmulator;

  /// True if device is tablet
  @override
  @JsonKey()
  final bool isTablet;

  /// True if device has MIUI (Xiaomi)
  @override
  @JsonKey()
  final bool isMIUI;

  /// True if Google Mobile Services available
  @override
  @JsonKey()
  final bool isGMS;

  /// True if Huawei Mobile Services available
  @override
  @JsonKey()
  final bool isHMS;

  /// True if device runs HarmonyOS
  @override
  @JsonKey()
  final bool isHMOS;

  /// True if device is TV
  @override
  @JsonKey()
  final bool isTV;

  /// True if developer mode enabled
  @override
  @JsonKey()
  final bool isDeveloperModeEnabled;

  /// True if device is rooted
  @override
  @JsonKey()
  final bool isRooted;

  /// Number of CPU cores
  @override
  @JsonKey()
  final int numberOfProcessors;

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
            (identical(other.isDeveloperModeEnabled, isDeveloperModeEnabled) ||
                other.isDeveloperModeEnabled == isDeveloperModeEnabled) &&
            (identical(other.isRooted, isRooted) ||
                other.isRooted == isRooted) &&
            (identical(other.numberOfProcessors, numberOfProcessors) ||
                other.numberOfProcessors == numberOfProcessors));
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
        isDeveloperModeEnabled,
        isRooted,
        numberOfProcessors
      ]);

  @override
  String toString() {
    return 'DeviceInfo(manufacturer: $manufacturer, brand: $brand, model: $model, uuid: $uuid, appVersion: $appVersion, appBundle: $appBundle, appBuild: $appBuild, appName: $appName, os: $os, osVersion: $osVersion, sdkVersion: $sdkVersion, isEmulator: $isEmulator, isTablet: $isTablet, isMIUI: $isMIUI, isGMS: $isGMS, isHMS: $isHMS, isHMOS: $isHMOS, isTV: $isTV, isDeveloperModeEnabled: $isDeveloperModeEnabled, isRooted: $isRooted, numberOfProcessors: $numberOfProcessors)';
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
      String appVersion,
      String appBundle,
      String appBuild,
      String appName,
      String os,
      String osVersion,
      String sdkVersion,
      bool isEmulator,
      bool isTablet,
      bool isMIUI,
      bool isGMS,
      bool isHMS,
      bool isHMOS,
      bool isTV,
      bool isDeveloperModeEnabled,
      bool isRooted,
      int numberOfProcessors});
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
    Object? isDeveloperModeEnabled = null,
    Object? isRooted = null,
    Object? numberOfProcessors = null,
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
      isDeveloperModeEnabled: null == isDeveloperModeEnabled
          ? _self.isDeveloperModeEnabled
          : isDeveloperModeEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isRooted: null == isRooted
          ? _self.isRooted
          : isRooted // ignore: cast_nullable_to_non_nullable
              as bool,
      numberOfProcessors: null == numberOfProcessors
          ? _self.numberOfProcessors
          : numberOfProcessors // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
