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

            val info: MutableMap<String, Any> = hashMapOf(
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
                "is_miui" to !TextUtils.isEmpty(SystemProperties.get("ro.miui.ui.version.name")),
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
        } catch (e: Exception) {
            result.error("DEVICE_INFO", "CANNOT GET INFO", e.stackTrace)
        }
    }

    fun isHMOS(): Boolean {
        try {
            return Class.forName("ohos.app.Application") != null
        } catch (e: Exception) {
            // no-op
        }

        return false
    }


    private fun isTV(): Boolean {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            (context.packageManager.hasSystemFeature(PackageManager.FEATURE_TELEVISION)
                    || context.packageManager.hasSystemFeature(PackageManager.FEATURE_LEANBACK))
        } else {
            context.packageManager.hasSystemFeature(PackageManager.FEATURE_TELEVISION)
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
        val result = GoogleApiAvailability.getInstance().isGooglePlayServicesAvailable(context)
        return ConnectionResult.SUCCESS == result
    }

    private fun isHMSAvailable(): Boolean {
        val result = HuaweiApiAvailability.getInstance().isHuaweiMobileServicesAvailable(context)
        return ConnectionResult.SUCCESS == result
    }

    private fun getMemoryTotal(): Long {
        val actManager = context.getSystemService(Context.ACTIVITY_SERVICE) as ActivityManager
        val info = ActivityManager.MemoryInfo()
        actManager.getMemoryInfo(info)
        return info.totalMem
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
        val smallestScreenWidthDp: Int = context.resources.configuration.smallestScreenWidthDp
        if (smallestScreenWidthDp == Configuration.SMALLEST_SCREEN_WIDTH_DP_UNDEFINED) {
            return false
        }
        return smallestScreenWidthDp >= 600
    }

    private fun getLongVersionCode(info: PackageInfo): String {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            info.longVersionCode.toString()
        } else info.versionCode.toString()
    }
}