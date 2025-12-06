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
    /** Whether app is running in debug mode */
    let isDebugMode: Bool
    /** Whether USB debugging is enabled (iOS Developer Mode) */
    let isUsbDebuggingEnabled: Bool
    /** Whether debugger is attached */
    let isDebuggerAttached: Bool
    /** Whether hooking frameworks are detected */
    let isHookDetected: Bool
    
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
            "isDebugMode": isDebugMode,
            "isUsbDebuggingEnabled": isUsbDebuggingEnabled,
            "isDebuggerAttached": isDebuggerAttached,
            "isHookDetected": isHookDetected
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
        case "appSettings":
            openAppSettings()
            result(nil)
            
        case "appNotificationSettings":
            openAppNotificationSettings()
            result(nil)
            
        case "getInfo":
            getDeviceInfo(result: result)
            
        case "badgeUpdate":
            handleBadgeUpdate(call: call, result: result)
            
        case "updateBadgeRequest":
            updateBadgeRequest(result: result)
            
        case "getIdfa":
            getIdfa(result: result)
            
        case "requestTrackingAuthorization":
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
        
        UIApplication.shared.open(url) { success in
            if !success {
                print("Error: Failed to open app settings")
            }
        }
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
            
            UIApplication.shared.open(url) { success in
                if !success {
                    print("Error: Failed to open notification settings")
                }
            }
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
        let result = uname(&utsnameInstance)
        
        guard result == 0 else {
            print("Error: Failed to get device model, uname returned: \(result)")
            return "Unknown"
        }
        
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
            isDebugMode: isDebugMode(),
            isUsbDebuggingEnabled: isUsbDebuggingEnabled(),
            isDebuggerAttached: isDebuggerAttached(),
            isHookDetected: isHookDetected()
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
        
        // Validate badge count range
        guard badge >= 0 else {
            result(FlutterError(code: "INVALID_ARGUMENT", 
                              message: "Badge count must be non-negative", 
                              details: nil))
            return
        }
        
        do {
            try updateBadge(badge: badge)
            result(nil)
        } catch {
            result(FlutterError(code: "BADGE_UPDATE_FAILED", 
                              message: "Failed to update badge: \(error.localizedDescription)", 
                              details: nil))
        }
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
     * @throws Error if badge update fails
     */
    func updateBadge(badge: Int) throws {
        guard isBadgeSupported else {
            throw NSError(domain: "DeviceHelpers", 
                         code: 1001, 
                         userInfo: [NSLocalizedDescriptionKey: "Badge updates not supported"])
        }
        
        // Ensure we're on the main thread for UI updates
        if !Thread.isMainThread {
            DispatchQueue.main.sync {
                UIApplication.shared.applicationIconBadgeNumber = badge
            }
        } else {
            UIApplication.shared.applicationIconBadgeNumber = badge
        }
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
     * - URL scheme checks
     * - Dynamic library injection checks
     * - Sandbox integrity checks
     * 
     * @return true if device is jailbroken, false otherwise
     */
    func isRooted() -> Bool {
        #if targetEnvironment(simulator)
        return false
        #endif

        var jailbreakDetected = false

        // 1. Check for known jailbreak files/directories
        let jailbreakPaths = [
            "/Applications/Cydia.app",
            "/Library/MobileSubstrate/MobileSubstrate.dylib",
            "/bin/bash",
            "/usr/sbin/sshd",
            "/etc/apt",
            "/private/var/lib/apt/",
            "/usr/bin/ssh",
            "/Applications/blackra1n.app",
            "/Applications/FakeCarrier.app",
            "/Applications/Icy.app",
            "/Applications/IntelliScreen.app",
            "/Applications/MxTube.app",
            "/Applications/RockApp.app",
            "/Applications/SBSettings.app",
            "/Applications/WinterBoard.app",
            "/Library/MobileSubstrate/DynamicLibraries/Veency.plist",
            "/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist",
            "/System/Library/LaunchDaemons/com.ikey.bbot.plist",
            "/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist"
        ]
        
        for path in jailbreakPaths {
            if FileManager.default.fileExists(atPath: path) {
                jailbreakDetected = true
                break
            }
        }

        // 2. Check for jailbreak URL schemes
        let jailbreakURLSchemes = [
            "cydia://package/com.example.package",
            "cydia://",
            "sileo://",
            "zbra://"
        ]
        
        for scheme in jailbreakURLSchemes {
            if let url = URL(string: scheme) {
                if UIApplication.shared.canOpenURL(url) {
                    jailbreakDetected = true
                    break
                }
            }
        }

        // 3. Check for injected dynamic libraries (with proper memory management)
        let imageCount = _dyld_image_count()
        for i in 0..<imageCount {
            if let name = _dyld_get_image_name(i) {
                let path = String(cString: name)
                if path.contains("MobileSubstrate") || 
                   path.contains("SubstrateLoader") ||
                   path.contains("substitute") {
                    jailbreakDetected = true
                    break
                }
            }
        }

        // 4. Check sandbox integrity (safer approach)
        if !checkSandboxIntegrity() {
            jailbreakDetected = true
        }

        return jailbreakDetected
    }
    
    /**
     * Checks sandbox integrity without risky file operations
     * Uses safer methods to detect sandbox violations
     * 
     * @return true if sandbox is intact, false if compromised
     */
    private func checkSandboxIntegrity() -> Bool {
        // Check if we can access system directories that should be restricted
        let restrictedPaths = [
            "/private/var/mobile/Library/Caches",
            "/private/var/mobile/Containers/Data/Application"
        ]
        
        for path in restrictedPaths {
            if FileManager.default.isReadableFile(atPath: path) {
                // Try to list contents - this should fail in normal sandbox
                do {
                    let contents = try FileManager.default.contentsOfDirectory(atPath: path)
                    // If we can list contents of system directories, sandbox might be compromised
                    if !contents.isEmpty {
                        return false
                    }
                } catch {
                    // This is expected behavior - we shouldn't be able to read these directories
                    continue
                }
            }
        }
        
        return true
    }
    
    /**
     * Checks if the app is running in debug mode
     * Detects if the app was built with debug configuration
     * 
     * @return true if app is in debug mode, false otherwise
     */
    func isDebugMode() -> Bool {
        #if DEBUG
        return true
        #else
        // Check bundle configuration
        let bundlePath = Bundle.main.bundlePath
        return bundlePath.contains("Debug") || bundlePath.contains("debug")
        #endif
    }
    
    /**
     * Checks if USB debugging/Developer Mode is enabled
     * iOS 16+ has Developer Mode that needs to be enabled
     * 
     * @return true if developer mode is enabled, false otherwise
     */
    func isUsbDebuggingEnabled() -> Bool {
        // Check for developer mode indicators
        if FileManager.default.fileExists(atPath: "/Developer") {
            return true
        }
        
        // Check for Xcode developer tools
        if FileManager.default.fileExists(atPath: "/Applications/Xcode.app") {
            // Additional check: try to access developer directory
            let developerPath = "/var/db/dyld/dyld_shared_cache_arm64"
            if FileManager.default.fileExists(atPath: developerPath) {
                return true
            }
        }
        
        return false
    }
    
    /**
     * Checks if a debugger is currently attached to the process
     * Uses sysctl to detect debugger attachment
     * 
     * @return true if debugger is attached, false otherwise
     */
    func isDebuggerAttached() -> Bool {
        // Method 1: Use sysctl to check for debugger
        var mib: [Int32] = [CTL_KERN, KERN_PROC, KERN_PROC_PID, getpid()]
        var info = kinfo_proc()
        var size = MemoryLayout<kinfo_proc>.stride
        
        let result = sysctl(&mib, u_int(mib.count), &info, &size, nil, 0)
        
        if result == 0 {
            // Check if P_TRACED flag is set (indicates debugger is attached)
            // P_TRACED = 0x00000800
            let P_TRACED: Int32 = 0x00000800
            return (info.kp_proc.p_flag & P_TRACED) != 0
        }
        
        // Method 2: Check for common debugger processes
        let debuggerProcesses = ["lldb", "gdb", "debugserver"]
        for process in debuggerProcesses {
            if isProcessRunning(processName: process) {
                return true
            }
        }
        
        return false
    }
    
    /**
     * Checks if hooking frameworks are detected
     * Detects common hooking frameworks like Frida, SubstrateLoader, Cycript
     * 
     * @return true if any hooking framework is detected, false otherwise
     */
    func isHookDetected() -> Bool {
        // Check for Frida
        if isFridaDetected() {
            return true
        }
        
        // Check for SubstrateLoader (already checked in jailbreak detection, but double-check)
        if isSubstrateDetected() {
            return true
        }
        
        // Check for Cycript
        if isCycriptDetected() {
            return true
        }
        
        // Check for other hooking indicators
        if isHookingIndicatorsPresent() {
            return true
        }
        
        return false
    }
    
    /**
     * Checks if Frida is running
     * Frida is a dynamic instrumentation toolkit
     * 
     * @return true if Frida is detected, false otherwise
     */
    private func isFridaDetected() -> Bool {
        // Check for Frida server process
        if isProcessRunning(processName: "frida-server") {
            return true
        }
        
        // Check for Frida libraries in loaded images
        let imageCount = _dyld_image_count()
        for i in 0..<imageCount {
            if let name = _dyld_get_image_name(i) {
                let path = String(cString: name)
                if path.lowercased().contains("frida") ||
                   path.lowercased().contains("gadget") {
                    return true
                }
            }
        }
        
        // Check for Frida files
        let fridaFiles = [
            "/usr/lib/frida/frida-agent.dylib",
            "/Library/MobileSubstrate/DynamicLibraries/frida.dylib"
        ]
        
        for file in fridaFiles {
            if FileManager.default.fileExists(atPath: file) {
                return true
            }
        }
        
        return false
    }
    
    /**
     * Checks if SubstrateLoader is present
     * SubstrateLoader is used by jailbreak tweaks
     * 
     * @return true if SubstrateLoader is detected, false otherwise
     */
    private func isSubstrateDetected() -> Bool {
        let imageCount = _dyld_image_count()
        for i in 0..<imageCount {
            if let name = _dyld_get_image_name(i) {
                let path = String(cString: name)
                if path.contains("MobileSubstrate") ||
                   path.contains("SubstrateLoader") ||
                   path.contains("substitute") {
                    return true
                }
            }
        }
        
        return false
    }
    
    /**
     * Checks if Cycript is present
     * Cycript is a runtime manipulation tool
     * 
     * @return true if Cycript is detected, false otherwise
     */
    private func isCycriptDetected() -> Bool {
        // Check for Cycript process
        if isProcessRunning(processName: "cycript") {
            return true
        }
        
        // Check for Cycript libraries
        let imageCount = _dyld_image_count()
        for i in 0..<imageCount {
            if let name = _dyld_get_image_name(i) {
                let path = String(cString: name)
                if path.lowercased().contains("cycript") {
                    return true
                }
            }
        }
        
        return false
    }
    
    /**
     * Checks for general hooking indicators
     * Looks for common signs of runtime manipulation
     * 
     * @return true if hooking indicators are present, false otherwise
     */
    private func isHookingIndicatorsPresent() -> Bool {
        // Check loaded libraries for suspicious patterns
        let imageCount = _dyld_image_count()
        for i in 0..<imageCount {
            if let name = _dyld_get_image_name(i) {
                let path = String(cString: name)
                let lowerPath = path.lowercased()
                
                let suspiciousPatterns = [
                    "hook",
                    "inject",
                    "cycript",
                    "frida",
                    "substrate",
                    "theos"
                ]
                
                for pattern in suspiciousPatterns {
                    if lowerPath.contains(pattern) {
                        return true
                    }
                }
            }
        }
        
        return false
    }
    
    /**
     * Checks if a process is running
     * Uses ps command to check for process existence
     * 
     * @param processName Name of the process to check
     * @return true if process is running, false otherwise
     */
    private func isProcessRunning(processName: String) -> Bool {
        let task = Foundation.Process()
        task.executableURL = URL(fileURLWithPath: "/bin/ps")
        task.arguments = ["-A"]
        
        let pipe = Pipe()
        task.standardOutput = pipe
        
        do {
            try task.run()
            task.waitUntilExit()
            
            let data = pipe.fileHandleForReading.readDataToEndOfFile()
            if let output = String(data: data, encoding: .utf8) {
                return output.lowercased().contains(processName.lowercased())
            }
        } catch {
            // Ignore errors
        }
        
        return false
    }
}

