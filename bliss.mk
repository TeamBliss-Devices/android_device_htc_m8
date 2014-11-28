$(call inherit-product, device/htc/m8/full_m8.mk)

# Enhanced NFC
$(call inherit-product, vendor/bliss/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/bliss/config/common_full_phone.mk)

PRODUCT_NAME := bliss_m8
