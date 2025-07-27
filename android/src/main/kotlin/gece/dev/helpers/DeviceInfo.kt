package gece.dev.helpers

import android.annotation.SuppressLint
import android.content.Context
import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.content.res.Configuration
import android.os.Build
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
        val packageInfo = packageManager.getPackageInfo(context.packageName, 0)

        return mapOf(
            "appVersion" to packageInfo.versionName,
            "appBuild" to getVersionCode(packageInfo),
            "appName" to appInfo.loadLabel(packageManager).toString(),
            "appBundle" to context.packageName,
            "uuid" to getDeviceId(),
            "osVersion" to Build.VERSION.SDK_INT.toString(),
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
            "isRooted" to isRooted()
        )
    }

    /**
     * Checks if developer mode is enabled on the device
     * Uses system settings to determine developer mode status
     * 
     * @return true if developer mode is enabled, false otherwise
     */
    @Suppress("DEPRECATION")
    private fun isDeveloperModeEnabled(): Boolean {
        val status = Settings.Global.getInt(
            context.contentResolver, Settings.Secure.DEVELOPMENT_SETTINGS_ENABLED, 0
        )

        return status != 0;
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
            val bufferedReader = BufferedReader(InputStreamReader(process.inputStream))
            if (bufferedReader.readLine() != null) return true
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
     * Uses Google Play Services availability check
     * 
     * @return true if GMS is available, false otherwise
     */
    private fun isGMSAvailable(): Boolean = GoogleApiAvailability.getInstance()
        .isGooglePlayServicesAvailable(context) == ConnectionResult.SUCCESS

    /**
     * Checks if Huawei Mobile Services (HMS) are available
     * Uses Huawei Mobile Services availability check
     * 
     * @return true if HMS is available, false otherwise
     */
    private fun isHMSAvailable(): Boolean = HuaweiApiAvailability.getInstance()
        .isHuaweiMobileServicesAvailable(context) == ConnectionResult.SUCCESS

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
}