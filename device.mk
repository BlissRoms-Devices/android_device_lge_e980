#
# Copyright (C) 2011 The Android Open-Source Project
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

# This file includes all definitions that apply to ALL geefhd devices, and
# are also specific to geefhd devices
#
# Everything in this directory will become public

$(call inherit-product, device/lge/gproj-common/gproj.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_PACKAGES += \
	lights.geefhd \
	camera.geefhd

PRODUCT_PACKAGES += \
	hostapd_default.conf \
	wpa_supplicant_overlay.conf \
	p2p_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/mixer_paths.xml:system/etc/mixer_paths.xml

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/thermald-geefhd.conf:system/etc/thermald.conf

# Add bluetooth configuration from stock
PRODUCT_COPY_FILES += \
	device/lge/e980/bluetooth_extras/etc/audio.conf:system/etc/bluetooth/audio.conf \
	device/lge/e980/bluetooth_extras/etc/auto_pair_devlist.conf:system/etc/bluetooth/auto_pair_devlist.conf \
	device/lge/e980/bluetooth_extras/etc/auto_pairing.conf:system/etc/bluetooth/auto_pairing.conf \
	device/lge/e980/bluetooth_extras/etc/avrcp_toggle_white_list.conf:system/etc/bluetooth/avrcp_toggle_white_list.conf \
	device/lge/e980/bluetooth_extras/etc/blacklist.conf:system/etc/bluetooth/blacklist.conf \
	device/lge/e980/bluetooth_extras/etc/block_avrcp_toggle_new.conf:system/etc/bluetooth/block_avrcp_toggle_new.conf \
	device/lge/e980/bluetooth_extras/etc/bt.a2dp.tuning.sh:system/etc/bluetooth/bt.a2dp.tuning.sh \
	device/lge/e980/bluetooth_extras/etc/bt_did.conf:system/etc/bluetooth/bt_did.conf \
	device/lge/e980/bluetooth_extras/etc/bt_stack.conf:system/etc/bluetooth/bt_stack.conf \
	device/lge/e980/bluetooth_extras/etc/bt_tts_list.conf:system/etc/bluetooth/bt_tts_list.conf \
	device/lge/e980/bluetooth_extras/etc/carkit_cod_headsets.conf:system/etc/bluetooth/carkit_cod_headsets.conf \
	device/lge/e980/bluetooth_extras/etc/device_config.xml:system/etc/bluetooth/device_config.xml \
	device/lge/e980/bluetooth_extras/etc/input.conf:system/etc/bluetooth/input.conf \
	device/lge/e980/bluetooth_extras/etc/iop_bt.db:system/etc/bluetooth/iop_bt.db \
	device/lge/e980/bluetooth_extras/etc/main.conf:system/etc/bluetooth/main.conf \
	device/lge/e980/bluetooth_extras/etc/network.conf:system/etc/bluetooth/network.conf \

# Add bluetooth framework file...
PRODUCT_COPY_FILES += \
	device/lge/e980/bluetooth_extras/framework/com.broadcom.bt.jar:system/framework/com.broadcom.bt.jar \

# Add bluetooth libs and binaries. Those should be in vendor/lge/e980, but that one needs some updating...
PRODUCT_COPY_FILES += \
	device/lge/e980/bluetooth_extras/lib/libbluedroid_bdt.so:system/lib/libbluedroid_bdt.so \
	device/lge/e980/bluetooth_extras/lib/libbluetooth_jni.so:system/lib/libbluetooth_jni.so \
	device/lge/e980/bluetooth_extras/lib/libbluetoothsettings_jni.so:system/lib/libbluetoothsettings_jni.so \
	device/lge/e980/bluetooth_extras/xbin/hciconfig:system/xbin/hciconfig \
	device/lge/e980/bluetooth_extras/xbin/hcidump:system/xbin/hcidump \
	device/lge/e980/bluetooth_extras/xbin/hcitool:system/xbin/hcitool \
	   
# Bluetooth additional config...
PRODUCT_PROPERTY_OVERRIDES += \
	bluetooth.chip.vendor=brcm \
	ro.product.bluetooth=4.0 \
	ro.bt.chipset=Broadcom BCM4334 \
	ro.bt.version=4.0 \
	ro.bt.stack=BTL-A \
	ro.bt.stack.version=5.0 \
	ro.bt.profiles=12806403 \
	service.brcm.bt.activation=0 \
	service.brcm.bt.srv_active=0 \
	service.brcm.bt.hcid_active=0 \
	service.brcm.bt.btld=0 \
	service.brcm.bt.btld_pid=0 \
	service.brcm.bt.avrcp_pass_thru=0 \
	service.brcm.bt.avrcp_toggle=1 \
	service.brcm.bt.btport_redir_on=1 \

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/initlogo.rle:root/initlogo.rle888 \
	$(LOCAL_PATH)/init.geefhd.rc:root/init.geefhd.rc \
	$(LOCAL_PATH)/fstab.geefhd:root/fstab.geefhd \
	$(LOCAL_PATH)/ueventd.geefhd.rc:root/ueventd.geefhd.rc

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/keypad_8064.kl:system/usr/keylayout/gk-keypad-8064.kl

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/bcmdhd.cal:system/etc/wifi/bcmdhd.cal

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=480

PRODUCT_PACKAGES += \
	hwaddrs

PRODUCT_PROPERTY_OVERRIDES += \
	ro.bt.bdaddr_path=/data/misc/bdaddr

# This hw ships locked, work around it with loki
PRODUCT_PACKAGES += \
	loki.sh \
	loki_tool_static_gproj \
	recovery-transform.sh

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

PRODUCT_PROPERTY_OVERRIDES += \
	ro.telephony.default_network=9 \
	telephony.lteOnGsmDevice=1

PRODUCT_PROPERTY_OVERRIDES += \
	pm.sleep.mode=1 \
	persist.sys.language=en-US \
	persist.sys.country=US
	
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)
