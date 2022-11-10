LOCAL_PATH := $(call my-dir)


#--------------------------------------------------------
# libopenxr_loader.so
#
# OpenXR Loader
#--------------------------------------------------------
include $(CLEAR_VARS)

LOCAL_MODULE := openxr_loader

LOCAL_SRC_FILES := ../../../Libs/Android/$(TARGET_ARCH_ABI)/lib$(LOCAL_MODULE).so

# only export public headers
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../../../Include

# NOTE: This check is added to prevent the following error when running a "make clean" where
# the prebuilt lib may have been deleted: "LOCAL_SRC_FILES points to a missing file"
ifneq (,$(wildcard $(LOCAL_PATH)/$(LOCAL_SRC_FILES)))
  include $(PREBUILT_SHARED_LIBRARY)
endif

include $(CLEAR_VARS)
LOCAL_MODULE := Oboe
LOCAL_SRC_FILES := ../../../Sample/HelloXR/build/Oboe/prefab/modules/oboe/libs/android.$(TARGET_ARCH_ABI)/liboboe.so
include $(PREBUILT_SHARED_LIBRARY)

APP_STL := c++_shared