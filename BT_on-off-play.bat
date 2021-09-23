@echo off 

adb shell svc bluetooth enable

for /l %%x in (1, 1, 3) do (
   echo #####  %%x  #####
   adb shell svc bluetooth disable
   echo 	Bluetooth OFF
   timeout /t 5
   adb shell svc bluetooth enable
   echo Bluetooth ON
   timeout /t 15
   adb shell input keyevent KEYCODE_MEDIA_PLAY
   timeout /t 30
)

echo #   #   #   finished   #   #   #
pause > null