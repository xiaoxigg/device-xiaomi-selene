

LOCAL_PATH := device/xiaomi/selene

# Inherit from the common tree
$(call inherit-product, device/xiaomi/selene/device.mk)

# Inherit from the omni configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Device identifier
PRODUCT_DEVICE := selene
PRODUCT_NAME := omni_selene
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi note 11 4g
PRODUCT_MANUFACTURER := Xiaomi

# TWRP specific flags (if needed)
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_USE_FSCRYPT_POLICY := 1
