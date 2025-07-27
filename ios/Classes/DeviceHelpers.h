#import <Flutter/Flutter.h>

/**
 * DeviceHelpers Plugin - Objective-C Bridge Header
 * 
 * Flutter plugin for managing iOS device information and settings.
 * This header provides the Objective-C bridge to the Swift implementation.
 * 
 * Features:
 * - Device information retrieval
 * - App settings navigation
 * - Badge management
 * - Tracking authorization
 * - Jailbreak detection
 * - Emulator detection
 * 
 * The actual implementation is handled by SwiftDeviceHelpers class
 * which is exposed through this Objective-C interface for Flutter compatibility.
 */
@interface DeviceHelpers : NSObject<FlutterPlugin>
@end
