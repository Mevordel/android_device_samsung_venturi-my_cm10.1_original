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

# BoardConfig.mk
#
# Product-specific compile-time definitions.
#

# Set this up here so that BoardConfigVendor.mk can override it
BOARD_USES_GENERIC_AUDIO     := false
USE_CAMERA_STUB              := true
BOARD_USES_LIBSECRIL_STUB    := true

# Use the non-open-source parts, if they're present
-include vendor/samsung/venturi/BoardConfigVendor.mk

# Platform
TARGET_CPU_ABI               := armeabi-v7a
TARGET_CPU_ABI2              := armeabi
TARGET_ARCH                  := arm
TARGET_ARCH_VARIANT          := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER   := true
TARGET_GLOBAL_CFLAGS         += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS       += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp

TARGET_NO_BOOTLOADER         := true
TARGET_NO_RADIOIMAGE         := true

TARGET_SOC                   := s5pc110
TARGET_BOARD_PLATFORM        := s5pc110
TARGET_BOARD_PLATFORM_GPU    := POWERVR_SGX540_120
TARGET_BOOTLOADER_BOARD_NAME := s5pc110

# Releasetools
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/samsung/venturi/releasetools/venturi_ota_from_target_files

# Kernel
TARGET_KERNEL_SOURCE         := kernel/samsung/venturi
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.4.3
BOARD_CUSTOM_BOOTIMG_MK      := device/samsung/venturi/shbootimg.mk

# Recovery
TARGET_RECOVERY_PRE_COMMAND  := "echo 1 > /cache/.startrecovery; sync;"
TARGET_RECOVERY_INITRC       := device/samsung/venturi/recovery.rc
BOARD_CUSTOM_GRAPHICS        := ../../../device/samsung/venturi/graphics.c
BOARD_HAS_NO_SELECT_BUTTON   := true
TARGET_OTA_ASSERT_DEVICE     := venturi,YP-G70,venturi_usa

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 7864320
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 304087040
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2017460224
BOARD_FLASH_BLOCK_SIZE       := 131072
TARGET_USERIMAGES_USE_EXT4   := true

# Vold
BOARD_VOLD_MAX_PARTITIONS    := 17
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_EMMC_PRIMARY_PARTITIONS := 1

# USB
BOARD_UMS_LUNFILE := "/sys/devices/platform/usb_mass_storage/lun0/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun%d/file

# Connectivity - Wi-Fi
WPA_SUPPLICANT_VERSION       := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER  := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
BOARD_WLAN_DEVICE            := bcm4329
BOARD_WLAN_DEVICE_REV        := bcm4329
WIFI_DRIVER_MODULE_NAME      := "dhd"
WIFI_DRIVER_MODULE_PATH      := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_MODULE_ARG       := "firmware_path=/vendor/firmware/fw_bcm4329.bin nvram_path=/vendor/firmware/nvram_net.txt iface_name=wlan0"
WIFI_DRIVER_FW_PATH_STA      := "/vendor/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_AP       := "/vendor/firmware/fw_bcm4329_apsta.bin"

# Bluetooth
BOARD_HAVE_BLUETOOTH         := true
BOARD_HAVE_BLUETOOTH_BCM     := true

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

# SkTextBox for libtvout
BOARD_USES_SKTEXTBOX         := true

# Hardware rendering
USE_OPENGL_RENDERER          := true
BOARD_ALLOW_EGL_HIBERNATION  := true
BOARD_EGL_CFG                := device/samsung/venturi/egl.cfg

# Touchscreen
BOARD_USE_LEGACY_TOUCHSCREEN := true

# FM Radio
BOARD_HAVE_FM_RADIO          := true
BOARD_FM_DEVICE              := si4709

WITH_SEC_OMX                 := true
