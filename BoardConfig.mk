USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/samsung/baffinlite/BoardConfigVendor.mk

LOCAL_PATH := device/samsung/baffinlite

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := java
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := true

ARCH_ARM_HAVE_ARMV7A          := true
ARCH_ARM_HAVE_VFP             := true
ARCH_ARM_HAVE_NEON            := true
ARCH_ARM_HAVE_TLS_REGISTER    := true

TARGET_GLOBAL_CFLAGS     += -mtune=cortex-a7 -mfpu=neon -mfloat-abi=softfp -O3
TARGET_GLOBAL_CPPFLAGS   += -mtune=cortex-a7 -mfpu=neon -mfloat-abi=softfp -O3

TARGET_BOOTLOADER_BOARD_NAME := java

BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x81e00000
BOARD_KERNEL_PAGESIZE := 4096

# Force GCC 4 for Linux 3.4.5 kernel
# Kernel toolchain
KERNEL_TOOLCHAIN                            := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin
KERNEL_TOOLCHAIN_PREFIX                     := arm-eabi-

TARGET_USERIMAGES_USE_EXT4 := true

BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
# TEMP: Change size to fit recovery; it won't be flashed anyways
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 11388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610334208
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5767168000
BOARD_CACHEIMAGE_PARTITION_SIZE := 1308622848
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072

# Kernel
TARGET_KERNEL_CONFIG := cyanogenmod_baffinlite_defconfig

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SUPPRESS_EMMC_WIPE := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := $(LOCAL_PATH)/configs/libbt_vndcfg.txt

# Connectivity - Wi-Fi
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WLAN_DEVICE_REV            := bcm4330_1
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_MODULE_NAME          := "dhd"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/system/etc/wifi/bcmdhd_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_AP_ARG        := "firmware_path=/system/etc/wifi/bcmdhd_apsta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_BAND                        := 802_11_ABG

# Wi-Fi Tethering
BOARD_HAVE_SAMSUNG_WIFI := true

# Hardware rendering
USE_OPENGL_RENDERER := true
BOARD_USE_MHEAP_SCREENSHOT := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
BOARD_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS -DCAPRI_HWC -DREFBASE_JB_MR1_COMPAT_SYMBOLS -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL
BOARD_USES_HWCOMPOSER             := true

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging

# RIL
BOARD_RIL_CLASS := ../../../$(LOCAL_PATH)/ril/

BOARD_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/ramdisk/fstab.java_ss_baffinlite
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun%d/file"
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_RECOVERY_DENSITY := hdpi
LZMA_RAMDISK_TARGETS := recovery

# healthd
BOARD_HAL_STATIC_LIBRARIES := libhealthd.java

# CMHW
BOARD_HARDWARE_CLASS := hardware/samsung/cmhw/ $(LOCAL_PATH)/cmhw/

# GPS
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include
BOARD_GLOBAL_CFLAGS += -DCOMPAT_SENSORS_M

# jemalloc causes a lot of random crash on free()
MALLOC_SVELTE := true

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/samsung/baffinlite/sepolicy

# Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# Required for certain vendor libraries
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS      := true

# Audio
BOARD_USES_ALSA_AUDIO             := true

# Our kernel does not have finit_module support
KERNEL_HAS_FINIT_MODULE                     := false

# Enable dex-preoptimization to speed up the first boot sequence
# of an SDK AVD. Note that this operation only works on Linux for now
ifeq ($(HOST_OS),linux)
  ifeq ($(WITH_DEXPREOPT),)
    WITH_DEXPREOPT := true
  endif
endif
