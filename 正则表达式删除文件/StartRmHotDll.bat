@echo off
setlocal
set CurPath=%~dp0

cmd /k python %CurPath%RmHotDll.py

pause