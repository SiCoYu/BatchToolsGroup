echo %~dp0
set CurPath=%~dp0
set ProjectPath=%CurPath%YXK_UE5Tools.uproject
"C:\Program Files\Epic Games\UE_5.2\Engine\Binaries\DotNET\UnrealBuildTool\UnrealBuildTool.exe" -projectfiles -project=%ProjectPath% -game -rocket -progress
pause