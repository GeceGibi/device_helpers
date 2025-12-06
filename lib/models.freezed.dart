// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

  /// True if app is running in debug mode
  bool get isDebugMode;

  /// True if USB debugging is enabled
  bool get isUsbDebuggingEnabled;

  /// True if debugger is attached
  bool get isDebuggerAttached;

  /// True if hooking frameworks detected (Xposed, Frida, etc.)
  bool get isHookDetected;

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
            (identical(other.isDebugMode, isDebugMode) ||
                other.isDebugMode == isDebugMode) &&
            (identical(other.isUsbDebuggingEnabled, isUsbDebuggingEnabled) ||
                other.isUsbDebuggingEnabled == isUsbDebuggingEnabled) &&
            (identical(other.isDebuggerAttached, isDebuggerAttached) ||
                other.isDebuggerAttached == isDebuggerAttached) &&
            (identical(other.isHookDetected, isHookDetected) ||
                other.isHookDetected == isHookDetected) &&
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
        isDebugMode,
        isUsbDebuggingEnabled,
        isDebuggerAttached,
        isHookDetected,
        numberOfProcessors
      ]);

  @override
  String toString() {
    return 'DeviceInfo(manufacturer: $manufacturer, brand: $brand, model: $model, uuid: $uuid, appVersion: $appVersion, appBundle: $appBundle, appBuild: $appBuild, appName: $appName, os: $os, osVersion: $osVersion, sdkVersion: $sdkVersion, isEmulator: $isEmulator, isTablet: $isTablet, isMIUI: $isMIUI, isGMS: $isGMS, isHMS: $isHMS, isHMOS: $isHMOS, isTV: $isTV, isDeveloperModeEnabled: $isDeveloperModeEnabled, isRooted: $isRooted, isDebugMode: $isDebugMode, isUsbDebuggingEnabled: $isUsbDebuggingEnabled, isDebuggerAttached: $isDebuggerAttached, isHookDetected: $isHookDetected, numberOfProcessors: $numberOfProcessors)';
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
      bool isDebugMode,
      bool isUsbDebuggingEnabled,
      bool isDebuggerAttached,
      bool isHookDetected,
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
    Object? isDebugMode = null,
    Object? isUsbDebuggingEnabled = null,
    Object? isDebuggerAttached = null,
    Object? isHookDetected = null,
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
      isDebugMode: null == isDebugMode
          ? _self.isDebugMode
          : isDebugMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isUsbDebuggingEnabled: null == isUsbDebuggingEnabled
          ? _self.isUsbDebuggingEnabled
          : isUsbDebuggingEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isDebuggerAttached: null == isDebuggerAttached
          ? _self.isDebuggerAttached
          : isDebuggerAttached // ignore: cast_nullable_to_non_nullable
              as bool,
      isHookDetected: null == isHookDetected
          ? _self.isHookDetected
          : isHookDetected // ignore: cast_nullable_to_non_nullable
              as bool,
      numberOfProcessors: null == numberOfProcessors
          ? _self.numberOfProcessors
          : numberOfProcessors // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [DeviceInfo].
extension DeviceInfoPatterns on DeviceInfo {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DeviceInfo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceInfo() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DeviceInfo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceInfo():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DeviceInfo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceInfo() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String manufacturer,
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
            bool isDebugMode,
            bool isUsbDebuggingEnabled,
            bool isDebuggerAttached,
            bool isHookDetected,
            int numberOfProcessors)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeviceInfo() when $default != null:
        return $default(
            _that.manufacturer,
            _that.brand,
            _that.model,
            _that.uuid,
            _that.appVersion,
            _that.appBundle,
            _that.appBuild,
            _that.appName,
            _that.os,
            _that.osVersion,
            _that.sdkVersion,
            _that.isEmulator,
            _that.isTablet,
            _that.isMIUI,
            _that.isGMS,
            _that.isHMS,
            _that.isHMOS,
            _that.isTV,
            _that.isDeveloperModeEnabled,
            _that.isRooted,
            _that.isDebugMode,
            _that.isUsbDebuggingEnabled,
            _that.isDebuggerAttached,
            _that.isHookDetected,
            _that.numberOfProcessors);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String manufacturer,
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
            bool isDebugMode,
            bool isUsbDebuggingEnabled,
            bool isDebuggerAttached,
            bool isHookDetected,
            int numberOfProcessors)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceInfo():
        return $default(
            _that.manufacturer,
            _that.brand,
            _that.model,
            _that.uuid,
            _that.appVersion,
            _that.appBundle,
            _that.appBuild,
            _that.appName,
            _that.os,
            _that.osVersion,
            _that.sdkVersion,
            _that.isEmulator,
            _that.isTablet,
            _that.isMIUI,
            _that.isGMS,
            _that.isHMS,
            _that.isHMOS,
            _that.isTV,
            _that.isDeveloperModeEnabled,
            _that.isRooted,
            _that.isDebugMode,
            _that.isUsbDebuggingEnabled,
            _that.isDebuggerAttached,
            _that.isHookDetected,
            _that.numberOfProcessors);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String manufacturer,
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
            bool isDebugMode,
            bool isUsbDebuggingEnabled,
            bool isDebuggerAttached,
            bool isHookDetected,
            int numberOfProcessors)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeviceInfo() when $default != null:
        return $default(
            _that.manufacturer,
            _that.brand,
            _that.model,
            _that.uuid,
            _that.appVersion,
            _that.appBundle,
            _that.appBuild,
            _that.appName,
            _that.os,
            _that.osVersion,
            _that.sdkVersion,
            _that.isEmulator,
            _that.isTablet,
            _that.isMIUI,
            _that.isGMS,
            _that.isHMS,
            _that.isHMOS,
            _that.isTV,
            _that.isDeveloperModeEnabled,
            _that.isRooted,
            _that.isDebugMode,
            _that.isUsbDebuggingEnabled,
            _that.isDebuggerAttached,
            _that.isHookDetected,
            _that.numberOfProcessors);
      case _:
        return null;
    }
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
      this.isDebugMode = false,
      this.isUsbDebuggingEnabled = false,
      this.isDebuggerAttached = false,
      this.isHookDetected = false,
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

  /// True if app is running in debug mode
  @override
  @JsonKey()
  final bool isDebugMode;

  /// True if USB debugging is enabled
  @override
  @JsonKey()
  final bool isUsbDebuggingEnabled;

  /// True if debugger is attached
  @override
  @JsonKey()
  final bool isDebuggerAttached;

  /// True if hooking frameworks detected (Xposed, Frida, etc.)
  @override
  @JsonKey()
  final bool isHookDetected;

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
            (identical(other.isDebugMode, isDebugMode) ||
                other.isDebugMode == isDebugMode) &&
            (identical(other.isUsbDebuggingEnabled, isUsbDebuggingEnabled) ||
                other.isUsbDebuggingEnabled == isUsbDebuggingEnabled) &&
            (identical(other.isDebuggerAttached, isDebuggerAttached) ||
                other.isDebuggerAttached == isDebuggerAttached) &&
            (identical(other.isHookDetected, isHookDetected) ||
                other.isHookDetected == isHookDetected) &&
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
        isDebugMode,
        isUsbDebuggingEnabled,
        isDebuggerAttached,
        isHookDetected,
        numberOfProcessors
      ]);

  @override
  String toString() {
    return 'DeviceInfo(manufacturer: $manufacturer, brand: $brand, model: $model, uuid: $uuid, appVersion: $appVersion, appBundle: $appBundle, appBuild: $appBuild, appName: $appName, os: $os, osVersion: $osVersion, sdkVersion: $sdkVersion, isEmulator: $isEmulator, isTablet: $isTablet, isMIUI: $isMIUI, isGMS: $isGMS, isHMS: $isHMS, isHMOS: $isHMOS, isTV: $isTV, isDeveloperModeEnabled: $isDeveloperModeEnabled, isRooted: $isRooted, isDebugMode: $isDebugMode, isUsbDebuggingEnabled: $isUsbDebuggingEnabled, isDebuggerAttached: $isDebuggerAttached, isHookDetected: $isHookDetected, numberOfProcessors: $numberOfProcessors)';
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
      bool isDebugMode,
      bool isUsbDebuggingEnabled,
      bool isDebuggerAttached,
      bool isHookDetected,
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
    Object? isDebugMode = null,
    Object? isUsbDebuggingEnabled = null,
    Object? isDebuggerAttached = null,
    Object? isHookDetected = null,
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
      isDebugMode: null == isDebugMode
          ? _self.isDebugMode
          : isDebugMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isUsbDebuggingEnabled: null == isUsbDebuggingEnabled
          ? _self.isUsbDebuggingEnabled
          : isUsbDebuggingEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isDebuggerAttached: null == isDebuggerAttached
          ? _self.isDebuggerAttached
          : isDebuggerAttached // ignore: cast_nullable_to_non_nullable
              as bool,
      isHookDetected: null == isHookDetected
          ? _self.isHookDetected
          : isHookDetected // ignore: cast_nullable_to_non_nullable
              as bool,
      numberOfProcessors: null == numberOfProcessors
          ? _self.numberOfProcessors
          : numberOfProcessors // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
