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
# Product-specific compile-time definitions.

# Use the parts that are common between all venturis
include device/samsung/venturi/BoardConfigCommon.mk

# Use the European-specific defconfig
TARGET_KERNEL_CONFIG := cyanogenmod_venturi_defconfig

# Correct OTA asserts for this device (+ backward-compatibility)
TARGET_OTA_ASSERT_DEVICE := YP-G70,venturi_usa,venturi
