set UnrealPakPath="F:/WorkTools/UE_Px/PxD_4.26/Engine/Binaries/Win64"
cd /d %UnrealPakPath%
set PakPath=%1%
@echo off
REM @echo off
REM setlocal enabledelayedexpansion
REM set S=%PakPath%
REM set I=0
REM set L=-1
REM :l
REM if "!S:~%I%,1!"=="" goto ld
REM if "!S:~%I%,1!"=="\" set L=%I%
REM set /a I+=1
REM goto l
REM :ld
REM echo ================
REM echo %L%
REM set UnPakToPath=%PakPath:~0,L%

set UnPakToPath=C:/UE4_UnPak
if not exist %UnPakToPath% mkdir "C:/UE4_UnPak"
echo %PakPath%
echo %UnPakToPath%
UnrealPak %PakPath% -Extract %UnPakToPath%
start "" %UnPakToPath%
pause