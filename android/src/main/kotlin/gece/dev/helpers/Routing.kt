package gece.dev.helpers

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.provider.Settings

/**
 * Routing - Activity-based navigation utility
 * 
 * Handles navigation to system settings pages using Android Intents.
 * Provides methods to open app settings and notification settings.
 * 
 * Features:
 * - App settings navigation
 * - Notification settings navigation
 * - Version-specific intent handling
 * - Error handling for navigation failures
 */
class Routing(private val activity: Activity) {
    
    /**
     * Opens the app settings page
     * Navigates to the system settings page for the current app
     * Uses ACTION_APPLICATION_DETAILS_SETTINGS intent
     */
    fun openAppSettings() {
        try {
            // Create intent for app settings
            Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS).apply {
                // Set the package URI for the current app
                data = Uri.fromParts("package", activity.packageName, null)
                // Start the settings activity
                activity.startActivity(this)
            }
        } catch (e: Exception) {
            // Handle exception if settings cannot be opened
        }
    }

    /**
     * Opens the app notification settings page
     * Navigates to notification settings for the current app
     * Uses different intents based on Android version
     */
    fun openAppNotificationSettings() {
        try {
            val intent = Intent(
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                    // Use dedicated notification settings intent for Android 8.0+
                    Settings.ACTION_APP_NOTIFICATION_SETTINGS
                } else {
                    // Fall back to general app settings for older versions
                    Settings.ACTION_APPLICATION_DETAILS_SETTINGS
                }
            ).apply {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                    // Add package extra for notification settings
                    putExtra(Settings.EXTRA_APP_PACKAGE, activity.packageName)
                } else {
                    // Use package URI for older versions
                    data = Uri.fromParts("package", activity.packageName, null)
                }
            }
            // Start the settings activity
            activity.startActivity(intent)
        } catch (e: Exception) {
            // Handle exception if notification settings cannot be opened
        }
    }
}