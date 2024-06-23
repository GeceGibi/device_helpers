package gece.dev.helpers

import android.os.Build
import java.io.File

class CheckEmulator {

    private val GENY_FILES: ArrayList<String> = ArrayList(
        mutableListOf(
            "/dev/socket/genyd",
            "/dev/socket/baseband_genyd"
        )
    )

    private val PIPES: ArrayList<String> = ArrayList(
        mutableListOf(
            "/dev/socket/qemud",
            "/dev/qemu_pipe"
        )
    )
    private val X86_FILES: ArrayList<String> = ArrayList(
        mutableListOf(
            "ueventd.android_x86.rc",
            "x86.prop",
            "ueventd.ttVM_x86.rc",
            "init.ttVM_x86.rc",
            "fstab.ttVM_x86",
            "fstab.vbox86",
            "init.vbox86.rc",
            "ueventd.vbox86.rc"
        )
    )

    private val ANDY_FILES: ArrayList<String> = ArrayList(
        mutableListOf(
            "fstab.andy",
            "ueventd.andy.rc"
        )
    )

    private val NOX_FILES: ArrayList<String> = ArrayList(
        mutableListOf(
            "fstab.nox",
            "init.nox.rc",
            "ueventd.nox.rc"
        )
    )


    fun isEmulator(): Boolean {
        return (((Build.FINGERPRINT.startsWith("generic")
                || Build.FINGERPRINT.startsWith("unknown")
                || Build.MODEL.contains("google_sdk")
                || Build.MODEL.contains("Emulator")
                || Build.MODEL.contains("Android SDK built for x86")
                || Build.MANUFACTURER.contains("Genymotion")
                || Build.MODEL.startsWith("sdk_")
                || Build.DEVICE.startsWith("emulator")
                || (Build.BRAND.startsWith("generic") && Build.DEVICE.startsWith(
            "generic"
        ))) || "google_sdk" == Build.PRODUCT || "QC_Reference_Phone" === Build.BOARD && !"xiaomi".equals(
            Build.MANUFACTURER,
            ignoreCase = true
        ) || Build.MANUFACTURER.contains("Genymotion")
                || Build.HOST.startsWith("Build")) || Build.BRAND.startsWith("generic") && Build.DEVICE.startsWith(
            "generic"
        ) || Build.PRODUCT === "google_sdk" || SystemProperties.get("ro.kernel.qemu") === "1" || Build.HARDWARE.contains(
            "goldfish"
        )
                || Build.HARDWARE.contains("ranchu")
                || Build.PRODUCT.contains("vbox86p")
                || Build.PRODUCT.lowercase().contains("nox")
                || Build.BOARD.lowercase().contains("nox")
                || Build.HARDWARE.lowercase().contains("nox")
                || Build.MODEL.lowercase()
            .contains("droid4x")) || Build.HARDWARE === "vbox86" || checkEmulatorFiles()
    }


    private fun checkFiles(targets: List<String>): Boolean {
        for (pipe in targets) {
            val file = File(pipe)
            if (file.exists()) return true
        }
        return false
    }

    private fun checkEmulatorFiles(): Boolean {
        return (checkFiles(GENY_FILES)
                || checkFiles(ANDY_FILES)
                || checkFiles(NOX_FILES)
                || checkFiles(X86_FILES)
                || checkFiles(PIPES))
    }
}