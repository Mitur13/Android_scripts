@echo off 
for /l %%x in (1, 1, 90000) do (
   adb shell svc wifi disable
   echo WLAN Disabled
   timeout /t 10
   adb shell svc wifi enable
   echo 		WLAN Enabled
   timeout /t 20
)
adb shell svc wifi disable