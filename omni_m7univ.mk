## Specify phone tech before including full_phone
$(call inherit-product, vendor/omni/config/cdma.mk)

# Inherit device configuration
$(call inherit-product, device/htc/m7univ/full_m7univ.mk)
# Release name
PRODUCT_RELEASE_NAME := m7univ

# Inherit some common DU stuff.
$(call inherit-product, vendor/omni/config/common.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := m7univ
PRODUCT_NAME := omni_m7univ
PRODUCT_BRAND := htc
PRODUCT_MANUFACTURER := htc
