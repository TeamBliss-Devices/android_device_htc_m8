$(call inherit-product, device/htc/m8/full_m8.mk)

# Enhanced NFC
$(call inherit-product, vendor/beanstalk/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/beanstalk/config/common_full_phone.mk)

PRODUCT_DEVICE := m8
PRODUCT_NAME := beanstalk_m8
PRODUCT_BRAND := htc
PRODUCT_MODEL := One M8
PRODUCT_MANUFACTURER := htc
