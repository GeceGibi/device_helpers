package gece.dev.helpers

import android.content.Context
import io.flutter.plugin.common.MethodChannel.Result
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

class Idfa(private val context: Context) {

    private val device = DeviceInfo(context)

    suspend fun getId(result: Result) {
        try {
            val advertisingId = withContext(Dispatchers.IO) {
                getAdvertisingId()
            }
            result.success(advertisingId)
        } catch (e: Exception) {
            result.success(null)
        }
    }

    private fun getAdvertisingId(): String? {
        return try {
            val advertisingIdClientClass = Class.forName(
                if (device.isHMOS()) "com.huawei.hms.ads.identifier.AdvertisingIdClient"
                else "com.google.android.gms.ads.identifier.AdvertisingIdClient"
            )
            
            val getInfoMethod = advertisingIdClientClass.getMethod("getAdvertisingIdInfo", Context::class.java)
            val adInfo = getInfoMethod.invoke(null, context)
            
            adInfo?.javaClass?.getMethod("getId")?.invoke(adInfo) as? String
        } catch (e: Exception) {
            null
        }
    }
}