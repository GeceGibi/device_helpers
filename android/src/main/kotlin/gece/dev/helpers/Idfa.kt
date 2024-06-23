package gece.dev.helpers

import android.content.Context
import io.flutter.plugin.common.MethodChannel.Result
import java.lang.reflect.Method
import java.util.concurrent.Executors

class Idfa(private val context: Context) {

    private val device = DeviceInfo(context);

    fun getId(result: Result) {
        val executor = Executors.newSingleThreadExecutor()

        executor.execute {
            try {
                val advertisingIdClient: Class<*> = Class.forName(
                    if (device.isHMOS()) "com.huawei.hms.ads.identifier.AdvertisingIdClient"
                    else "com.google.android.gms.ads.identifier.AdvertisingIdClient"
                )
                val getInfoMethod: Method = advertisingIdClient.getMethod(
                    "getAdvertisingIdInfo", Context::class.java
                )
                val adInfo: Any? = getInfoMethod.invoke(null, context)
                val getIdMetHod: Method? = adInfo?.javaClass?.getMethod("getId")

                result.success(if (adInfo != null && getIdMetHod != null) getIdMetHod(adInfo) else null)
            } catch (e: Exception) {
                result.success(null)
            }
        }
    }
}