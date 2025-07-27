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
import io.flutter.plugin.common.MethodChannel.Result

class DeviceInfo(private val context: Context) {

    private val checkEmulator = CheckEmulator()
    private val packageManager = context.packageManager

    fun info(result: MethodChannel.Result) {
        try {
            val deviceInfo = buildDeviceInfo()
            result.success(deviceInfo)
        } catch (error: Exception) {
            result.error("DEVICE_INFO", "Cannot get device info", error)
        }
    }

    private fun buildDeviceInfo(): Map<String, Any?> {
        val appInfo = context.applicationInfo
        val packageInfo = packageManager.getPackageInfo(context.packageName, 0)

        return mapOf(
            "app_version" to packageInfo.versionName,
            "app_build" to getVersionCode(packageInfo),
            "app_name" to appInfo.loadLabel(packageManager).toString(),
            "app_bundle" to context.packageName,
            "is_tablet" to isTablet(),
            "uuid" to getDeviceId(),
            "os_version" to Build.VERSION.SDK_INT.toString(),
            "manufacturer" to Build.MANUFACTURER,
            "brand" to Build.BRAND,
            "model" to Build.MODEL,
            "is_miui" to isMIUI(),
            "is_gms" to isGMSAvailable(),
            "is_hms" to isHMSAvailable(),
            "is_hmos" to isHMOS(),
            "is_tv" to isTV(),
            "is_emulator" to checkEmulator.isEmulator(),
            "is_developer_mode_enabled" to isDeveloperModeEnabled(),
            "is_rooted" to RootBeer(context).isRooted
        )
    }

    private fun isDeveloperModeEnabled(): Boolean {
        val status = Settings.Secure.getInt(
            context.contentResolver,
            Settings.Global.DEVELOPMENT_SETTINGS_ENABLED,
            0
        )

        return status != 0;
    }

    private fun isMIUI(): Boolean =
        !TextUtils.isEmpty(SystemProperties.get("ro.miui.ui.version.name"))

    fun isHMOS(): Boolean =
        try {
            Class.forName("ohos.app.Application")
            true
        } catch (e: Exception) {
            false
        }

    private fun isTV(): Boolean =
        packageManager.run {
            hasSystemFeature(PackageManager.FEATURE_TELEVISION) ||
                    hasSystemFeature(PackageManager.FEATURE_LEANBACK)
        }

    @SuppressLint("HardwareIds")
    private fun getDeviceId(): String =
        Settings.Secure.getString(context.contentResolver, Settings.Secure.ANDROID_ID) ?: ""

    private fun isGMSAvailable(): Boolean =
        GoogleApiAvailability.getInstance()
            .isGooglePlayServicesAvailable(context) == ConnectionResult.SUCCESS

    private fun isHMSAvailable(): Boolean =
        HuaweiApiAvailability.getInstance()
            .isHuaweiMobileServicesAvailable(context) == ConnectionResult.SUCCESS

    private fun isTablet(): Boolean {
        val screenConfig = context.resources.configuration
        return screenConfig.smallestScreenWidthDp
            .takeIf { it != Configuration.SMALLEST_SCREEN_WIDTH_DP_UNDEFINED }
            ?.let { it >= 600 } ?: false
    }

    private fun getVersionCode(info: PackageInfo): String =
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            info.longVersionCode.toString()
        } else {
            @Suppress("DEPRECATION")
            info.versionCode.toString()
        }
}