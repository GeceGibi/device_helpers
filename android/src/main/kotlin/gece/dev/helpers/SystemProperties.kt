package gece.dev.helpers

class SystemProperties private constructor() {
    init {
        throw AssertionError("No instances allowed")
    }

    companion object {
        private val systemPropertiesClass by lazy {
            try {
                Class.forName("android.os.SystemProperties")
            } catch (e: ClassNotFoundException) {
                null
            }
        }

        /**
         * Get the value for the given key.
         */
        fun get(key: String?): String? {
            return try {
                systemPropertiesClass?.getMethod("get", String::class.java)?.invoke(null, key) as? String
            } catch (e: Exception) {
                null
            }
        }

        /**
         * Get the value for the given key.
         *
         * @return if the key isn't found, return def if it isn't null, or an empty string otherwise
         */
        fun get(key: String?, def: String): String {
            return try {
                systemPropertiesClass?.getMethod("get", String::class.java, String::class.java)
                    ?.invoke(null, key, def) as? String ?: def
            } catch (e: Exception) {
                def
            }
        }
    }
}