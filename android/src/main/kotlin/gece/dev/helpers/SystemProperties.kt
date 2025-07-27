package gece.dev.helpers

/**
 * SystemProperties - Android system properties access utility
 * 
 * Provides access to Android system properties through reflection.
 * Uses the hidden android.os.SystemProperties class to read system properties.
 * 
 * Features:
 * - System property reading
 * - Fallback value support
 * - Error handling for missing properties
 * - Singleton pattern with utility methods
 */
class SystemProperties private constructor() {
    init {
        throw AssertionError("No instances allowed")
    }

    companion object {
        /** Lazy-loaded SystemProperties class reference */
        private val systemPropertiesClass by lazy {
            try {
                Class.forName("android.os.SystemProperties")
            } catch (e: ClassNotFoundException) {
                null
            }
        }

        /**
         * Gets the value for the given system property key
         * Returns null if the property doesn't exist or cannot be accessed
         * 
         * @param key The system property key to retrieve
         * @return The property value as string or null if not found
         */
        fun get(key: String?): String? {
            return try {
                // Use reflection to call SystemProperties.get(String)
                systemPropertiesClass?.getMethod("get", String::class.java)?.invoke(null, key) as? String
            } catch (e: Exception) {
                null
            }
        }

        /**
         * Gets the value for the given system property key with fallback
         * Returns the provided default value if the property doesn't exist
         * 
         * @param key The system property key to retrieve
         * @param def The default value to return if property is not found
         * @return The property value as string or the default value if not found
         */
        fun get(key: String?, def: String): String {
            return try {
                // Use reflection to call SystemProperties.get(String, String)
                systemPropertiesClass?.getMethod("get", String::class.java, String::class.java)
                    ?.invoke(null, key, def) as? String ?: def
            } catch (e: Exception) {
                def
            }
        }
    }
}