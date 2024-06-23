import AppTrackingTransparency
import AdSupport
import Flutter
import UIKit

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
            break;
            
        case "app_notification_settings":
            openAppNotificationSettings()
            break;
            
        case "get_info":
            getDeviceInfo(result: result)
            break;
            
        case "badge_update":
            updateBadge(badge: call.arguments as! Int)
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
    
    ///
    /// TRACKING REQUEST & IDFA
    ///
    func getIdfa(result: @escaping FlutterResult) {
        if #available(iOS 14.0, *) {
            if ATTrackingManager.trackingAuthorizationStatus == .authorized  {
                result(ASIdentifierManager.shared().advertisingIdentifier.uuidString)
            } else {
                result(nil)
            }
        } else if ASIdentifierManager.shared().isAdvertisingTrackingEnabled {
            result(ASIdentifierManager.shared().advertisingIdentifier.uuidString)
        } else {
            result(nil)
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
            // DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {}
            ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
                result(Int(status.rawValue))
            })
        } else {
            result(Int(4))
        }
    }
    
    ///
    /// OPEN DEVICE SETTINGS SCREENS
    ///
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
    
    ///
    /// BADGE
    ///
    private var isSupportedBadge = false
    private func updateBadgeRequest(result: @escaping FlutterResult){
        UNUserNotificationCenter.current().requestAuthorization(options: .badge) {
            (granted, error) in
                self.isSupportedBadge = error == nil
                result(error == nil)
            
        }
    }
    
    private func updateBadge(badge: Int) {
        if (isSupportedBadge) {
            UIApplication.shared.applicationIconBadgeNumber = badge
        }
        
    }
    
    /// ----------
    /// DEVICE INFO
    /// ----------
    var totalDiskSpaceInBytes:Int64 {
        guard let systemAttributes = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory() as String),
              let space = (systemAttributes[FileAttributeKey.systemSize] as? NSNumber)?.int64Value else { return 0 }
        return space
    }
    
    var freeDiskSpaceInBytes:Int64 {
        get {
            do {
                let systemAttributes = try FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory() as String)
                let freeSpace = (systemAttributes[FileAttributeKey.systemFreeSize] as? NSNumber)?.int64Value
                return freeSpace!
            } catch {
                return 0
            }
        }
    }
    
    var isEmulator: Bool {
        return TARGET_OS_SIMULATOR != 0
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
        // Proxy
        let info = Bundle.main.infoDictionary
        
        let appVersion = info?["CFBundleShortVersionString"] as? String
        let appBuild = info?["CFBundleVersion"] as? String
        let appName = info?["CFBundleDisplayName"] as? String
        let appBundle = Bundle.main.bundleIdentifier
        let isTablet = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
        let uuid = UIDevice.current.identifierForVendor?.uuidString
        let systemVersion = UIDevice.current.systemVersion
        let manufacturer = "Apple"
        let brand = isTablet ? "iPad" : "iPhone"
        let model = unameMachine
        
        result([
            "app_version": appVersion!,
            "app_build": appBuild!,
            "app_name": appName!,
            "app_bundle": appBundle!,
            "is_tablet": isTablet,
            "uuid": uuid!,
            "os_version": systemVersion,
            "manufacturer": manufacturer,
            "brand": brand,
            "model": model,
            "is_emulator": isEmulator,
            "is_miui": false,
            "is_gms": false,
            "is_hms": false,
            "is_hmos": false,
            "is_tv": false,
            "memory_total": Int(ProcessInfo.processInfo.physicalMemory),
            "storage_total": totalDiskSpaceInBytes,
            "storage_free" : freeDiskSpaceInBytes,
        ])
    }
}
