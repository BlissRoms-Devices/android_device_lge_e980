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
	
# Live Wallpapers
PRODUCT_PACKAGES += \
	LiveWallpapers \
	LiveWallpapersPicker \
	VisualizationWallpapers \
	librs_jni

PRODUCT_PACKAGES += \
	hostapd_default.conf \
	wpa_supplicant_overlay.conf \
	p2p_supplicant_overlay.conf

PRODUCT_PACKAGES += \
	libwpa_client \
	hostapd \
	dhcpcd.conf \
	wpa_supplicant \
	wpa_supplicant.conf
	
PRODUCT_COPY_FILES += \
	device/lge/e980/mixer_paths.xml:system/etc/mixer_paths.xml
	
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
	device/lge/e980/bluetooth_extras/etc/network.conf:system/etc/bluetooth/network.conf

# Add bluetooth framework file...
PRODUCT_COPY_FILES += \
	device/lge/e980/bluetooth_extras/framework/com.broadcom.bt.jar:system/framework/com.broadcom.bt.jar

# Add bluetooth libs and binaries. Those should be in vendor/lge/e980, but that one needs some updating...
PRODUCT_COPY_FILES += \
	device/lge/e980/bluetooth_extras/lib/libbluedroid_bdt.so:system/lib/libbluedroid_bdt.so \
	device/lge/e980/bluetooth_extras/lib/libbluetooth_jni.so:system/lib/libbluetooth_jni.so \
	device/lge/e980/bluetooth_extras/lib/libbluetoothsettings_jni.so:system/lib/libbluetoothsettings_jni.so \
	device/lge/e980/bluetooth_extras/xbin/hciconfig:system/xbin/hciconfig \
	device/lge/e980/bluetooth_extras/xbin/hcidump:system/xbin/hcidump \
	device/lge/e980/bluetooth_extras/xbin/hcitool:system/xbin/hcitool
	   
# Additional Bluetooth Configs
PRODUCT_PROPERTY_OVERRIDES += \
	bluetooth.chip.vendor=brcm \
	ro.bluetooth.request.master=true \
	ro.bluetooth.remote.autoconnect=true \
	ro.bluetooth.PANenable = 1 \
	bluetooth.a2dp.sink.enabled=false \
	ro.product.bluetooth=4.0 \
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
	service.brcm.bt.btport_redir_on=1

PRODUCT_COPY_FILES += \
	device/lge/e980/initlogo.rle:root/initlogo.rle888 \
	device/lge/e980/init.geefhd.rc:root/init.geefhd.rc \
	device/lge/e980/fstab.geefhd:root/fstab.geefhd \
	device/lge/e980/ueventd.geefhd.rc:root/ueventd.geefhd.rc

PRODUCT_COPY_FILES += \
	device/lge/e980/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

PRODUCT_COPY_FILES += \
	device/lge/e980/keypad_8064.kl:system/usr/keylayout/gk-keypad-8064.kl

PRODUCT_COPY_FILES += \
	device/lge/e980/bcmdhd.cal:system/etc/wifi/bcmdhd.cal
	
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

PRODUCT_PACKAGES += \
	hwaddrs

PRODUCT_PROPERTY_OVERRIDES += \
	ro.bt.bdaddr_path=/data/misc/bdaddr

# This hw ships locked, work around it with loki
PRODUCT_PACKAGES += \
	loki.sh \
	loki_tool_static_gproj \
	recovery-transform.sh

PRODUCT_PROPERTY_OVERRIDES += \
	pm.sleep.mode=1 \
	persist.sys.language=en-US \
	persist.sys.country=US \
	camera2.portability.force_api=1 \
	ro.sf.lcd_density=400
	
# Audio Configuration
# FIXME: Remove persist.audio.handset.mic and persist.audio.fluence.mode
#        while switching new audio HAL from legacy HAL
PRODUCT_PROPERTY_OVERRIDES += \
	persist.audio.handset.mic.type=digital \
	persist.audio.dualmic.config=endfire \
	persist.audio.fluence.voicecall=true \
	persist.audio.handset.mic=dmic \
	persist.audio.fluence.mode=endfire \
	persist.audio.lowlatency.rec=false

# Enable AAC 5.1 output
PRODUCT_PROPERTY_OVERRIDES += \
    media.aac_51_output_enabled=true

# Do not power down SIM card when modem is sent to Low Power Mode.
PRODUCT_PROPERTY_OVERRIDES += \
	persist.radio.apm_sim_not_pwdn=1

# RIL
	PRODUCT_PROPERTY_OVERRIDES += \
	ro.telephony.default_network=9 \
	telephony.lteOnGsmDevice=1 \
	ro.telephony.ril_class=LgeLteRIL \
	ro.telephony.ril.config=qcomdsds \
	rild.libpath=/system/lib/libril-qc-qmi-1.so \
	ro.telephony.call_ring.multiple=0
	
# Wifi Configs
PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=15 \
	ro.wifi.channels=11 11

# Up to 3 layers can go through overlays
PRODUCT_PROPERTY_OVERRIDES += \
	persist.hwc.mdpcomp.enable=true

# More overrides from stock build.prop
PRODUCT_PROPERTY_OVERRIDES += \
	debug.sf.hw=1 \
	debug.egl.hw=1 \
	debug.composition.type=gpu \
	video.accelerate.hw=1 \
	wlan.chip.vendor=brcm \
	wlan.chip.version=bcm4334 \
	af.resampler.quality=255
	
# Better internet browsing & download speed
PRODUCT_PROPERTY_OVERRIDES += \
	net.tcp.buffersize.default=4096,87380,256960,4096,16384,256960 \
	net.tcp.buffersize.wifi=4096,87380,256960,4096,16384,256960 \
	net.tcp.buffersize.umts=4096,87380,256960,4096,16384,256960 \
	net.tcp.buffersize.gprs=4096,87380,256960,4096,16384,256960 \
	net.tcp.buffersize.edge=4096,87380,256960,4096,16384,256960 \
	net.tcp.buffersize.hspa=6144,87380,524288,6144,16384,262144 \
	net.tcp.buffersize.lte=524288,1048576,2097152,524288,1048576,2097152 \
	net.tcp.buffersize.hsdpa=6144,87380,1048576,6144,87380,1048576 \
	net.tcp.buffersize.evdo_b=6144,87380,1048576,6144,87380,1048576
	
# Random overrides
PRODUCT_PROPERTY_OVERRIDES += \
	debug.performance.tuning=1
	
PRODUCT_PROPERTY_OVERRIDES += \
	debug.egl.recordable.rgba8888=1

PRODUCT_PROPERTY_OVERRIDES += \
	ro.qc.sensors.wl_dis=true \
	ro.qualcomm.sensors.smd=true

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp
	
PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=196608
	
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)
