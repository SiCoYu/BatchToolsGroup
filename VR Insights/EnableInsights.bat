echo %cd%
@echo off
set DefaultAppName=ProjectX
set DefaultPackageName=com.PWRD.SCPVR
set DefaultInSightPath=G:\WorkTools\UE_4.26\Engine\Binaries\Win64

set TxtPath=%cd%\UE4CommandLine.txt

start /d %DefaultInSightPath% UnrealInsights.exe

adb.exe reverse tcp:1980 tcp:1980

adb push %TxtPath% /mnt/sdcard/UE4Game/%DefaultAppName%/UE4CommandLine.txt

adb shell setprop debug.ue4.commandline -tracehost=127.0.0.1

adb shell am start -n %DefaultPackageName%/com.epicgames.ue4.SplashActivity rem -tracehost=127.0.0.1 -trace=frame,cpu,gpu,memory

pause