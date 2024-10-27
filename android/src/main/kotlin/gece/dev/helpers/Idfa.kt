package gece.dev.helpers

import android.content.Context
import io.flutter.plugin.common.MethodChannel.Result
import java.util.concurrent.Executors

class Idfa(private val context: Context) {

    private val device = DeviceInfo(context);

    fun getId(result: Result) {
        val executor = Executors.newSingleThreadExecutor()

        executor.execute {
            try {
                val advertisingIdClientClass: Class<*> = Class.forName(
                    if (device.isHMOS()) "com.huawei.hms.ads.identifier.AdvertisingIdClient"
                    else "com.google.android.gms.ads.identifier.AdvertisingIdClient"
                )
                // Obtain the getAdvertisingIdInfo method and invoke it with the context
                val getInfoMethod = advertisingIdClientClass.getMethod("getAdvertisingIdInfo", Context::class.java)
                val adInfo = getInfoMethod.invoke(null, context)

                // Extract the ID using getId if adInfo is not null
                val id = adInfo?.javaClass?.getMethod("getId")?.invoke(adInfo) as? String
                result.success(id)
            } catch (e: Exception) {
                result.success(null)
            } finally {
                executor.shutdown()
            }
        }
    }
}