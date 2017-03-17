# Copyright (C) 2015 Matthew D. Mower
# Copyright (C) 2015 The CyanogenMod Project
# Copyright (C) 2013 The Android Open Source Project
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

USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/htc/m7univ/BoardConfigVendor.mk

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := m7
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := krait
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

# Kernel
BOARD_KERNEL_BASE := 0x80600000
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom user_debug=31 androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01800000

# Don't use kernel_htc_msm8960 because of OTG problem
###TARGET_KERNEL_SOURCE := kernel/htc/msm8960
###TARGET_KERNEL_CONFIG := m7_defconfig
# switch back to:
#TARGET_KERNEL_SOURCE := kernel/htc/m7
#TARGET_KERNEL_CONFIG := m7_twrp_defconfig
### to fix the USB-OTG not being initilazied properly.
### PS: m7_twrp_defconfig has
###     * F2FS enabled
###     * changed CONFIG_FRAME_WARN=2048 instead of 1024 (due to build warning/error)
###     * compression changed to LZMA
TARGET_PREBUILT_KERNEL := device/htc/m7univ/prebuilt_kernel/kernel


# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# Flags
COMMON_GLOBAL_CFLAGS += -DHTCLOG
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# Graphics
USE_OPENGL_RENDERER := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
BOARD_EGL_CFG := device/htc/m7univ/configs/egl.cfg
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Power
TARGET_POWERHAL_VARIANT := qcom

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776704
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1946156032
BOARD_USERDATAIMAGE_PARTITION_SIZE := 27917287424
BOARD_FLASH_BLOCK_SIZE := 131072

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true

# Vold
BOARD_VOLD_MAX_PARTITIONS := 38

# Charge mode
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/htc_lpm/lpm_mode

# Vendor Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_LIBINIT_DEFINES_FILE := device/htc/m7univ/init/init_m7univ.c

# TWRP
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_INCLUDE_CRYPTO := true
BOARD_RECOVERY_BLDRMSG_OFFSET := 2048
TARGET_RECOVERY_DEVICE_MODULES := chargeled 
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_NO_USB_STORAGE := true
TW_EXTERNAL_STORAGE_PATH := "/usb-otg"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "usb-otg"

TW_EXCLUDE_SUPERSU := true

##==================================
##  RECOVERY_VARIANT := multirom
TARGET_RECOVERY_IS_MULTIROM := true

#MR_DEVICE_SPECIFIC_VERSION := h ... let the build script deal with this!

include device/common/version-info/MR_REC_VERSION.mk

ifeq ($(MR_REC_VERSION),)
MR_REC_VERSION := $(shell date -u +%Y%m%d)-01
endif

BOARD_MKBOOTIMG_ARGS += --board mrom$(MR_REC_VERSION)

#still needed by multirom boot menu
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
RECOVERY_GRAPHICS_USE_LINELENGTH := true
DEVICE_RESOLUTION := 1080x1920

#Force populating /dev/block/platform/msm_sdcc.1/by-name
#from the emmc, needed by devices like the HTC One M7
MR_POPULATE_BY_NAME_PATH := "/dev/block/platform/msm_sdcc.1/by-name"

#needed by devices using /dev/block/bootdevice/...
MR_DEV_BLOCK_BOOTDEVICE := false

#MultiROM config. MultiROM also uses parts of TWRP config
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := device/htc/m7univ/multirom/mr_init_devices.c
MR_DPI := xhdpi
MR_DPI_FONT := 340
MR_FSTAB := device/htc/m7univ/multirom/mrom_m7.fstab
MR_USE_MROM_FSTAB := true
MR_DEVICE_VARIANTS := m7 m7u m7ul m7gsm m7wlv m7wls
MR_DEVICE_HOOKS := device/htc/m7univ/multirom/mr_hooks.c
MR_DEVICE_HOOKS_VER := 4
MR_KEXEC_MEM_MIN := 0x85000000
###MR_ENCRYPTION := true
###MR_ENCRYPTION_SETUP_SCRIPT := device/htc/m7univ/multirom/mr_cp_crypto.sh
MR_NO_KEXEC := enabled
