import AppTrackingTransparency
import AdSupport
import Flutter
import UIKit
import UserNotifications
import Foundation
import Darwin
import MachO

// MARK: - Device Info Model

/**
 * DeviceInfo - iOS device information model
 * 
 * Comprehensive device information structure containing:
 * - App version and build information
 * - Device hardware and software details
 * - Security and environment checks
 * - Manufacturer and OS specific flags
 */
private struct DeviceInfo {
    /** App version string */
    let appVersion: String
    /** App build number */
    let appBuild: String
    /** App display name */
    let appName: String
    /** App bundle identifier */
    let appBundle: String
    /** Whether device is a tablet */
    let isTablet: Bool
    /** Unique device identifier */
    let uuid: String
    /** iOS version string */
    let osVersion: String
    /** Device manufacturer (Apple) */
    let manufacturer: String
    /** Device brand (iPhone/iPad) */
    let brand: String
    /** Device model identifier */
    let model: String
    /** Whether device is running in simulator */
    let isEmulator: Bool
    /** Whether device is running MIUI (not applicable for iOS) */
    let isMiui: Bool
    /** Whether Google Mobile Services are available (not applicable for iOS) */
    let isGms: Bool
    /** Whether Huawei Mobile Services are available (not applicable for iOS) */
    let isHms: Bool
    /** Whether device is running HarmonyOS (not applicable for iOS) */
    let isHmos: Bool
    /** Whether device is a TV (not applicable for iOS) */
    let isTv: Bool
    /** Whether developer mode is enabled */
    let isDeveloperModeEnabled: Bool
    /** Whether device is jailbroken */
    let isRooted: Bool
    
    /**
     * Converts device info to dictionary for Flutter communication
     * 
     * @return Dictionary representation of device information
     */
    var toDictionary: [String: Any] {
        return [
            "appVersion": appVersion,
            "appBuild": appBuild,
            "appName": appName,
            "appBundle": appBundle,
            "isTablet": isTablet,
            "uuid": uuid,
            "osVersion": osVersion,
            "manufacturer": manufacturer,
            "brand": brand,
            "model": model,
            "isEmulator": isEmulator,
            "isMiui": isMiui,
            "isGms": isGms,
            "isHms": isHms,
            "isHmos": isHmos,
            "isTv": isTv,
            "isDeveloperModeEnabled": isDeveloperModeEnabled,
            "isRooted": isRooted,
        ]
    }
}

// MARK: - Tracking Authorization Status

/**
 * TrackingStatus - App tracking transparency authorization status
 * 
 * Maps iOS tracking authorization status to integer values for Flutter communication
 */
private enum TrackingStatus: Int {
    /** User has not made a choice yet */
    case notDetermined = 0
    /** User is restricted from making changes */
    case restricted = 1
    /** User denied tracking permission */
    case denied = 2
    /** User authorized tracking */
    case authorized = 3
    /** Tracking is not supported on this device */
    case notSupported = 4
}

// MARK: - Main Plugin Class

/**
 * SwiftDeviceHelpers - Main Flutter plugin class for iOS
 * 
 * Handles all device-related operations including:
 * - Device information retrieval
 * - App settings navigation
 * - Badge management
 * - Tracking authorization
 * - Jailbreak detection
 * - Emulator detection
 */
public class SwiftDeviceHelpers: NSObject, FlutterPlugin {
    
    // MARK: - Properties
    
    /** Flag indicating whether badge updates are supported */
    private var isBadgeSupported = false
    
    // MARK: - Plugin Registration
    
    /**
     * Registers the plugin with Flutter
     * Sets up the method channel and creates plugin instance
     * 
     * @param registrar Flutter plugin registrar
     */
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(
            name: "gece.dev/helpers",
            binaryMessenger: registrar.messenger()
        )
        let instance = SwiftDeviceHelpers()
        registrar.addMethodCallDelegate(instance, channel: channel)
        registrar.addApplicationDelegate(instance)
    }
    
    // MARK: - Method Channel Handler
    
    /**
     * Handles method calls from Flutter side
     * Routes different method calls to appropriate handlers
     * 
     * @param call The method call from Flutter
     * @param result The result callback to send response back to Flutter
     */
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "app_settings":
            openAppSettings()
            result(nil)
            
        case "app_notification_settings":
            openAppNotificationSettings()
            result(nil)
            
        case "get_info":
            getDeviceInfo(result: result)
            
        case "badge_update":
            handleBadgeUpdate(call: call, result: result)
            
        case "update_badge_request":
            updateBadgeRequest(result: result)
            
        case "get_idfa":
            getIdfa(result: result)
            
        case "request_tracking_authorization":
            requestTrackingAuthorization(result: result)
            
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    // MARK: - Application Delegate
    
    /**
     * Called when the application becomes active
     * Can be used for additional operations when app becomes active
     * 
     * @param application The UIApplication instance
     */
    public func applicationDidBecomeActive(_ application: UIApplication) {
        // Additional operations can be added here if needed
    }
}

// MARK: - Settings Management

/**
 * Settings management extension for SwiftDeviceHelpers
 * Handles navigation to system settings pages
 */
private extension SwiftDeviceHelpers {
    
    /**
     * Opens the app settings page
     * Navigates to iOS Settings app for the current app
     */
    func openAppSettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else {
            print("Error: Could not create settings URL")
            return
        }
        UIApplication.shared.open(url)
    }
    
    /**
     * Opens the app notification settings page
     * Uses iOS 16+ notification settings URL or falls back to general settings
     */
    func openAppNotificationSettings() {
        if #available(iOS 16.0, *) {
            guard let url = URL(string: UIApplication.openNotificationSettingsURLString) else {
                print("Error: Could not create notification settings URL")
                return
            }
            UIApplication.shared.open(url)
        } else {
            openAppSettings()
        }
    }
}

// MARK: - Device Information

/**
 * Device information extension for SwiftDeviceHelpers
 * Handles device information collection and processing
 */
private extension SwiftDeviceHelpers {
    
    /**
     * Checks if the device is running in simulator
     * Uses compile-time target environment check
     * 
     * @return true if running in simulator, false otherwise
     */
    var isEmulator: Bool {
        #if targetEnvironment(simulator)
            return true
        #else
            return false
        #endif
    }
    
    /**
     * Gets the device model identifier
     * Uses uname system call to get machine identifier
     * 
     * @return Device model string
     */
    var deviceModel: String {
        var utsnameInstance = utsname()
        uname(&utsnameInstance)
        
        return withUnsafePointer(to: &utsnameInstance.machine) { pointer in
            pointer.withMemoryRebound(to: CChar.self, capacity: 1) { charPointer in
                String(validatingUTF8: charPointer) ?? "Unknown"
            }
        }
    }
    
    /**
     * Retrieves comprehensive device information
     * Builds device info structure with all available information
     * 
     * @param result Flutter result callback to return device info
     */
    func getDeviceInfo(result: @escaping FlutterResult) {
        let info = Bundle.main.infoDictionary ?? [:]
        let device = UIDevice.current
        
        let deviceInfo = DeviceInfo(
            appVersion: info["CFBundleShortVersionString"] as? String ?? "N/A",
            appBuild: info["CFBundleVersion"] as? String ?? "N/A",
            appName: info["CFBundleDisplayName"] as? String ?? "N/A",
            appBundle: Bundle.main.bundleIdentifier ?? "N/A",
            isTablet: device.userInterfaceIdiom == .pad,
            uuid: device.identifierForVendor?.uuidString ?? "N/A",
            osVersion: device.systemVersion,
            manufacturer: "Apple",
            brand: device.userInterfaceIdiom == .pad ? "iPad" : "iPhone",
            model: deviceModel,
            isEmulator: isEmulator,
            isMiui: false,
            isGms: false,
            isHms: false,
            isHmos: false,
            isTv: false,
            isDeveloperModeEnabled: isLikelyDeveloperModeEnabled(),
            isRooted: isRooted(),
        )
        
        result(deviceInfo.toDictionary)
    }
}

// MARK: - Badge Management

/**
 * Badge management extension for SwiftDeviceHelpers
 * Handles app badge count updates and permissions
 */
private extension SwiftDeviceHelpers {
    
    /**
     * Handles badge count update requests
     * Validates input and updates app badge count
     * 
     * @param call The method call containing badge count
     * @param result Flutter result callback
     */
    func handleBadgeUpdate(call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let badge = call.arguments as? Int else {
            result(FlutterError(code: "INVALID_ARGUMENT", 
                              message: "Badge must be an integer", 
                              details: nil))
            return
        }
        updateBadge(badge: badge)
        result(nil)
    }
    
    /**
     * Requests badge update permission
     * Asks user for permission to update app badge count
     * 
     * @param result Flutter result callback
     */
    func updateBadgeRequest(result: @escaping FlutterResult) {
        UNUserNotificationCenter.current().requestAuthorization(options: .badge) { [weak self] granted, error in
            DispatchQueue.main.async {
                self?.isBadgeSupported = error == nil
                result(granted)
            }
        }
    }
    
    /**
     * Updates the app badge count
     * Sets the application icon badge number
     * 
     * @param badge The badge count to set
     */
    func updateBadge(badge: Int) {
        guard isBadgeSupported else {
            print("Warning: Badge updates not supported")
            return
        }
        UIApplication.shared.applicationIconBadgeNumber = badge
    }
}

// MARK: - Tracking Authorization

/**
 * Tracking authorization extension for SwiftDeviceHelpers
 * Handles App Tracking Transparency (ATT) framework operations
 */
private extension SwiftDeviceHelpers {
    
    /**
     * Gets the advertising identifier (IDFA)
     * Returns IDFA if tracking is authorized, nil otherwise
     * 
     * @param result Flutter result callback
     */
    func getIdfa(result: @escaping FlutterResult) {
        if #available(iOS 14.0, *) {
            // iOS 14+ uses App Tracking Transparency framework
            let isAuthorized = ATTrackingManager.trackingAuthorizationStatus == .authorized
            let idfa = isAuthorized ? ASIdentifierManager.shared().advertisingIdentifier.uuidString : nil
            result(idfa)
        } else {
            // iOS 13 and below uses legacy advertising tracking
            let isEnabled = ASIdentifierManager.shared().isAdvertisingTrackingEnabled
            let idfa = isEnabled ? ASIdentifierManager.shared().advertisingIdentifier.uuidString : nil
            result(idfa)
        }
    }
    
    /**
     * Requests tracking authorization from user
     * Shows system permission dialog for tracking authorization
     * 
     * @param result Flutter result callback
     */
    func requestTrackingAuthorization(result: @escaping FlutterResult) {
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                DispatchQueue.main.async {
                    result(TrackingStatus(rawValue: Int(status.rawValue))?.rawValue ?? TrackingStatus.notSupported.rawValue)
                }
            }
        } else {
            result(TrackingStatus.notSupported.rawValue)
        }
    }
}

// MARK: - Security

/**
 * Security extension for SwiftDeviceHelpers
 * Handles jailbreak detection and developer mode checks
 */
private extension SwiftDeviceHelpers{
    
    /**
     * Checks if developer mode is likely enabled
     * Uses indirect indicators to detect developer mode
     * 
     * @return true if developer mode is likely enabled, false otherwise
     */
    func isLikelyDeveloperModeEnabled() -> Bool {
        // Check for developer directory existence
        if FileManager.default.fileExists(atPath: "/Developer") {
            return true
        }
        
        return false
    }
    
    /**
     * Comprehensive jailbreak detection
     * Uses multiple methods to detect if device is jailbroken:
     * - Known jailbreak file/directory checks
     * - Sandbox write test
     * - URL scheme checks
     * - Dynamic library injection checks
     * 
     * @return true if device is jailbroken, false otherwise
     */
    func isRooted() -> Bool {
        #if targetEnvironment(simulator)
        return false
        #endif

        // 1. Check for known jailbreak files/directories
        let paths = [
            "/Applications/Cydia.app",
            "/Library/MobileSubstrate/MobileSubstrate.dylib",
            "/bin/bash",
            "/usr/sbin/sshd",
            "/etc/apt",
            "/private/var/lib/apt/",
            "/usr/bin/ssh"
        ]
        for path in paths {
            if FileManager.default.fileExists(atPath: path) {
                return true
            }
        }

        // 2. Test writing outside sandbox
        let testWritePath = "/private/jb_test.txt"
        do {
            try "test".write(toFile: testWritePath, atomically: true, encoding: .utf8)
            try FileManager.default.removeItem(atPath: testWritePath)
            return true
        } catch {}

        // 3. Check for jailbreak URL schemes
        if let url = URL(string: "cydia://package/com.example.package") {
            if UIApplication.shared.canOpenURL(url) {
                return true
            }
        }

        // 4. Check for injected dynamic libraries
        for i in 0..<_dyld_image_count() {
            if let name = _dyld_get_image_name(i) {
                let path = String(cString: name)
                if path.contains("MobileSubstrate") {
                    return true
                }
            }
        }

        return false
    }
}
