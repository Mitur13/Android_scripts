@echo off
adb shell input keyevent KEYCODE_MEDIA_PLAY
echo Playing Media
timeout /t 10

for /l %%x in (1, 1, 120) do (
	echo ######  %%x  ######
	adb shell input keyevent KEYCODE_MEDIA_NEXT
	echo Playing Next Track
	timeout /t 10
)

adb shell input keyevent KEYCODE_MEDIA_PAUSE