package gece.dev.helpers

import android.content.Context
import io.flutter.plugin.common.MethodChannel.Result
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

/**
 * Idfa - Advertising ID (IDFA) manager for Android
 * 
 * Handles retrieval of advertising identifiers for both Google and Huawei ecosystems.
 * Supports both Google Mobile Services (GMS) and Huawei Mobile Services (HMS) advertising IDs.
 * 
 * Features:
 * - Cross-platform advertising ID support
 * - Asynchronous ID retrieval
 * - Error handling and fallback
 */
class Idfa(private val context: Context) {

    /** Device information provider for ecosystem detection */
    private val device = DeviceInfo(context)

    /**
     * Retrieves the advertising ID asynchronously
     * Uses coroutines to perform the operation on background thread
     * 
     * @param result Flutter result callback to return the advertising ID
     */
    suspend fun getId(result: Result) {
        try {
            // Perform advertising ID retrieval on IO thread
            val advertisingId = withContext(Dispatchers.IO) {
                getAdvertisingId()
            }
            result.success(advertisingId)
        } catch (e: Exception) {
            // Return null if advertising ID cannot be retrieved
            result.success(null)
        }
    }

    /**
     * Gets the advertising ID based on the device ecosystem
     * Supports both Google and Huawei advertising ID services
     * 
     * @return Advertising ID string or null if not available
     */
    private fun getAdvertisingId(): String? {
        return try {
            // Determine which advertising ID service to use based on device ecosystem
            val advertisingIdClientClass = Class.forName(
                if (device.isHMOS()) "com.huawei.hms.ads.identifier.AdvertisingIdClient"
                else "com.google.android.gms.ads.identifier.AdvertisingIdClient"
            )
            
            // Get the getAdvertisingIdInfo method
            val getInfoMethod = advertisingIdClientClass.getMethod("getAdvertisingIdInfo", Context::class.java)
            
            // Invoke the method to get advertising info
            val adInfo = getInfoMethod.invoke(null, context)
            
            // Extract the ID from the advertising info object
            adInfo?.javaClass?.getMethod("getId")?.invoke(adInfo) as? String
        } catch (e: Exception) {
            // Return null if any error occurs during ID retrieval
            null
        }
    }
}