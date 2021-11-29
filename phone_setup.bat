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

adb shell sync

echo Press any key to restart the phone
pause > null
adb reboot