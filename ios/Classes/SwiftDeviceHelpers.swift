import AppTrackingTransparency
import AdSupport
import Flutter
import UIKit
import UserNotifications
import DTTJailbreakDetection

// MARK: - Device Info Model
private struct DeviceInfo {
    let appVersion: String
    let appBuild: String
    let appName: String
    let appBundle: String
    let isTablet: Bool
    let uuid: String
    let osVersion: String
    let manufacturer: String
    let brand: String
    let model: String
    let isEmulator: Bool
    let isMiui: Bool
    let isGms: Bool
    let isHms: Bool
    let isHmos: Bool
    let isTv: Bool
    let isDeveloperModeEnabled: Bool
    let isRooted: Bool
    
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
private enum TrackingStatus: Int {
    case notDetermined = 0
    case restricted = 1
    case denied = 2
    case authorized = 3
    case notSupported = 4
}

// MARK: - Main Plugin Class
public class SwiftDeviceHelpers: NSObject, FlutterPlugin {
    
    // MARK: - Properties
    private var isBadgeSupported = false
    
    // MARK: - Plugin Registration
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
    public func applicationDidBecomeActive(_ application: UIApplication) {
        // Additional operations can be added here if needed
    }
}

// MARK: - Settings Management
private extension SwiftDeviceHelpers {
    
    func openAppSettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else {
            print("Error: Could not create settings URL")
            return
        }
        UIApplication.shared.open(url)
    }
    
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
private extension SwiftDeviceHelpers {
    
    var isEmulator: Bool {
        #if targetEnvironment(simulator)
            return true
        #else
            return false
        #endif
    }
    
    var deviceModel: String {
        var utsnameInstance = utsname()
        uname(&utsnameInstance)
        
        return withUnsafePointer(to: &utsnameInstance.machine) { pointer in
            pointer.withMemoryRebound(to: CChar.self, capacity: 1) { charPointer in
                String(validatingUTF8: charPointer) ?? "Unknown"
            }
        }
    }
    
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
            isDeveloperModeEnabled: isDeveloperModeEnabled(),
            isRooted: false,
        )
        
        result(deviceInfo.toDictionary)
    }
}

// MARK: - Badge Management
private extension SwiftDeviceHelpers {
    
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
    
    func updateBadgeRequest(result: @escaping FlutterResult) {
        UNUserNotificationCenter.current().requestAuthorization(options: .badge) { [weak self] granted, error in
            DispatchQueue.main.async {
                self?.isBadgeSupported = error == nil
                result(granted)
            }
        }
    }
    
    func updateBadge(badge: Int) {
        guard isBadgeSupported else {
            print("Warning: Badge updates not supported")
            return
        }
        UIApplication.shared.applicationIconBadgeNumber = badge
    }
}

// MARK: - Tracking Authorization
private extension SwiftDeviceHelpers {
    
    func getIdfa(result: @escaping FlutterResult) {
        if #available(iOS 14.0, *) {
            let isAuthorized = ATTrackingManager.trackingAuthorizationStatus == .authorized
            let idfa = isAuthorized ? ASIdentifierManager.shared().advertisingIdentifier.uuidString : nil
            result(idfa)
        } else {
            let isEnabled = ASIdentifierManager.shared().isAdvertisingTrackingEnabled
            let idfa = isEnabled ? ASIdentifierManager.shared().advertisingIdentifier.uuidString : nil
            result(idfa)
        }
    }
    
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
private extension SwiftDeviceHelpers{
    
    func isDeveloperModeEnabled() -> Bool {
       // if #available(iOS 16.0, *) {
       //     return DMUserConsent.isDeveloperModeEnabled
       // } else {
       //     return false
       // }
        
        return false
    }
    
    func isRooted() -> Bool {
        return DTTJailbreakDetection.isJailbroken()
    }
}
