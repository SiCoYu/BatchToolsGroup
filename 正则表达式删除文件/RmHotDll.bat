setlocal
set CurPath=%~dp0
set CurBinaries=%CurPath%Binaries
set PluginsPath=%CurPath%Plugins

echo off & color 0A

rem taskkill /F /IM UE4Editor.exe
rem taskkill /F /IM UnrealEditor.exe
rem taskkill /F /IM CrashReportClientEditor.exe

set "regexp=patch_[0-9].[a-z][a-z][a-z]"

for /R %PluginsPath% %%f in (*.lib, *.pdb, *.exe, *.exp) do ( 
	set "line=%%f"
	setlocal enabledelayedexpansion	
	echo "%%f"|findstr /r /C:"%regexp%" >nul 2>&1
	if ERRORLEVEL 1 (
		rem echo "%%f"
	) else (
		del /q "%%f"
		echo %%f
	)
	endlocal
)

for /R %CurBinaries% %%f in (*.lib, *.pdb, *.exe, *.exp) do ( 
	set "line=%%f"
	setlocal enabledelayedexpansion	
	echo "%%f"|findstr /r /C:"%regexp%" >nul 2>&1
	if ERRORLEVEL 1 (
		rem echo "%%f"
	) else (
		del /q "%%f"
		echo %%f
	)
	endlocal
)
pause