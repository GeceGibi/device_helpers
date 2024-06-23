package gece.dev.helpers

class SystemProperties private constructor() {
    init {
        throw AssertionError("no instances")
    }

    companion object {
        private val SP = systemPropertiesClass

        /**
         * Get the value for the given key.
         */
        fun get(key: String?): String? {
            return try {
                SP!!.getMethod("get", String::class.java).invoke(null, key) as String
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
                SP!!.getMethod(
                    "get",
                    String::class.java,
                    String::class.java
                ).invoke(null, key, def) as String
            } catch (e: Exception) {
                def
            }
        }

        /**
         * Get the value for the given key, returned as a boolean. Values 'n', 'no', '0', 'false' or
         * 'off' are considered false. Values 'y', 'yes', '1', 'true' or 'on' are considered true. (case
         * sensitive). If the key does not exist, or has any other value, then the default result is
         * returned.
         *
         * @param key
         * the key to lookup
         * @param def
         * a default value to return
         * @return the key parsed as a boolean, or def if the key isn't found or is not able to be
         * parsed as a boolean.
         */
        fun getBoolean(key: String?, def: Boolean): Boolean {
            return try {
                SP!!.getMethod(
                    "getBoolean",
                    String::class.java,
                    Boolean::class.javaPrimitiveType
                )
                    .invoke(null, key, def) as Boolean
            } catch (e: Exception) {
                def
            }
        }

        /**
         * Get the value for the given key, and return as an integer.
         *
         * @param key
         * the key to lookup
         * @param def
         * a default value to return
         * @return the key parsed as an integer, or def if the key isn't found or cannot be parsed
         */
        fun getInt(key: String?, def: Int): Int {
            return try {
                SP!!.getMethod(
                    "getInt",
                    String::class.java,
                    Int::class.javaPrimitiveType
                ).invoke(null, key, def) as Int
            } catch (e: Exception) {
                def
            }
        }

        /**
         * Get the value for the given key, and return as a long.
         *
         * @param key
         * the key to lookup
         * @param def
         * a default value to return
         * @return the key parsed as a long, or def if the key isn't found or cannot be parsed
         */
        fun getLong(key: String?, def: Long): Long {
            return try {
                SP!!.getMethod(
                    "getLong",
                    String::class.java,
                    Long::class.javaPrimitiveType
                ).invoke(null, key, def) as Long
            } catch (e: Exception) {
                def
            }
        }

        private val systemPropertiesClass: Class<*>?
            get() = try {
                Class.forName("android.os.SystemProperties")
            } catch (shouldNotHappen: ClassNotFoundException) {
                null
            }
    }
}