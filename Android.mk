#
# Copyright (C) 2012 The Android Open-Source Project
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

# WARNING: Everything listed here will be built on ALL platforms,
# including x86, the emulator, and the SDK.  Modules must be uniquely
# named (liblights.tuna), and must build everywhere, or limit themselves
# to only building on ARM if they include assembly. Individual makefiles
# are responsible for having their own logic, for fine-grained control.

LOCAL_PATH := $(call my-dir)

ifneq ($(filter jactivelte jflteatt jfltespr jfltetmo jfltevzw jfltexx jfltecan jflteusc jfltecri jfltecsp jfltezm jftddxx,$(TARGET_DEVICE)),)

include $(call all-subdir-makefiles,$(LOCAL_PATH))

include $(CLEAR_VARS)

# Create /firmware-mdm links
FIRMWARE_MDM_IMAGES := \
    acdb.mbn \
    apps.mbn \
    dsp1.mbn dsp2.mbn dsp3.mbn \
    efs1.mbn efs2.mbn efs3.mbn \
    mdm_acdb.img \
    rpm.mbn \
    sbl1.mbn \
    sbl2.mbn

FIRMWARE_MDM_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(FIRMWARE_MDM_IMAGES)))
$(FIRMWARE_MDM_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware-mdm/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(FIRMWARE_MDM_SYMLINKS)


# Create /firmware links
FIRMWARE_IMAGES := \
    q6.b00 q6.b01 q6.b03 q6.b04 q6.b05 q6.b06 q6.mdt \
    tzapps.b00 tzapps.b01 tzapps.b02 tzapps.b03 tzapps.mdt \
    vidc.b00 vidc.b01 vidc.b02 vidc.b03 vidc.mdt \
    keymaste.b00 keymaste.b01 keymaste.b02 keymaste.b03 keymaste.mdt \
    mobicore.b00 mobicore.b01 mobicore.b02 mobicore.b03 mobicore.mdt \
    mc_v2.b00 mc_v2.b01 mc_v2.b02 mc_v2.b03 mc_v2.mdt \
    skmm_ta.b00 skmm_ta.b01 skmm_ta.b02 skmm_ta.b03 skmm_ta.mdt \
    tima_atn.b00 tima_atn.b01 tima_atn.b02 tima_atn.b03 tima_atn.mdt \
    tima_key.b00 tima_key.b01 tima_key.b02 tima_key.b03 tima_key.mdt \
    tima_lkm.b00 tima_lkm.b01 tima_lkm.b02 tima_lkm.b03 tima_lkm.mdt \
    tima_pkm.b00 tima_pkm.b01 tima_pkm.b02 tima_pkm.b03 tima_pkm.mdt \
    wcnss.b00 wcnss.b01 wcnss.b02 wcnss.b04 wcnss.b05 wcnss.b06 wcnss.mdt

FIRMWARE_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(FIRMWARE_IMAGES)))
$(FIRMWARE_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(FIRMWARE_SYMLINKS)

endif
