# Copyright (C) 2010 The Android Open Source Project
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

# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.
DEVICE_PACKAGE_OVERLAYS := device/samsung/venturi/overlay

PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_CHARACTERISTICS := tablet

# Boot animation
TARGET_BOOTANIMATION_NAME := vertical-480x800

# Initramfs files
PRODUCT_COPY_FILES += \
	device/samsung/venturi/fstab.venturi:root/fstab.venturi \
	device/samsung/venturi/init.venturi.rc:root/init.venturi.rc \
	device/samsung/venturi/init.venturi.gps.rc:root/init.venturi.gps.rc \
	device/samsung/venturi/init.venturi.usb.rc:root/init.venturi.usb.rc \
	device/samsung/venturi/lpm.rc:root/lpm.rc \
	device/samsung/venturi/ueventd.venturi.rc:root/ueventd.venturi.rc \
	device/samsung/venturi/init.venturi.usb.rc:recovery/root/usb.rc \
	device/samsung/venturi/init.recovery.venturi.rc:root/init.recovery.venturi.rc

# Prebuilt configuration files
PRODUCT_COPY_FILES += \
	device/samsung/venturi/prebuilt/etc/gps.conf:system/etc/gps.conf \
	device/samsung/venturi/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf \
	device/samsung/venturi/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml \
	device/samsung/venturi/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
	device/samsung/venturi/prebuilt/etc/vold.fstab:system/etc/vold.fstab \
	device/samsung/venturi/prebuilt/etc/wifi/wifi.conf:system/etc/wifi/wifi.conf \
	device/samsung/venturi/prebuilt/lib/egl/egl.cfg:system/lib/egl/egl.cfg

PRODUCT_PACKAGES += \
	audio.primary.s5pc110 \
	audio_policy.s5pc110 \
	audio.a2dp.default \
	audio.usb.default \
	camera.s5pc110 \
	power.s5pc110 \
#	hwcomposer.s5pc110

# Prebuilt kl keymaps
PRODUCT_COPY_FILES += \
	device/samsung/venturi/prebuilt/usr/keylayout/s3c-keypad.kl:system/usr/keylayout/s3c-keypad.kl \
	device/samsung/venturi/prebuilt/usr/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
	device/samsung/venturi/prebuilt/usr/keylayout/cytma340_input.kl:system/usr/keylayout/cytma340_input.kl \
	device/samsung/venturi/prebuilt/usr/idc/cytma340_input.idc:system/usr/idc/cytma340_input.idc

# Generated kcm keymaps
PRODUCT_PACKAGES += \
       cypress-touchkey.kcm \
       s3c-keypad.kcm

# OpenMAX IL configuration files
PRODUCT_COPY_FILES += \
	hardware/samsung/exynos3/s5pc110/sec_mm/sec_omx/sec_omx_core/secomxregistry:system/etc/secomxregistry

# OpenMAX IL modules
PRODUCT_PACKAGES += \
	libSEC_OMX_Core \
	libOMX.SEC.AVC.Decoder \
	libOMX.SEC.M4V.Decoder \
	libOMX.SEC.M4V.Encoder \
	libOMX.SEC.AVC.Encoder

# Libs
PRODUCT_PACKAGES += \
	libs3cjpeg \
	libstagefrighthw \
	Torch

# Bluetooth MAC Address
PRODUCT_PACKAGES += \
	bdaddr_read

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072 \
	hwui.render_dirty_regions=false

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=30

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.locationfeatures=1 \
	ro.com.google.networklocation=1

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
	ro.kernel.android.checkjni=0 \
	dalvik.vm.checkjni=false

# We have sacrificed /cache for a larger /system, so it's not large enough for dalvik cache
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.dexopt-data-only=1 \
	dalvik.vm.heapsize=128m

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Set default USB interface and default to external SD card
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mass_storage \
	ro.vold.switchablepair=/storage/sdcard0,/storage/sdcard1 \
	persist.sys.vold.switchexternal=1

# Other properties
PRODUCT_PROPERTY_OVERRIDES += \
	ro.bt.bdaddr_path=/data/bdaddr \
	ro.sf.lcd_density=240

# Include additional hardware makefiles
# Broadcom Wi-Fi
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/Android.mk)
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)

# Samsung
$(call inherit-product-if-exists, hardware/samsung/Android.mk)

# Inherit proprietary vendor files
$(call inherit-product-if-exists, vendor/samsung/venturi/venturi-vendor.mk)

# Set this here temporarily so ADB works
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0

