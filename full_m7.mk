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


# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from m7 device
$(call inherit-product, device/htc/m7/device.mk)

ifneq ($(TARGET_BUILD_VARIANT),codefirex)
# Get the long list of APNs
PRODUCT_COPY_FILES := device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml
else
# Specify phone tech before including full_phone
$(call inherit-product, vendor/cfx/config/gsm.mk)

$(call inherit-product, vendor/cfx/config/common_full_phone.mk)

# Copy Bootanimation
PRODUCT_COPY_FILES += \
    vendor/cfx/prebuilt/common/bootanimation/1080.zip:system/media/bootanimation.zip
endif

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := full_m7
PRODUCT_DEVICE := m7
PRODUCT_BRAND := htc
PRODUCT_MANUFACTURER := HTC
PRODUCT_MODEL := One

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=m7 \
    BUILD_ID=JZO54K \
    BUILD_FINGERPRINT="htc/m7_google/m7:4.4.2/KOT49H.H1/288144:user/release-keys" \
    PRIVATE_BUILD_DESC="3.62.1700.1 CL288144 release-keys"
