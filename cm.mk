# Release name
PRODUCT_RELEASE_NAME := GalaxyGrandNeo

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/baffinlite/device_baffinlite.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := baffinlite
PRODUCT_NAME := cm_baffinlite
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := GT-I9060

# Set build fingerprint / ID / Prduct Name ect.
# PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=baffinvj TARGET_DEVICE=baffin BUILD_FINGERPRINT=samsung/baffinvj/baffin:4.1.2/JZO54K/baffinliteLDCAMC2:user/release-keys PRIVATE_BUILD_DESC="baffinvj-user 4.1.2 JZO54K baffinliteLDCAMC2 release-keys"
