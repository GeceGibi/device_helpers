#import "DeviceHelpers.h"

// Swift header import - generated compatibility header
#if __has_include(<device_helpers/device_helpers-Swift.h>)
    #import <device_helpers/device_helpers-Swift.h>
#else
    // Support project import fallback if the generated compatibility header
    // is not copied when this plugin is created as a library.
    // https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
    #import "device_helpers-Swift.h"
#endif

@implementation DeviceHelpers

/**
 * Flutter plugin registration
 * Registers SwiftDeviceHelpers class with Flutter
 */
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    [SwiftDeviceHelpers registerWithRegistrar:registrar];
}

@end
