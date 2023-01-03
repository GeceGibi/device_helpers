class DeviceInfo {
  const DeviceInfo({
    required this.appBuild,
    required this.appBundle,
    required this.appName,
    required this.appVersion,
    required this.brand,
    required this.isEmulator,
    required this.isGMS,
    required this.isHMS,
    required this.isMIUI,
    required this.isTablet,
    required this.manufacturer,
    required this.model,
    required this.osVersion,
    required this.memoryTotal,
    required this.storageFree,
    required this.storageTotal,
    required this.uuid,
  });

  DeviceInfo.fromJson(Map<String, dynamic> json)
      : manufacturer = json['manufacturer'],
        brand = json['brand'],
        model = json['model'],
        uuid = json['uuid'],
        appVersion = json['app_version'],
        appBundle = json['app_bundle'],
        appBuild = json['app_build'],
        appName = json['app_name'],
        osVersion = json['os_version'],
        isEmulator = json['is_emulator'],
        isTablet = json['is_tablet'],
        isMIUI = json['is_miui'],
        isGMS = json['is_gms'],
        isHMS = json['is_hms'],
        memoryTotal = json['memory_total'],
        storageTotal = json['storage_total'],
        storageFree = json['storage_free'];

  DeviceInfo.fallback()
      : appVersion = "",
        appBundle = "",
        appBuild = "",
        appName = "",
        manufacturer = "",
        osVersion = "",
        brand = "",
        model = "",
        uuid = "",
        isEmulator = false,
        isTablet = false,
        isMIUI = false,
        isGMS = false,
        isHMS = false,
        memoryTotal = 0,
        storageTotal = 0,
        storageFree = 0;

  final String manufacturer;
  final String brand;
  final String model;
  final String uuid;
  final String appVersion;
  final String appBundle;
  final String appBuild;
  final String appName;
  final String osVersion;
  final bool isEmulator;
  final bool isTablet;
  final bool isMIUI;
  final bool isGMS;
  final bool isHMS;
  final int memoryTotal;
  final int storageTotal;
  final int storageFree;

  DeviceInfo copyWith({
    String? manufacturer,
    String? brand,
    String? model,
    String? uuid,
    String? appVersion,
    String? appBundle,
    String? appBuild,
    String? appName,
    String? osVersion,
    bool? isEmulator,
    bool? isTablet,
    bool? isMIUI,
    bool? isGMS,
    bool? isHMS,
    int? memoryTotal,
    int? storageTotal,
    int? storageFree,
  }) {
    return DeviceInfo(
      appBuild: appBuild ?? this.appBuild,
      appBundle: appBundle ?? this.appBundle,
      appName: appName ?? this.appName,
      appVersion: appVersion ?? this.appVersion,
      brand: brand ?? this.brand,
      isEmulator: isEmulator ?? this.isEmulator,
      isGMS: isGMS ?? this.isGMS,
      isHMS: isHMS ?? this.isHMS,
      isMIUI: isMIUI ?? this.isMIUI,
      isTablet: isTablet ?? this.isTablet,
      manufacturer: manufacturer ?? this.manufacturer,
      model: model ?? this.model,
      osVersion: osVersion ?? this.osVersion,
      memoryTotal: memoryTotal ?? this.memoryTotal,
      storageFree: storageFree ?? this.storageFree,
      storageTotal: storageTotal ?? this.storageTotal,
      uuid: uuid ?? this.uuid,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'manufacturer': manufacturer,
      'brand': brand,
      'model': model,
      'uuid': uuid,
      'app_version': appVersion,
      'app_bundle': appBundle,
      'app_build': appBuild,
      'app_name': appName,
      'os_version': osVersion,
      'is_emulator': isEmulator,
      'is_tablet': isTablet,
      'is_miui': isMIUI,
      'is_gms': isGMS,
      'is_hms': isHMS,
      'memory_total': memoryTotal,
      'storage_total': storageTotal,
      'storage_free': storageFree,
    };
  }

  @override
  String toString() {
    final jsonToList =
        toJson().entries.map((e) => '${e.key}: ${e.value}').join(', ');

    return 'DeviceInfo($jsonToList)';
  }
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
