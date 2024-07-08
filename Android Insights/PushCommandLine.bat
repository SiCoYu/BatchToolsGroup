echo %cd%
@echo off
set DefaultAppName=M2_Client
set DefaultPackageName=com.h3d.m2
set DefaultInSightPath="F:\UE5\UE_Src\UE_5.3_T3\Engine\Binaries\Win64"

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

adb.exe reverse tcp:1980 tcp:1980

adb push UECommandLine.txt storage/emulated/0/Android/data/%PackName%/files/UnrealGame/%AppName%/