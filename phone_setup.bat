@echo off
adb wait-for-device root
adb wait-for-device remount
adb wait-for-device shell mount -o rw,remount /vendor/dsp

adb shell setprop persist.vendor.qcom.bluetooth.aptxadaptiver2_2_support true
cd C:\audio_files\1.2kHz

@echo on
adb shell getprop persist.vendor.qcom.bluetooth.aptxadaptiver2_2_support


adb wait-for-device push 10min /sdcard/Music/
adb wait-for-device push 30min /sdcard/Music/
adb shell sync

@echo off
echo Press any key to restart the phone
pause > null
adb reboot
pause > null