package gece.dev.helpers

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.provider.Settings

class Routing(private val activity: Activity) {
    fun openAppSettings() {
        Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS).apply {
            data = Uri.fromParts("package", activity.packageName, null)
            activity.startActivity(this)
        }
    }

    fun openAppNotificationSettings() {
        val intent = Intent(
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) Settings.ACTION_APP_NOTIFICATION_SETTINGS
            else Settings.ACTION_APPLICATION_DETAILS_SETTINGS
        ).apply {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                putExtra(Settings.EXTRA_APP_PACKAGE, activity.packageName)
            } else {
                data = Uri.fromParts("package", activity.packageName, null)
            }
        }
        activity.startActivity(intent)
    }

}