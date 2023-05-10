# Copyright 2014 The Android Open Source Project
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

# Common path
COMMON_PATH := device/sony/common

# Do not build proprietary capability
TARGET_USES_AOSP := true
TARGET_BOARD_AUTO := true

# Let other components rely on kernel build tree headers
TARGET_COMPILE_WITH_MSM_KERNEL := true

TARGET_NO_RADIOIMAGE := true
TARGET_NO_BOOTLOADER := true
TARGET_NO_RECOVERY := false
TARGET_NO_KERNEL := false

# Avoid using vold for mounting purposes
#TARGET_KERNEL_HAVE_EXFAT := false
#TARGET_KERNEL_HAVE_NTFS := false

# common cmdline parameters
BOARD_KERNEL_CMDLINE += msm_rtb.filter=0x3F ehci-hcd.park=3
BOARD_KERNEL_CMDLINE += coherent_pool=8M
BOARD_KERNEL_CMDLINE += sched_enable_power_aware=1 user_debug=31
BOARD_KERNEL_CMDLINE += apparmor=1 security=apparmor

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_ROOT_EXTRA_FOLDERS := bt_firmware dsp firmware persist odm

# Override filesystem config
TARGET_ANDROID_FILESYSTEM_CONFIG_H := $(COMMON_PATH)/android_filesystem_config.h

# GFX
USE_OPENGL_RENDERER := true
BOARD_USES_ADRENO := true
TARGET_USES_ION := true
TARGET_USES_C2D_COMPOSITION := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true

# Rotation
MINIMEDIA_SENSORSERVER_DISABLE := 1

# Enable media.audio_policy
MINIMEDIA_AUDIOPOLICYSERVICE_ENABLE := 1

# libmedia_compat_layer for 64bit
HYBRIS_MEDIA_32_BIT_ONLY := false

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_HWDEP_CAL := true
AUDIO_FEATURE_ENABLED_LOW_LATENCY_CAPTURE := true
AUDIO_FEATURE_ENABLED_NEW_SAMPLE_RATE := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := false
AUDIO_FEATURE_ENABLED_HFP := true
USE_CUSTOM_AUDIO_POLICY := 0
USE_XML_AUDIO_POLICY_CONF := 0

# Target legacy Camera HAL
# USE_DEVICE_SPECIFIC_CAMERA := true
# USE_CAMERA_STUB := false
# TARGET_HAS_LEGACY_CAMERA_HAL1 := true
# BOARD_USES_CYANOGEN_HARDWARE := false

# Camera
BOARD_QTI_CAMERA_32BIT_ONLY := true
BOARD_QTI_CAMERA_V2 := true
CAMERA_DAEMON_NOT_PRESENT := true
TARGET_USES_MEDIA_EXTENSIONS := true

# GPS definitions for Qualcomm solution
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true
TARGET_NO_RPC := true

# Charger
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_HAL_STATIC_LIBRARIES += libhealthd.$(TARGET_DEVICE)

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := false

# Set seccomp policy for media server
# BOARD_SECCOMP_POLICY += $(COMMON_PATH)/seccomp

# Avoid using Sony's init
BOARD_USES_INIT_SONY := true

# Init configuration for init_sony
include $(COMMON_PATH)/init/config.mk

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif
DONT_DEXPREOPT_PREBUILTS := true

BUILD_KERNEL := true
