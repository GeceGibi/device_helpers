package gece.dev.helpers

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** DeviceHelpers */
class DeviceHelpers : FlutterPlugin, MethodCallHandler, ActivityAware {

    private lateinit var channel: MethodChannel
    private lateinit var idfa: Idfa;
    private lateinit var device: DeviceInfo;
    private var routing: Routing? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        val context = flutterPluginBinding.applicationContext

        idfa = Idfa(context);
        device = DeviceInfo(context);

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
        // Log.d("DeviceHelpers", "Received method call: ${call.method}")

        when (call.method) {
            "get_idfa" -> idfa.getId(result)
            "request_tracking_authorization" -> requestTrackingAuthorization(result)
            "app_settings" -> routing?.openAppSettings() ?: result.error(
                "UNAVAILABLE",
                "Activity is not attached.",
                null
            )

            "app_notification_settings" -> routing?.openAppNotificationSettings()
                ?: result.error(
                    "UNAVAILABLE",
                    "Activity is not attached.",
                    null
                )

            "update_badge_request" -> result.success(false)
            "badge_update" -> updateBadge(call.arguments as Int)
            "get_info" -> device.info(result)
            else -> result.notImplemented()
        }
    }


    private fun requestTrackingAuthorization(result: Result) {
        result.success(4)
    }

    ///
    /// BADGE
    ///
    private fun updateBadge(count: Int) {
        // ShortcutBadger.applyCount(context, count)
    }

}
