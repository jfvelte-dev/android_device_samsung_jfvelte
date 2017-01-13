
# Copyright (C) 2009 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
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

# Inherit from qcom-common
-include device/samsung/qcom-common/BoardConfigCommon.mk

COMMON_PATH := device/samsung/jfvelte

# Assert
TARGET_OTA_ASSERT_DEVICE := jfvelte,jfveltexx,i9515,I9515,GT-I9515,GT-i9515,gt-i9515,I9515L,i9515L,i9515l,I9515l,gt-i9515l,GT-I9515L,jfltexx,i9505,GT-I9505,jgedlte,i9505g,GT-I9505G,jflte

# Platform
TARGET_BOARD_PLATFORM := msm8960
USE_CLANG_PLATFORM_BUILD := true

# Architecture
TARGET_CPU_VARIANT := krait

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8960

# Kernel
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=31 zcache msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x80200000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_CONFIG := lineageos_jfve_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/jf
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androideabi-

# Audio
BOARD_HAVE_SAMSUNG_CSDCLIENT := true
BOARD_USES_ALSA_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 1
AUDIO_FEATURE_ENABLED_HWDEP_CAL := true

# Enable dex-preopt
#ifeq ($(HOST_OS),linux)
#  ifeq ($(WITH_DEXPREOPT),)
WITH_DEXPREOPT := true
#  endif
#endif

# ANT
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Boot animation
TARGET_BOOTANIMATION_HALF_RES := true

# Bluetooth
BOARD_HAVE_BLUETOOTH      := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT     := true
# QCOM_BT_USE_SMD_TTY       := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(COMMON_PATH)/bluetooth

# Camera
TARGET_PROVIDES_CAMERA_HAL := true
USE_DEVICE_SPECIFIC_CAMERA := true
COMMON_GLOBAL_CFLAGS += -DCAMERA_VENDOR_L_COMPAT

# Charger
BOARD_CHARGING_CMDLINE_NAME := "androidboot.bootchg"
BOARD_CHARGING_CMDLINE_VALUE := "true"
BOARD_CHARGER_ENABLE_SUSPEND := true

# CMHW
BOARD_HARDWARE_CLASS += $(COMMON_PATH)/cmhw

# Display
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_DISPLAY_USE_RETIRE_FENCE := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# GPS
TARGET_NO_RPC := true
USE_DEVICE_SPECIFIC_GPS := true

# Includes
TARGET_SPECIFIC_HEADER_PATH += $(COMMON_PATH)/include

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# NFC
BOARD_NFC_HAL_SUFFIX := msm8960

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2894069760
BOARD_CACHEIMAGE_PARTITION_SIZE := 2170552320
BOARD_USERDATAIMAGE_PARTITION_SIZE := 28651274240
BOARD_FLASH_BLOCK_SIZE := 131072

# Power
TARGET_POWERHAL_VARIANT := qcom

# Properties (reset them here, include more in device if needed)
TARGET_SYSTEM_PROP := $(COMMON_PATH)/system.prop

# Qualcomm support
BOARD_USES_QC_TIME_SERVICES := true

# Recovery
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/rootdir/etc/fstab.qcom
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Vendor Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_jfvelte
TARGET_RECOVERY_DEVICE_MODULES := libinit_jfvelte

# RIL
BOARD_RIL_CLASS := ../../../$(COMMON_PATH)/ril
USE_DEVICE_SPECIFIC_DATASERVICES := true

# SELinux
include device/qcom/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy

# Wifi module
BOARD_HAS_QCOM_WLAN              := true
TARGET_USES_WCNSS_CTRL           := true
TARGET_PROVIDES_WCNSS_QMI        := true
TARGET_USES_QCOM_WCNSS_QMI       := true
BOARD_WLAN_DEVICE                := qcwcn
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WPA_SUPPLICANT_VERSION           := VER_0_8_X
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"

# inherit from the proprietary version
-include vendor/samsung/jf-gsm-common/BoardConfigVendor.mk
