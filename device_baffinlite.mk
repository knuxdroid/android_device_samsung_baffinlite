$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product-if-exists, vendor/samsung/baffinlite/baffinlite-vendor.mk)

# FIXME: This allows only hdpi resources to be included, saving space.
#        However, some bug caused holo apps' menu, checkboxes and
#        other widgets to be transparent.
# PRODUCT_AAPT_CONFIG := normal hdpi
# PRODUCT_AAPT_PREF_CONFIG := hdpi

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

# Prebuilt kl keymaps
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayouts/AVRCP.kl:system/usr/keylayout/VRCP.kl \
    $(LOCAL_PATH)/keylayouts/bcm_headset.kl:system/usr/keylayout/bcm_headset.kl \
    $(LOCAL_PATH)/keylayouts/bcm_keypad_v2.kl:system/usr/keylayout/bcm_keypad_v2.kl \
    $(LOCAL_PATH)/keylayouts/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayouts/samsung-keypad.kl:system/usr/keylayout/samsung-keypad.kl \
    $(LOCAL_PATH)/keylayouts/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs

# libstlport, required by multiple vendor binaries
PRODUCT_PACKAGES += \
    libstlport

# GPS/RIL
PRODUCT_PACKAGES += \
    libglgps-compat

# Usb accessory
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Audio modules
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudiopolicymanager

USE_CUSTOM_AUDIO_POLICY := 1

# Other modules
PRODUCT_PACKAGES += \
    lights.java \
    power.java \
    libshim_wvm \
    libstagefrighthw

# Device-specific packages
PRODUCT_PACKAGES += \
    SamsungServiceMode \
    Torch

# IPv6 tethering
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# KSM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ksm.default=1

# Ramdisk
PRODUCT_COPY_FILES += \
    device/samsung/baffinlite/ramdisk/fstab.java_ss_baffinlite:root/fstab.java_ss_baffinlite \
    device/samsung/baffinlite/ramdisk/init.bcm23550.usb.rc:root/init.bcm23550.usb.rc \
    device/samsung/baffinlite/ramdisk/init.java_ss_baffinlite.rc:root/init.java_ss_baffinlite.rc \
    device/samsung/baffinlite/ramdisk/init.java_ss_baffinlite.rc:root/init.lineage_baffinlite.rc \
    device/samsung/baffinlite/ramdisk/init.log.rc:root/init.log.rc \
    device/samsung/baffinlite/ramdisk/ueventd.java_ss_baffinlite.rc:root/ueventd.java_ss_baffinlite.rc \
    device/samsung/baffinlite/ramdisk/ueventd.java_ss_baffinlite.rc:root/ueventd.lineage_baffinlite.rc

# Snap Camera
PRODUCT_PACKAGES += \
    Snap

# Gello Browser
PRODUCT_PACKAGES += \
    Gello

# Recorder
PRODUCT_PACKAGES += \
    Recorder

# System Properties
-include $(LOCAL_PATH)/system_prop.mk

# Wi-Fi
PRODUCT_PACKAGES += \
    dhcpcd.conf \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Support for Browser's saved page feature. This allows
# for pages saved on previous versions of the OS to be
# viewed on the current OS.
PRODUCT_PACKAGES += \
    libskia_legacy

# Dalvik heap config
include frameworks/native/build/phone-hdpi-512-dalvik-heap.mk

# Texture config
include frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

$(call inherit-product, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_baffinlite
PRODUCT_DEVICE := baffinlite

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true
