package gece.dev.helpers

import android.annotation.SuppressLint
import android.app.ActivityManager
import android.content.Context
import android.content.pm.ApplicationInfo
import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.content.res.Configuration
import android.os.Build
import android.os.Environment
import android.os.StatFs
import android.provider.Settings
import android.text.TextUtils
import com.google.android.gms.common.ConnectionResult
import com.google.android.gms.common.GoogleApiAvailability
import com.huawei.hms.api.HuaweiApiAvailability
import io.flutter.plugin.common.MethodChannel

class DeviceInfo(private val context: Context) {

    private val checkEmulator = CheckEmulator();

    fun info(result: MethodChannel.Result) {
        try {
            val appInfo: ApplicationInfo = context.applicationInfo
            val packageInfo: PackageInfo = context.packageManager.getPackageInfo(
                context.packageName, 0,
            );

            val appVersion = packageInfo.versionName;
            val appBuild = getLongVersionCode(packageInfo);
            val appName = appInfo.loadLabel(context.packageManager).toString()

            val info = mapOf(
                "app_version" to appVersion,
                "app_build" to appBuild,
                "app_name" to appName,
                "app_bundle" to context.packageName,
                "is_tablet" to isTablet(),
                "uuid" to uuid(),
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
                "memory_total" to getMemoryTotal(),
                "storage_total" to getTotalDiskSpace(),
                "storage_free" to getFreeDiskSpace(),
            )

            result.success(info);
        } catch (error: Exception) {
            result.error("DEVICE_INFO", "CANNOT GET INFO", error)
        }
    }

    private fun isMIUI(): Boolean {
        return !TextUtils.isEmpty(SystemProperties.get("ro.miui.ui.version.name"))
    }

    fun isHMOS(): Boolean {
        return try {
            Class.forName("ohos.app.Application") != null
        } catch (e: Exception) {
            false
        }
    }

    private fun isTV(): Boolean {
        return context.packageManager.run {
            hasSystemFeature(PackageManager.FEATURE_TELEVISION) ||
                    (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP && hasSystemFeature(
                        PackageManager.FEATURE_LEANBACK
                    ))
        }
    }

    private fun getFreeDiskSpace(): Long {
        val statFs = StatFs(Environment.getDataDirectory().absolutePath)

        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR2) {
            statFs.availableBlocksLong * statFs.blockSizeLong
        } else {
            (statFs.availableBlocks * statFs.blockSize).toLong()
        }
    }

    @SuppressLint("HardwareIds")
    private fun uuid(): String {
        return Settings.Secure.getString(context.contentResolver, Settings.Secure.ANDROID_ID)
    }


    private fun isGMSAvailable(): Boolean {
        return GoogleApiAvailability.getInstance()
            .isGooglePlayServicesAvailable(context) == ConnectionResult.SUCCESS
    }

    private fun isHMSAvailable(): Boolean {
        return HuaweiApiAvailability.getInstance()
            .isHuaweiMobileServicesAvailable(context) == ConnectionResult.SUCCESS
    }

    private fun getMemoryTotal(): Long {
        val actManager = context.getSystemService(Context.ACTIVITY_SERVICE) as ActivityManager
        return ActivityManager.MemoryInfo().apply { actManager.getMemoryInfo(this) }.totalMem
    }

    private fun getTotalDiskSpace(): Long {
        val statFs = StatFs(Environment.getDataDirectory().absolutePath)
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR2) {
            statFs.blockCountLong * statFs.blockSizeLong
        } else {
            (statFs.blockCount * statFs.blockSize).toLong()
        }
    }


    private fun isTablet(): Boolean {
        val screenConfig = context.resources.configuration
        return screenConfig.smallestScreenWidthDp.takeIf { it != Configuration.SMALLEST_SCREEN_WIDTH_DP_UNDEFINED }
            ?.let {
                it >= 600
            } ?: false
    }

    private fun getLongVersionCode(info: PackageInfo): String {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            info.longVersionCode.toString()
        } else {
            info.versionCode.toString()
        }
    }
}