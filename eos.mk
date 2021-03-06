$(call inherit-product, vendor/eos/config/common_full_phone.mk)

$(call inherit-product, vendor/eos/config/nfc_enhanced.mk)

$(call inherit-product, device/htc/m7/full_m7.mk)

# Copy Bootanimation
PRODUCT_COPY_FILES += \
vendor/eos/prebuilt/common/bootanimation/1080.zip:system/media/bootanimation.zip

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=LRX22C.H3 BUILD_FINGERPRINT="htc/m7_google/m7:5.0.1/LRX22C.H3/434277:user/release-keys" PRIVATE_BUILD_DESC="5.11.1700.3 CL434277 release-keys"

PRODUCT_NAME := eos_m7
PRODUCT_DEVICE := m7
