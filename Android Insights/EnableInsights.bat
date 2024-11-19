echo %cd%
@echo off
set DefaultAppName=M2_Client
set DefaultPackageName=com.h3d.m2
set DefaultInSightPath="D:\WP_YXK\UE\UE_5.4\Engine\Binaries\Win64"

set AppName=%DefaultAppName%
set PackName=%DefaultPackageName%
set InSightPath=%DefaultInSightPath%

set /p InputAppName=App Name: 
set /p InputPackName=Package Name: 
set /p InputInSightPath=Insight Path: 

set AppName=%InputAppName%
set PackName=%InputPackName%
set InSightPath=%InputInSightPath%
echo %AppName%
echo %PackName%

if "%AppName%" == "" (
	set AppName=%DefaultAppName%
)else (
	echo %AppName%
)

if "%PackName%" == "" (
	set PackName=%DefaultPackageName%
)else (
	echo %PackName%
)

if "%InSightPath%" == "" (
	set InSightPath=%DefaultInSightPath%
)else (
	echo %InSightPath%
)

echo %AppName%
echo %PackName%
echo %InSightPath%

set TxtPath=%cd%\UECommandLine.txt

rem start /d %InSightPath% UnrealInsights.exe

adb.exe reverse tcp:1980 tcp:1980

adb push UECommandLine.txt storage/emulated/0/Android/data/%PackName%/files/UnrealGame/%AppName%/

rem adb shell setprop debug.unreal.commandline -tracehost=127.0.01

rem adb shell am start -n %PackName%/com.epicgames.ue4.SplashActivity -tracehost=127.0.0.1 -trace=frame,cpu,gpu,memory
adb shell am start -n %PackName%/com.epicgames.unreal.SplashActivity -tracehost=192.168.112.49 -trace=default,memory

pause