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


/** DeviceHelpers - Flutter plugin for device information and utilities */
class DeviceHelpers : FlutterPlugin, MethodCallHandler, ActivityAware {

    private lateinit var channel: MethodChannel
    private lateinit var idfa: Idfa
    private lateinit var device: DeviceInfo
    private lateinit var context: Context
    private var routing: Routing? = null
    private val coroutineScope = CoroutineScope(Dispatchers.Main)

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext

        idfa = Idfa(context)
        device = DeviceInfo(context)

        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "gece.dev/helpers")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        routing = Routing(binding.activity)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        routing = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        routing = Routing(binding.activity)
    }

    override fun onDetachedFromActivity() {
        routing = null
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "getIdfa" -> {
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

    private fun requestTrackingAuthorization(result: Result) {
        result.success(4)
    }




    private fun openAppSettings(result: Result) {
        routing?.openAppSettings() ?: result.error(
            "UNAVAILABLE",
            "Activity is not attached.",
            null
        )
    }

    private fun openAppNotificationSettings(result: Result) {
        routing?.openAppNotificationSettings() ?: result.error(
            "UNAVAILABLE",
            "Activity is not attached.",
            null
        )
    }

    private fun updateBadge(count: Int) {
        // ShortcutBadger.applyCount(context, count)
        // Badge functionality can be implemented here
    }
}
