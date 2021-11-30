@echo off
adb wait-for-device root
adb wait-for-device remount
adb wait-for-device shell mount -o rw,remount /vendor/dsp

adb shell setprop persist.vendor.qcom.bluetooth.aptxadaptiver2_2_support true
echo Aptx Adaptive R2_2 support is:
adb shell getprop persist.vendor.qcom.bluetooth.aptxadaptiver2_2_support


adb wait-for-device push C:\audio_files\1.2kHz\10min /sdcard/Music/
adb wait-for-device push C:\audio_files\1.2kHz\30min /sdcard/Music/


adb install C:/tools/googlesynth.apk
adb install C:/tools/nRF_Connect_v4.24.3.apk

adb shell settings put global development_settings_enabled 1
adb shell settings put secure bluetooth_hci_log 1

adb wait-for-device shell svc bluetooth disable
adb wait-for-device shell svc bluetooth enable

adb shell settings put system screen_off_timeout 600000

adb shell settings put system lockscreen_sounds_enabled 0
adb shell settings put system dtmf_tone 0
adb shell settings put system haptic_feedback_enabled 0
adb shell settings put system sound_effects_enabled 0

adb shell sync


echo Setup done, press any key to restart the phone
pause > null
adb reboot