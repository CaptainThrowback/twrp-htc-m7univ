# Copyright (C) 2011 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for maguro hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, full and maguro, hence its name.
#

# Inherit m7-specific vendor tree
$(call inherit-product-if-exists, vendor/htc/m7univ/m7univ-vendor.mk)

# Inherit from m7
$(call inherit-product, device/htc/m7univ/device.mk)

PRODUCT_NAME := full_m7univ
PRODUCT_DEVICE := m7univ
PRODUCT_BRAND := htc
PRODUCT_MANUFACTURER := htc
