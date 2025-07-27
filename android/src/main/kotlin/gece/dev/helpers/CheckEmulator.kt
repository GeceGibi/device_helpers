package gece.dev.helpers

import android.os.Build
import java.io.File

/**
 * CheckEmulator - Android emulator detection utility
 * 
 * Provides comprehensive emulator detection using multiple methods:
 * - Build properties analysis
 * - File system checks for emulator-specific files
 * - Hardware fingerprint analysis
 * - Support for various emulator types (Genymotion, Android Studio, etc.)
 */
class CheckEmulator {

    companion object {
        /** Genymotion emulator specific files */
        private val GENY_FILES = listOf(
            "/dev/socket/genyd", 
            "/dev/socket/baseband_genyd"
        )

        /** QEMU emulator pipe files */
        private val PIPES = listOf(
            "/dev/socket/qemud", 
            "/dev/qemu_pipe"
        )

        /** x86 emulator specific files */
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

        /** Andy emulator specific files */
        private val ANDY_FILES = listOf(
            "fstab.andy", 
            "ueventd.andy.rc"
        )

        /** Nox emulator specific files */
        private val NOX_FILES = listOf(
            "fstab.nox", 
            "init.nox.rc", 
            "ueventd.nox.rc"
        )
    }

    /**
     * Main emulator detection method
     * Combines multiple detection strategies for comprehensive emulator detection
     * 
     * @return true if device is detected as an emulator, false otherwise
     */
    fun isEmulator(): Boolean {
        return checkEmulatorBuildProps() || 
               SystemProperties.get("ro.kernel.qemu") == "1" || 
               checkEmulatorFiles()
    }

    /**
     * Checks build properties for emulator indicators
     * Analyzes various build properties that indicate emulator environment
     * 
     * @return true if build properties indicate emulator, false otherwise
     */
    private fun checkEmulatorBuildProps(): Boolean {
        return listOf(
            // Generic SDK indicators
            Build.FINGERPRINT.startsWith("generic"),
            Build.FINGERPRINT.startsWith("unknown"),
            Build.MODEL.contains("google_sdk"),
            Build.MODEL.contains("Emulator"),
            Build.MODEL.contains("Android SDK built for x86"),
            
            // Genymotion specific indicators
            Build.MANUFACTURER.contains("Genymotion"),
            Build.MODEL.startsWith("sdk_"),
            Build.DEVICE.startsWith("emulator"),
            
            // Generic device indicators
            Build.BRAND.startsWith("generic") && Build.DEVICE.startsWith("generic"),
            "google_sdk" == Build.PRODUCT,
            
            // Reference phone indicators (but exclude Xiaomi)
            "QC_Reference_Phone" == Build.BOARD && !Build.MANUFACTURER.equals("xiaomi", ignoreCase = true),
            
            // Build host indicators
            Build.HOST.startsWith("Build"),
            Build.PRODUCT == "google_sdk",
            
            // Hardware indicators
            Build.HARDWARE.contains("goldfish"),
            Build.HARDWARE.contains("ranchu"),
            Build.PRODUCT.contains("vbox86p"),
            
            // Nox emulator indicators
            Build.PRODUCT.lowercase().contains("nox"),
            Build.BOARD.lowercase().contains("nox"),
            Build.HARDWARE.lowercase().contains("nox"),
            
            // Droid4x emulator indicators
            Build.MODEL.lowercase().contains("droid4x"),
            Build.HARDWARE == "vbox86"
        ).any { it }
    }

    /**
     * Checks for emulator-specific files in the file system
     * Looks for files that are typically present in emulator environments
     * 
     * @return true if emulator files are found, false otherwise
     */
    private fun checkEmulatorFiles(): Boolean {
        return checkFiles(GENY_FILES) || 
               checkFiles(ANDY_FILES) || 
               checkFiles(NOX_FILES) || 
               checkFiles(X86_FILES) || 
               checkFiles(PIPES)
    }

    /**
     * Checks if any of the target files exist in the file system
     * 
     * @param targets List of file paths to check
     * @return true if any target file exists, false otherwise
     */
    private fun checkFiles(targets: List<String>): Boolean {
        return targets.any { File(it).exists() }
    }
}