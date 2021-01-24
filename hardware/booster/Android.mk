# Copyright (C) 2021 Alfred Neumayer
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

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := expatparser.cpp booster.cpp
LOCAL_SHARED_LIBRARIES := liblog libcutils
LOCAL_STATIC_LIBRARIES := libexpat_static
LOCAL_MODULE := libpowerswitch
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := powerswitch.cpp
LOCAL_SHARED_LIBRARIES := liblog libpowerswitch
LOCAL_MODULE := powerswitch
LOCAL_MODULE_TAGS := optional
LOCAL_INIT_RC := powerswitch.rc

include $(BUILD_EXECUTABLE)
