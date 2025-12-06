package gece.dev.helpers

import android.content.Context
import android.os.Build
import android.provider.Settings;
import androidx.annotation.RequiresApi
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch


/**
 * DeviceHelpers - Flutter plugin for device information and utilities
 * 
 * Main plugin class that handles method calls from Flutter side and coordinates
 * between different device information providers and utilities.
 * 
 * Features:
 * - Device information retrieval
 * - IDFA (Advertising ID) management
 * - App settings navigation
 * - Badge management
 * - Tracking authorization
 */
class DeviceHelpers : FlutterPlugin, MethodCallHandler, ActivityAware {

    /** Method channel for Flutter communication */
    private lateinit var channel: MethodChannel
    
    /** IDFA manager for advertising ID operations */
    private lateinit var idfa: Idfa
    
    /** Device information provider */
    private lateinit var device: DeviceInfo
    
    /** Application context */
    private lateinit var context: Context
    
    /** Activity routing for settings navigation */
    private var routing: Routing? = null
    
    /** Coroutine scope for async operations */
    private val coroutineScope = CoroutineScope(Dispatchers.Main)

    /**
     * Called when the plugin is attached to the Flutter engine
     * Initializes all required components and sets up the method channel
     */
    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext

        // Initialize device information and IDFA managers
        idfa = Idfa(context)
        device = DeviceInfo(context)

        // Set up method channel for Flutter communication
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "gece.dev/helpers")
        channel.setMethodCallHandler(this)
    }

    /**
     * Called when the plugin is detached from the Flutter engine
     * Cleans up the method channel handler
     */
    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    /**
     * Called when the plugin is attached to an activity
     * Initializes routing for settings navigation
     */
    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        routing = Routing(binding.activity)
    }

    /**
     * Called when the activity is detached for configuration changes
     * Cleans up routing reference
     */
    override fun onDetachedFromActivityForConfigChanges() {
        routing = null
    }

    /**
     * Called when the plugin is reattached to an activity after configuration changes
     * Reinitializes routing for settings navigation
     */
    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        routing = Routing(binding.activity)
    }

    /**
     * Called when the activity is permanently detached
     * Cleans up routing reference
     */
    override fun onDetachedFromActivity() {
        routing = null
    }

    /**
     * Handles method calls from Flutter side
     * Routes different method calls to appropriate handlers
     * 
     * @param call The method call from Flutter
     * @param result The result callback to send response back to Flutter
     */
    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "getIdfa" -> {
                // Get advertising ID asynchronously
                coroutineScope.launch {
                    idfa.getId(result)
                }
            }

            "requestTrackingAuthorization" -> requestTrackingAuthorization(result)
            "appSettings" -> openAppSettings(result)
            "appNotificationSettings" -> openAppNotificationSettings(result)
            "updateBadgeRequest" -> result.success(false)
            "badgeUpdate" -> updateBadge(call.arguments as? Int ?: 0)
            "getInfo" -> device.info(result)
            else -> result.notImplemented()
        }
    }

    /**
     * Handles tracking authorization request
     * Currently returns a default value (4) as Android doesn't have native tracking authorization
     * 
     * @param result Flutter result callback
     */
    private fun requestTrackingAuthorization(result: Result) {
        result.success(4)
    }

    /**
     * Opens the app settings page
     * Uses routing to navigate to app settings if activity is available
     * 
     * @param result Flutter result callback
     */
    private fun openAppSettings(result: Result) {
        routing?.openAppSettings(result) ?: result.error(
            "UNAVAILABLE",
            "Activity is not attached.",
            null
        )
    }

    /**
     * Opens the app notification settings page
     * Uses routing to navigate to notification settings if activity is available
     * 
     * @param result Flutter result callback
     */
    private fun openAppNotificationSettings(result: Result) {
        routing?.openAppNotificationSettings(result) ?: result.error(
            "UNAVAILABLE",
            "Activity is not attached.",
            null
        )
    }

    /**
     * Updates the app badge count
     * Currently a placeholder for badge functionality
     * 
     * @param count The badge count to set
     */
    private fun updateBadge(count: Int) {
        // ShortcutBadger.applyCount(context, count)
        // Badge functionality can be implemented here
    }
}
