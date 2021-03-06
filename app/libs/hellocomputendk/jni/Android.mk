# Copyright (C) 2016 The Android Open Source Project
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
# This is the shared library included by the JNI test app.
#
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := hellocomputendk
LOCAL_SRC_FILES := HelloComputeNDK_Jni.cpp tfClass.cpp mono.rs
LOCAL_C_INCLUDES := tfClass.h
LOCAL_CLANG := true

LOCAL_CFLAGS := -std=c++11
LOCAL_LDFLAGS := -Wl,-Bsymbolic

LOCAL_LDLIBS := \
	-ldl \
	-llog \
	-ljnigraphics

LOCAL_RENDERSCRIPT_COMPATIBILITY := true

LOCAL_SHARED_LIBRARIES := RSSupport blasV8 RSSupportIO
LOCAL_STATIC_LIBRARIES := RScpp_static

include $(BUILD_SHARED_LIBRARY)

$(call import-module,android/renderscript)
