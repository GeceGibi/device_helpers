package gece.dev.helpers

import android.annotation.SuppressLint
import android.content.Context
import android.content.pm.ApplicationInfo
import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.content.res.Configuration
import android.os.Build
import android.os.Debug
import android.provider.Settings
import android.text.TextUtils
import com.google.android.gms.common.ConnectionResult
import com.google.android.gms.common.GoogleApiAvailability
import com.huawei.hms.api.HuaweiApiAvailability
import com.scottyab.rootbeer.RootBeer
import io.flutter.plugin.common.MethodChannel
import java.io.BufferedReader
import java.io.File
import java.io.InputStreamReader

/**
 * DeviceInfo - Device information provider for Android
 * 
 * Collects comprehensive device information including:
 * - App version and build information
 * - Device hardware and software details
 * - Emulator detection
 * - Root detection
 * - Manufacturer and OS specific checks
 * - Device type detection (tablet, TV, etc.)
 */
class DeviceInfo(private val context: Context) {

    /** Emulator detection utility */
    private val checkEmulator = CheckEmulator()
    
    /** Package manager for app information */
    private val packageManager = context.packageManager

    /**
     * Retrieves comprehensive device information
     * Builds a map containing all device and app related information
     * 
     * @param result Flutter result callback to return the device info
     */
    fun info(result: MethodChannel.Result) {
        try {
            val deviceInfo = buildDeviceInfo()
            result.success(deviceInfo)
        } catch (error: Exception) {
            result.error("DEVICE_INFO", "Cannot get device info", error)
        }
    }

    /**
     * Builds a comprehensive device information map
     * Contains app details, device hardware info, and various system checks
     * 
     * @return Map containing all device information
     */
    private fun buildDeviceInfo(): Map<String, Any?> {
        val appInfo = context.applicationInfo
        val packageInfo = try {
            packageManager.getPackageInfo(context.packageName, 0)
        } catch (e: Exception) {
            null
        }

        return mapOf(
            "appVersion" to (packageInfo?.versionName ?: ""),
            "appBuild" to (packageInfo?.let { getVersionCode(it) } ?: ""),
            "appName" to appInfo.loadLabel(packageManager).toString(),
            "appBundle" to context.packageName,
            "uuid" to getDeviceId(),
            "os" to "android",
            "osVersion" to Build.VERSION.SDK_INT.toString(),
            "sdkVersion" to Build.VERSION.RELEASE,
            "manufacturer" to Build.MANUFACTURER,
            "brand" to Build.BRAND,
            "model" to Build.MODEL,
            "isMiui" to isMIUI(),
            "isTablet" to isTablet(),
            "isGms" to isGMSAvailable(),
            "isHms" to isHMSAvailable(),
            "isHmos" to isHMOS(),
            "isTv" to isTV(),
            "isEmulator" to checkEmulator.isEmulator(),
            "isDeveloper_mode_enabled" to isDeveloperModeEnabled(),
            "isRooted" to isRooted(),
            "isDebugMode" to isDebugMode(),
            "isUsbDebuggingEnabled" to isUsbDebuggingEnabled(),
            "isDebuggerAttached" to isDebuggerAttached(),
            "isHookDetected" to isHookDetected()
        )
    }

    /**
     * Checks if developer mode is enabled on the device
     * Also checks for development settings enabled flag
     * 
     * @return true if developer mode is enabled, false otherwise
     */
    private fun isDeveloperModeEnabled(): Boolean {
        return try {
            // Check if USB debugging is enabled
            val adbEnabled = Settings.Global.getInt(
                context.contentResolver, Settings.Global.ADB_ENABLED, 0
            ) != 0
            
            // Check if development settings are enabled
            @Suppress("DEPRECATION")
            val devSettingsEnabled = Settings.Global.getInt(
                context.contentResolver, Settings.Global.DEVELOPMENT_SETTINGS_ENABLED, 0
            ) != 0
            
            adbEnabled || devSettingsEnabled
        } catch (e: Exception) {
            false
        }
    }

    /**
     * Comprehensive root detection
     * Uses multiple methods to detect if the device is rooted:
     * - RootBeer library detection
     * - Build tags check for test-keys
     * - Common root binary paths
     * - Runtime execution test
     * 
     * @return true if device is rooted, false otherwise
     */
    private fun isRooted(): Boolean {
        // Use RootBeer library for primary detection
        val rootBeer = RootBeer(context)
        if (rootBeer.isRooted) return true

        // Check build tags for test-keys (indicates custom ROM)
        val buildTags = Build.TAGS
        if (buildTags != null && buildTags.contains("test-keys")) return true

        // Check common root binary paths
        val paths = arrayOf(
            "/system/app/Superuser.apk",
            "/sbin/su",
            "/system/bin/su",
            "/system/xbin/su",
            "/data/local/xbin/su",
            "/data/local/bin/su",
            "/system/sd/xbin/su",
            "/system/bin/failsafe/su",
            "/data/local/su"
        )
        for (path in paths) {
            if (File(path).exists()) return true
        }

        // Try to execute 'su' command to check if it's available
        try {
            val process = Runtime.getRuntime().exec(arrayOf("/system/xbin/which", "su"))
            BufferedReader(InputStreamReader(process.inputStream)).use { reader ->
                if (reader.readLine() != null) return true
            }
        } catch (_: Exception) {}

        return false
    }

    /**
     * Checks if the device is running MIUI (Xiaomi's custom Android ROM)
     * Uses system properties to detect MIUI
     * 
     * @return true if device is running MIUI, false otherwise
     */
    private fun isMIUI(): Boolean =
        !TextUtils.isEmpty(SystemProperties.get("ro.miui.ui.version.name"))

    /**
     * Checks if the device is running HarmonyOS (Huawei's operating system)
     * Attempts to load HarmonyOS specific classes
     * 
     * @return true if device is running HarmonyOS, false otherwise
     */
    fun isHMOS(): Boolean = try {
        Class.forName("ohos.app.Application")
        true
    } catch (e: Exception) {
        false
    }

    /**
     * Checks if the device is a TV
     * Uses package manager features to detect TV capabilities
     * 
     * @return true if device is a TV, false otherwise
     */
    private fun isTV(): Boolean = packageManager.run {
        hasSystemFeature(PackageManager.FEATURE_TELEVISION) ||
                hasSystemFeature(PackageManager.FEATURE_LEANBACK)
    }

    /**
     * Gets the unique device identifier
     * Uses Android ID as the device identifier
     * 
     * @return Device ID string or empty string if not available
     */
    @SuppressLint("HardwareIds")
    private fun getDeviceId(): String =
        Settings.Secure.getString(context.contentResolver, Settings.Secure.ANDROID_ID) ?: ""

    /**
     * Checks if Google Mobile Services (GMS) are available
     * Uses both PackageManager check and Google Play Services availability check
     * 
     * @return true if GMS is available, false otherwise
     */
    private fun isGMSAvailable(): Boolean {
        // First check if Google Play Services package is installed
        return try {
            packageManager.getPackageInfo("com.google.android.gms", 0)
            // If package exists, also verify via GoogleApiAvailability
            GoogleApiAvailability.getInstance()
                .isGooglePlayServicesAvailable(context) == ConnectionResult.SUCCESS
        } catch (e: PackageManager.NameNotFoundException) {
            false
        }
    }

    /**
     * Checks if Huawei Mobile Services (HMS) are available
     * Uses both PackageManager check and Huawei Mobile Services availability check
     * 
     * @return true if HMS is available, false otherwise
     */
    private fun isHMSAvailable(): Boolean {
        // First check if Huawei Mobile Services package is installed
        return try {
            packageManager.getPackageInfo("com.huawei.hms", 0)
            // If package exists, also verify via HuaweiApiAvailability
            HuaweiApiAvailability.getInstance()
                .isHuaweiMobileServicesAvailable(context) == ConnectionResult.SUCCESS
        } catch (e: PackageManager.NameNotFoundException) {
            false
        }
    }

    /**
     * Checks if the device is a tablet
     * Uses screen configuration to determine if device is a tablet
     * 
     * @return true if device is a tablet, false otherwise
     */
    private fun isTablet(): Boolean {
        val screenConfig = context.resources.configuration
        return screenConfig.smallestScreenWidthDp.takeIf { it != Configuration.SMALLEST_SCREEN_WIDTH_DP_UNDEFINED }
            ?.let { it >= 600 } ?: false
    }

    /**
     * Gets the version code of the app
     * Handles different version code types based on Android API level
     * 
     * @param info Package info containing version information
     * @return Version code as string
     */
    private fun getVersionCode(info: PackageInfo): String =
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            info.longVersionCode.toString()
        } else {
            @Suppress("DEPRECATION") info.versionCode.toString()
        }

    /**
     * Checks if the app is running in debug mode
     * Detects if the app was built with debug flag enabled
     * Also checks for BuildConfig.DEBUG flag
     * 
     * @return true if app is in debug mode, false otherwise
     */
    private fun isDebugMode(): Boolean {
        return try {
            // Check ApplicationInfo flag (most reliable)
            val isDebuggable = (context.applicationInfo.flags and ApplicationInfo.FLAG_DEBUGGABLE) != 0
            
            // Additional check: Try to access BuildConfig.DEBUG via reflection
            val buildConfigDebug = try {
                val buildConfigClass = Class.forName("${context.packageName}.BuildConfig")
                val debugField = buildConfigClass.getField("DEBUG")
                debugField.getBoolean(null)
            } catch (e: Exception) {
                false
            }
            
            isDebuggable || buildConfigDebug
        } catch (e: Exception) {
            false
        }
    }

    /**
     * Checks if USB debugging is enabled on the device
     * Uses system settings to determine USB debugging status
     * 
     * @return true if USB debugging is enabled, false otherwise
     */
    private fun isUsbDebuggingEnabled(): Boolean {
        return try {
            Settings.Global.getInt(
                context.contentResolver, Settings.Global.ADB_ENABLED, 0
            ) != 0
        } catch (e: Exception) {
            false
        }
    }

    /**
     * Checks if a debugger is currently attached to the process
     * Detects if the app is being debugged at runtime
     * 
     * @return true if debugger is attached, false otherwise
     */
    private fun isDebuggerAttached(): Boolean {
        return try {
            Debug.isDebuggerConnected()
        } catch (e: Exception) {
            false
        }
    }

    /**
     * Checks if hooking frameworks are detected
     * Detects common hooking frameworks like Xposed, Frida, Substrate
     * 
     * @return true if any hooking framework is detected, false otherwise
     */
    private fun isHookDetected(): Boolean {
        // Check for Xposed Framework
        if (isXposedDetected()) return true
        
        // Check for Frida
        if (isFridaDetected()) return true
        
        // Check for Substrate
        if (isSubstrateDetected()) return true
        
        // Check for other hooking indicators
        if (isHookingIndicatorsPresent()) return true
        
        return false
    }

    /**
     * Checks if Xposed Framework is installed
     * Xposed is a popular hooking framework for Android
     * 
     * @return true if Xposed is detected, false otherwise
     */
    private fun isXposedDetected(): Boolean {
        // Check for Xposed classes
        val xposedClasses = arrayOf(
            "de.robv.android.xposed.XposedBridge",
            "de.robv.android.xposed.XposedHelpers",
            "de.robv.android.xposed.XposedInit"
        )
        
        for (className in xposedClasses) {
            try {
                Class.forName(className)
                return true
            } catch (e: ClassNotFoundException) {
                // Continue checking
            }
        }
        
        // Check for Xposed files
        val xposedFiles = arrayOf(
            "/system/framework/XposedBridge.jar",
            "/data/data/de.robv.android.xposed.installer",
            "/system/bin/app_process32_xposed",
            "/system/bin/app_process64_xposed"
        )
        
        for (filePath in xposedFiles) {
            if (File(filePath).exists()) return true
        }
        
        // Check for Xposed system properties
        val xposedProps = arrayOf(
            "ro.xposed.version",
            "xposed.prop"
        )
        
        for (prop in xposedProps) {
            if (!TextUtils.isEmpty(SystemProperties.get(prop))) return true
        }
        
        return false
    }

    /**
     * Checks if Frida is running
     * Frida is a dynamic instrumentation toolkit
     * 
     * @return true if Frida is detected, false otherwise
     */
    private fun isFridaDetected(): Boolean {
        // Check for Frida server process
        try {
            val process = Runtime.getRuntime().exec("ps")
            BufferedReader(InputStreamReader(process.inputStream)).use { reader ->
                var line: String?
                while (reader.readLine().also { line = it } != null) {
                    if (line?.lowercase()?.contains("frida") == true) {
                        return true
                    }
                }
            }
        } catch (e: Exception) {
            // Ignore
        }
        
        // Check for Frida libraries
        val fridaFiles = arrayOf(
            "/data/local/tmp/frida-server",
            "/data/local/tmp/re.frida.server",
            "/sdcard/frida-server"
        )
        
        for (filePath in fridaFiles) {
            if (File(filePath).exists()) return true
        }
        
        // Check for Frida in loaded libraries
        try {
            val mapsFile = File("/proc/self/maps")
            if (mapsFile.exists()) {
                // Use buffered reader for large files instead of readText()
                mapsFile.bufferedReader().use { reader ->
                    reader.lineSequence().forEach { line ->
                        if (line.contains("frida", ignoreCase = true) || 
                            line.contains("gadget", ignoreCase = true)) {
                            return true
                        }
                    }
                }
            }
        } catch (e: Exception) {
            // Ignore
        }
        
        return false
    }

    /**
     * Checks if Substrate is installed
     * Substrate is a hooking framework (less common)
     * 
     * @return true if Substrate is detected, false otherwise
     */
    private fun isSubstrateDetected(): Boolean {
        val substrateFiles = arrayOf(
            "/data/lib/substrate",
            "/data/lib/substrate.so"
        )
        
        for (filePath in substrateFiles) {
            if (File(filePath).exists()) return true
        }
        
        return false
    }

    /**
     * Checks for general hooking indicators
     * Looks for common signs of runtime manipulation
     * 
     * @return true if hooking indicators are present, false otherwise
     */
    private fun isHookingIndicatorsPresent(): Boolean {
        // Check for suspicious libraries in /proc/self/maps
        try {
            val mapsFile = File("/proc/self/maps")
            if (mapsFile.exists()) {
                val suspiciousPatterns = arrayOf(
                    "substrate",
                    "xposed",
                    "frida",
                    "cycript",
                    "hook",
                    "inject"
                )
                
                // Use buffered reader for large files
                mapsFile.bufferedReader().use { reader ->
                    reader.lineSequence().forEach { line ->
                        val lineLower = line.lowercase()
                        for (pattern in suspiciousPatterns) {
                            if (lineLower.contains(pattern)) {
                                return true
                            }
                        }
                    }
                }
            }
        } catch (e: Exception) {
            // Ignore
        }
        
        return false
    }
}