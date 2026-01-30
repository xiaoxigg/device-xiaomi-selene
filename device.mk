# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/xiaomi/selene

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service

PRODUCT_PACKAGES += \
    bootctrl.mt6768 \
    libgptutils \
    libz \
    libcutils

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

# === 新增：动态分区挂载支持（关键！）===
PRODUCT_PACKAGES += \
    linker.vendor_ramdisk \
    init.recovery.hardware.rc \
    init.recovery.${TARGET_BOOTLOADER_BOARD_NAME}.rc

# 创建必要的设备映射器目录
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.recovery.dynamic_partitions.rc:root/init.recovery.dynamic_partitions.rc

# === 新增：触控固件支持 ===
# 确保固件文件被包含（已在selene-vendor.mk中定义，这里可省略）
# PRODUCT_COPY_FILES += \
#     vendor/xiaomi/selene/proprietary/vendor/firmware/novatek_ts_fw.bin:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/firmware/novatek_ts_fw.bin

# Include vendor blobs
$(call inherit-product, vendor/xiaomi/selene/selene-vendor.mk)

# TWRP Configuration for Android 13
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_USE_FSCRYPT_POLICY := 1

# === 新增：VAB/动态分区特定配置 ===
TW_HAS_DOWNLOAD_MODE := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_NO_SCREEN_BLANK := true

# 恢复出厂设置时保留super分区
TW_EXCLUDE_APEX := true