echo %cd%
@echo off
set DefaultAppName=ProjectX
set DefaultPackageName=com.PWRD.SCP
set DefaultInSightPath=F:\WorkTools\UE_Px\PxD_4.26\Engine\Binaries\Win64
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

set TxtPath=%cd%\UE4CommandLine.txt

start /d %InSightPath% UnrealInsights.exe

adb.exe reverse tcp:1980 tcp:1980

rem adb push %TxtPath% /mnt/sdcard/UE4Game/%AppName%/UE4CommandLine.txt

adb shell setprop debug.ue4.commandline -tracehost=127.0.01

adb shell am start -n %PackName%/com.epicgames.ue4.SplashActivity -tracehost=127.0.0.1 -trace=frame,cpu,gpu,memory

pause