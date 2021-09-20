@echo off
adb root
adb remount

echo Paste CAPI folder directory:
set /p CapiPath=
cd %CapiPath%

adb shell mount -o rw,remount /vendor/dsp

@echo on
adb push aptx_adaptive_enc_module.so.1 /vendor/dsp/adsp
adb push libaptXAdaptiveEnc.so /vendor/dsp/adsp
adb push libaptXAdaptiveEnc3.so /vendor/dsp/adsp
adb push aptx_adaptive_speech_dec_module.so.1 /vendor/dsp/adsp
adb push aptx_adaptive_speech_enc_module.so.1 /vendor/dsp/adsp
adb push aptx_classic_enc_module.so.1 /vendor/dsp/adsp
adb push aptx_hd_enc_module.so.1 /vendor/dsp/adsp

@echo off

echo Press any key to restart the phone...
pause > nul
adb reboot