# Copyright (C) 2007 The Android Open Source Project
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

# BoardConfigCommon.mk
#
# Product-specific compile-time definitions.
#

# Set this up here so that BoardConfigVendor.mk can override it
BOARD_USES_GENERIC_AUDIO     := true
USE_CAMERA_STUB              := true
BOARD_USES_LIBSECRIL_STUB    := true

# Use the non-open-source parts, if they're present
-include vendor/samsung/venturi/BoardConfigVendor.mk

# Platform
TARGET_ARCH                  := arm
TARGET_ARCH_VARIANT          := armv7-a-neon
TARGET_ARCH_VARIANT_CPU      := cortex-a8
TARGET_CPU_ABI               := armeabi-v7a
TARGET_CPU_ABI2              := armeabi
ARCH_ARM_HAVE_TLS_REGISTER   := true
TARGET_GLOBAL_CFLAGS         += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS       += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp

TARGET_NO_BOOTLOADER         := true
TARGET_NO_RADIOIMAGE         := true

TARGET_SOC                   := s5pc110
TARGET_BOOTLOADER_BOARD_NAME := s5pc110
TARGET_BOARD_PLATFORM        := s5pc110
TARGET_BOARD_PLATFORM_GPU    := POWERVR_SGX540_120

# Releasetools
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/samsung/venturi/releasetools/venturi_ota_from_target_files

# Kernel
TARGET_KERNEL_SOURCE         := kernel/samsung/venturi
BOARD_CUSTOM_BOOTIMG_MK      := device/samsung/venturi/shbootimg.mk

# Recovery
TARGET_RECOVERY_PRE_COMMAND  := "echo 1 > /cache/.startrecovery; sync;"
BOARD_CUSTOM_GRAPHICS        := ../../../device/samsung/venturi/recovery/graphics.c
BOARD_HAS_NO_SELECT_BUTTON   := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 7864320
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 304087040
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2017460224
BOARD_FLASH_BLOCK_SIZE       := 131072
TARGET_USERIMAGES_USE_EXT4   := true

# Boot Animation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOTANIMATION_USE_RGB565 := true

# Vold
BOARD_VOLD_MAX_PARTITIONS    := 17
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun%d/file

# Connectivity - Wi-Fi
WPA_SUPPLICANT_VERSION       := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER  := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER         := NL80211
BOARD_HOSTAPD_PRIVATE_LIB    := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE            := bcmdhd
BOARD_WLAN_DEVICE_REV        := bcm4329
WIFI_DRIVER_MODULE_NAME      := "bcmdhd"
WIFI_DRIVER_FW_PATH_PARAM    := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA      := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP       := "/vendor/firmware/fw_bcmdhd_apsta.bin"

# Bluetooth
BOARD_HAVE_BLUETOOTH         := true
BOARD_HAVE_BLUETOOTH_BCM     := true
BOARD_BLUEDROID_VENDOR_CONF  := device/samsung/venturi/prebuilt/libbt_vndcfg.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/venturi/bluetooth

# Camera
ifeq ($(USE_CAMERA_STUB),false)
BOARD_CAMERA_LIBRARIES       := libcamera
BOARD_CAMERA_HAVE_ISO        := true
endif

# Video Devices
BOARD_USES_OVERLAY           := true
BOARD_V4L2_DEVICE            := /dev/video1
BOARD_CAMERA_DEVICE          := /dev/video0
BOARD_SECOND_CAMERA_DEVICE   := /dev/video2

# Hardware rendering
USE_OPENGL_RENDERER          := true
BOARD_EGL_CFG                := device/samsung/venturi/prebuilt/lib/egl/egl.cfg
BOARD_ALLOW_EGL_HIBERNATION  := true

# TARGET_DISABLE_TRIPLE_BUFFERING can be used to disable triple buffering
# on per target basis. On crespo it is possible to do so in theory
# to save memory, however, there are currently some limitations in the
# OpenGL ES driver that in conjunction with disable triple-buffering
# would hurt performance significantly (see b/6016711)
TARGET_DISABLE_TRIPLE_BUFFERING := false

# Touchscreen
BOARD_USE_LEGACY_TOUCHSCREEN := true

# FM Radio
BOARD_HAVE_FM_RADIO          := true
BOARD_FM_DEVICE              := si4709

WITH_SEC_OMX                 := true

# hwcomposer: custom vsync ioctl
#BOARD_CUSTOM_VSYNC_IOCTL := true
