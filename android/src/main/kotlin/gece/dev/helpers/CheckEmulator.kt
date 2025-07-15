package gece.dev.helpers

import android.os.Build
import java.io.File

class CheckEmulator {

    companion object {
        private val GENY_FILES = listOf(
            "/dev/socket/genyd", 
            "/dev/socket/baseband_genyd"
        )

        private val PIPES = listOf(
            "/dev/socket/qemud", 
            "/dev/qemu_pipe"
        )

        private val X86_FILES = listOf(
            "ueventd.android_x86.rc",
            "x86.prop",
            "ueventd.ttVM_x86.rc",
            "init.ttVM_x86.rc",
            "fstab.ttVM_x86",
            "fstab.vbox86",
            "init.vbox86.rc",
            "ueventd.vbox86.rc"
        )

        private val ANDY_FILES = listOf(
            "fstab.andy", 
            "ueventd.andy.rc"
        )

        private val NOX_FILES = listOf(
            "fstab.nox", 
            "init.nox.rc", 
            "ueventd.nox.rc"
        )
    }

    fun isEmulator(): Boolean {
        return checkEmulatorBuildProps() || 
               SystemProperties.get("ro.kernel.qemu") == "1" || 
               checkEmulatorFiles()
    }

    private fun checkEmulatorBuildProps(): Boolean {
        return listOf(
            Build.FINGERPRINT.startsWith("generic"),
            Build.FINGERPRINT.startsWith("unknown"),
            Build.MODEL.contains("google_sdk"),
            Build.MODEL.contains("Emulator"),
            Build.MODEL.contains("Android SDK built for x86"),
            Build.MANUFACTURER.contains("Genymotion"),
            Build.MODEL.startsWith("sdk_"),
            Build.DEVICE.startsWith("emulator"),
            Build.BRAND.startsWith("generic") && Build.DEVICE.startsWith("generic"),
            "google_sdk" == Build.PRODUCT,
            "QC_Reference_Phone" == Build.BOARD && !Build.MANUFACTURER.equals("xiaomi", ignoreCase = true),
            Build.HOST.startsWith("Build"),
            Build.PRODUCT == "google_sdk",
            Build.HARDWARE.contains("goldfish"),
            Build.HARDWARE.contains("ranchu"),
            Build.PRODUCT.contains("vbox86p"),
            Build.PRODUCT.lowercase().contains("nox"),
            Build.BOARD.lowercase().contains("nox"),
            Build.HARDWARE.lowercase().contains("nox"),
            Build.MODEL.lowercase().contains("droid4x"),
            Build.HARDWARE == "vbox86"
        ).any { it }
    }

    private fun checkEmulatorFiles(): Boolean {
        return checkFiles(GENY_FILES) || 
               checkFiles(ANDY_FILES) || 
               checkFiles(NOX_FILES) || 
               checkFiles(X86_FILES) || 
               checkFiles(PIPES)
    }

    private fun checkFiles(targets: List<String>): Boolean {
        return targets.any { File(it).exists() }
    }
}