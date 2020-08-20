# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapgrowthlimit=56m

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.zygote.disable_gl_preload=true

# GPS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# Insecure ADBD
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=3 \
    persist.sys.root_access=3 \
    ro.debuggable=1

# Make sure ro.hardware is correct
ADDITIONAL_DEFAULT_PROPERTIES += ro.hardware=java_ss_baffinlite

# JNI
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    ro.kernel.checkjni=0 \
    dalvik.vm.checkjni=false

# MTP
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=rmnet0 \
    ro.telephony.ril_class=SamsungBCMRIL \
    ro.telephony.call_ring.multiple=0 \
    ro.telephony.call_ring=0

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0

# ART
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-flags=--no-watch-dog

# KSM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ksm.default=1

PRODUCT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1 \
    ro.telephony.call_ring.multiple=0
    ro.telephony.call_ring=0
