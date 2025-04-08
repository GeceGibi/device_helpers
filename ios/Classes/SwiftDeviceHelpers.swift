import AppTrackingTransparency
import AdSupport
import Flutter
import UIKit
#import <TargetConditionals.h>

public class SwiftDeviceHelpers: NSObject, FlutterPlugin {
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "gece.dev/helpers", binaryMessenger: registrar.messenger())
        let instance = SwiftDeviceHelpers()
        
        registrar.addMethodCallDelegate(instance, channel: channel)
        registrar.addApplicationDelegate(instance)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "app_settings":
            openAppSettings()
            result(nil)
            break;
            
        case "app_notification_settings":
            openAppNotificationSettings()
            result(nil)
            break;
            
        case "get_info":
            getDeviceInfo(result: result)
            break;
            
        case "badge_update":
            if let badge = call.arguments as? Int {
                updateBadge(badge: badge)
            }
            result(nil)
            break;
            
        case "update_badge_request":
            updateBadgeRequest(result: result)
            break;
            
        case "get_idfa":
            getIdfa(result: result)
            break;
            
        case "request_tracking_authorization":
            requestTrackingAuthorization(result: result)
            break;
            
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    public func applicationDidBecomeActive(_ application: UIApplication) { }
    
    // MARK: - Tracking Request & IDFA
    private func getIdfa(result: @escaping FlutterResult) {
        if #available(iOS 14.0, *) {
            result(ATTrackingManager.trackingAuthorizationStatus == .authorized ?
                   ASIdentifierManager.shared().advertisingIdentifier.uuidString : nil)
        } else {
            result(ASIdentifierManager.shared().isAdvertisingTrackingEnabled ?
                   ASIdentifierManager.shared().advertisingIdentifier.uuidString : nil)
        }
    }
    
    /*
     case notDetermined = 0
     case restricted = 1
     case denied = 2
     case authorized = 3
     case notSupported = 4
     */
    private func requestTrackingAuthorization(result: @escaping FlutterResult) {
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                result(Int(status.rawValue))
            }
        } else {
            result(4) // notSupported
        }
    }
    
    // MARK: - Open Device Settings Screens
    private func openAppSettings(){
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url)
        }
    }
    
    private func openAppNotificationSettings(){
        if #available(iOS 16.0, *) {
            if let url = URL(string: UIApplication.openNotificationSettingsURLString) {
                UIApplication.shared.open(url)
            }
        } else {
            openAppSettings()
        }
    }
    
    // MARK: - Badge
    private var isSupportedBadge = false
    private func updateBadgeRequest(result: @escaping FlutterResult){
        UNUserNotificationCenter.current().requestAuthorization(options: .badge) { granted, error in
            self.isSupportedBadge = error == nil
            result(granted)
        }
    }
    
    private func updateBadge(badge: Int) {
        if (isSupportedBadge) {
            UIApplication.shared.applicationIconBadgeNumber = badge
        }
        
    }
    
    // MARK: - Device Info
    private var totalDiskSpaceInBytes: Int64 {
        (try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory())[.systemSize] as? NSNumber)?.int64Value ?? 0
    }
    
    private var freeDiskSpaceInBytes: Int64 {
        (try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory())[.systemFreeSize] as? NSNumber)?.int64Value ?? 0
    }
    
    
    var isEmulator: Bool {
        #if targetEnvironment(simulator)
            return true
        #else
            return false
        #endif
    }
    
    var unameMachine: String {
        var utsnameInstance = utsname()
        uname(&utsnameInstance)
        let machine: String? = withUnsafePointer(to: &utsnameInstance.machine) {
            $0.withMemoryRebound(to: CChar.self, capacity: 1) {
                ptr in String.init(validatingUTF8: ptr)
            }
        }
        
        return machine ?? "N/A"
    }
    
    
    private func getDeviceInfo(result: FlutterResult) {
        let info = Bundle.main.infoDictionary ?? [:]
        
        let deviceInfo: [String: Any] = [
            "app_version": info["CFBundleShortVersionString"] as? String ?? "N/A",
            "app_build": info["CFBundleVersion"] as? String ?? "N/A",
            "app_name": info["CFBundleDisplayName"] as? String ?? "N/A",
            "app_bundle": Bundle.main.bundleIdentifier ?? "N/A",
            "is_tablet": UIDevice.current.userInterfaceIdiom == .pad,
            "uuid": UIDevice.current.identifierForVendor?.uuidString ?? "N/A",
            "os_version": UIDevice.current.systemVersion,
            "manufacturer": "Apple",
            "brand": UIDevice.current.userInterfaceIdiom == .pad ? "iPad" : "iPhone",
            "model": unameMachine,
            "is_emulator": isEmulator,
            "memory_total": Int(ProcessInfo.processInfo.physicalMemory),
            "storage_total": totalDiskSpaceInBytes,
            "storage_free": freeDiskSpaceInBytes,
            "is_miui": false,
            "is_gms": false,
            "is_hms": false,
            "is_hmos": false,
            "is_tv": false,
        ]
        
        result(deviceInfo)
    }
}
