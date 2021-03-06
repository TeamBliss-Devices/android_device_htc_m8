# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# Model Ids
# 0P6B10000 - International
# 0P6B12000 - AT&T/Dev Edition
# 0P6B13000 - T-Mobile
# 0P6B16000 - Telus/Rogers (Canada)
# 0P6B20000 - Verizon
# 0P6B70000 - Sprint

TARGET_OTA_ASSERT_DEVICE := htc_m8,htc_m8whl,htc_m8wl,m8,m8wl,m8wlv,m8vzw,m8whl,m8spr
TARGET_BOARD_INFO_FILE ?= device/htc/m8/board-info.txt

BOARD_VENDOR := htc

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8974
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := msm8974
TARGET_BOARD_PLATFORM_GPU := qcom-adreno330

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := krait
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

# Kernel
BOARD_KERNEL_CMDLINE := console=none androidboot.hardware=qcom user_debug=31 ehci-hcd.park=3 zcache androidboot.selinux=permissive

BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x02008000 --tags_offset 0x01e00000
BOARD_CUSTOM_BOOTIMG_MK := device/htc/m8/mkbootimg.mk
TARGET_KERNEL_CONFIG := cm_m8_defconfig
TARGET_KERNEL_SOURCE := kernel/htc/msm8974

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
TARGET_USES_QCOM_BSP := true

# Audio
AUDIO_FEATURE_DISABLED_MULTI_VOICE_SESSIONS := true
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
AUDIO_FEATURE_ENABLED_FM := true
# AUDIO_FEATURE_ENABLED_HWDEP_CAL := true
AUDIO_FEATURE_ENABLED_LOW_LATENCY_CAPTURE := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/m8/bluetooth

# Camera
COMMON_GLOBAL_CFLAGS += -DHTC_CAMERA_HARDWARE
COMMON_GLOBAL_CFLAGS += -DPROPERTY_PERMS_APPEND='{"htc.camera.sensor.", AID_CAMERA, 0}, {"camera.4k2k.", AID_MEDIA, 0},'
USE_DEVICE_SPECIFIC_CAMERA := true

# Charge mode
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/htc_lpm/lpm_mode

# Font
EXTENDED_FONT_FOOTPRINT := true

# Graphics
TARGET_USES_ION := true
TARGET_USES_OVERLAY := true
USE_OPENGL_RENDERER := true
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000

# Includes
TARGET_SPECIFIC_HEADER_PATH := device/htc/m8/include

# Libc extensions
BOARD_PROVIDES_ADDITIONAL_BIONIC_STATIC_LIBS += libc_htc_symbols

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# NFC
BOARD_NFC_HAL_SUFFIX := msm8974

# Power
TARGET_POWERHAL_VARIANT := qcom

# RIL
BOARD_PROVIDES_LIBRIL := true
BOARD_RIL_CLASS := ../../../device/htc/m8/ril

# RPC
TARGET_NO_RPC := true

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
TARGET_USES_WCNSS_CTRL := true
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP := "ap"

# Webkit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERY_BLDRMSG_OFFSET := 2048
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 25165824
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13153337344
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_RECOVERY_DEVICE_MODULES += chargeled
TARGET_USERIMAGES_USE_EXT4 := true

ifeq ($(HOST_OS),linux)
TARGET_USERIMAGES_USE_F2FS := true
else
TARGET_USERIMAGES_USE_F2FS := false
endif

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
BOARD_USES_MMCUTILS := true
TARGET_RECOVERY_FSTAB := device/htc/m8/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# SELinux
include device/qcom/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += device/htc/m8/sepolicy

BOARD_SEPOLICY_UNION += \
    cir_fw_update.te \
    device.te \
    file_contexts \
    file.te \
    hcheck.te \
    init.te \
    kernel.te \
    mediaserver.te \
    mm-qcamerad.te \
    mpdecision.te \
    platform_app.te \
    property_contexts \
    recovery.te \
    rmt_storage.te \
    system_app.te \
    system_server.te \
    tap2wake_dev.te \
    thermal-engine.te \
    ueventd.te \
    vibe_dev.te \
    vold.te \
    wpa.te

# Vendor Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_m8
TARGET_LIBINIT_DEFINES_FILE := device/htc/m8/init/init_m8.c

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/htc/m8/releasetools

# Hardware
BOARD_HARDWARE_CLASS := device/htc/m8/cmhw

#WITH_DEXPREOPT := true
#WITH_DEXPREOPT_PIC :=true
#WITH_DEXPREOPT_COMP :=true

# Enable Minikin text layout engine (will be the default soon)
# USE_MINIKIN := true

# Block_Build
# Bliss_Build_Block := 1 

# BlissPop Config Flags
BLISS_WIPE_CACHES := 1
BLISSIFY := true
BLISS_O3 := false
BLISS_STRICT := false
BLISS_GRAPHITE := false
BLISS_KRAIT := true
BLISS_PIPE := true
# FLOOP_NEST_OPTIMIZE := true
# ENABLE_GCCONLY := true
# TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
# FAST_MATH := true
# ENABLE_MODULAR_O3 := true
# ENABLE_LTO := true
# Link_Time_Optimizations := true
# TARGET_USE_ION_COMPAT := true
# TARGET_USE_KRAIT_PLD_SET := true
TARGET_TC_ROM :=4.9-linaro
TARGET_TC_KERNEL := 4.8
TARGET_GCC_VERSION_EXP := $(TARGET_TC_ROM)
TARGET_KERNEL_CUSTOM_TOOLCHAIN := $(TARGET_TC_KERNEL)
TARGET_ENABLE_UKM := true
BLISS_BUILDTYPE := OFFICIAL
BLISS_DEVELOPER := fizbanrapper
# LZMA and notes - comment out the line if you can't figure it out...
# need - https://github.com/peterjc/backports.lzma
# specifically, read - https://github.com/peterjc/backports.lzma/blob/master/README.md
# - Also make sure you have python-dev installed.
WITH_LZMA_OTA := true


#SaberMod
-include vendor/bliss/config/sm.mk

