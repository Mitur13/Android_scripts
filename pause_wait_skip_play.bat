@echo off

adb shell input keyevent KEYCODE_MEDIA_PLAY
timeout /t 30

for /l %%x in (1, 1, 25) do (
	echo 		#####  %%x  #####
	adb shell input keyevent KEYCODE_MEDIA_PAUSE
	timeout /t 5

	adb shell input keyevent KEYCODE_MEDIA_NEXT
	timeout /t 30
)
echo finished
adb shell input keyevent KEYCODE_MEDIA_PAUSE
pause > null