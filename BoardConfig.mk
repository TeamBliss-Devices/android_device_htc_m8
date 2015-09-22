#
# Copyright (C) 2015 The CyanogenMod Project
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

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# Inherit from common m8-common
-include device/htc/m8-common/BoardConfigCommon.mk

# Model Ids
# 0P6B10000 - International
# 0P6B12000 - AT&T/Dev Edition
# 0P6B13000 - T-Mobile
# 0P6B16000 - Telus/Rogers (Canada)
# 0P6B20000 - Verizon
# 0P6B70000 - Sprint

# Assert
TARGET_OTA_ASSERT_DEVICE := htc_m8,htc_m8whl,htc_m8wl,m8,m8wl,m8wlv,m8vzw,m8whl,m8spr

# Kernel

BOARD_CUSTOM_BOOTIMG_MK := device/htc/m8/mkbootimg.mk
TARGET_KERNEL_CONFIG := cm_m8_defconfig

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/m8/bluetooth

# RIL
BOARD_RIL_CLASS := ../../../device/htc/m8/ril

# Partitions
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13153337344

# Vendor Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_m8
TARGET_LIBINIT_DEFINES_FILE := device/htc/m8/init/init_m8.c

#WITH_DEXPREOPT := true
#WITH_DEXPREOPT_PIC :=true
#WITH_DEXPREOPT_COMP :=true

# Enable Minikin text layout engine (will be the default soon)
# USE_MINIKIN := true

# Block_Build
BLISS_BUILD_BLOCK := 1 

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
TARGET_TC_KERNEL := 4.8
TARGET_TC_ROM := 5.2-linaro
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

# Inherit from the proprietary version
-include vendor/htc/m8/BoardConfigVendor.mk

