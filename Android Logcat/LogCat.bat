set ADBPath="C:/Users/Administrator/AppData/Local/Android/Sdk/platform-tools"
cd %ADBPath%
set LogName=%date:~0,4%-%date:~5,2%-%date:~8,2%-%time:~0,2%_%time:~3,2%_%time:~6,2%.log
echo %LogName%
set RootPath=C:/UE4_Log/
set RootPathFolder=C:/UE4_Log
if not exist %RootPath% mkdir "C:/UE4_Log"
rem %SystemRoot%\explorer.exe %RootPath%
start "" "C:/UE4_Log/"
set LogOut=%RootPath%%LogName%
adb logcat -v time > %LogOut%
rem | findstr com.YXK.PG 