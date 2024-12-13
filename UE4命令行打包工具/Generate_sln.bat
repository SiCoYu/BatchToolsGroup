echo %~dp0
SETLOCAL ENABLEDELAYEDEXPANSION
set CurPath=%~dp0
set FindFiles=%CurPath%*.uproject
for %%i in (%FindFiles%) do ( set ProjectPath=%%i )
echo %ProjectPath%
"F:\UE5\UE_5.3_T3\Engine\Binaries\DotNET\UnrealBuildTool\UnrealBuildTool.exe" -projectfiles -project=%ProjectPath% -game -rocket -progress
pause