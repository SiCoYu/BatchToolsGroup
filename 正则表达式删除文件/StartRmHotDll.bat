@echo off
setlocal
set CurPath=%~dp0

taskkill /F /IM UE4Editor.exe
taskkill /F /IM UnrealEditor.exe
taskkill /F /IM CrashReportClientEditor.exe
taskkill /F /IM LiveCodingConsole.exe

cmd /k python %CurPath%RmHotDll.py

pause