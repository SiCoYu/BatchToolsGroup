REM -exclude
REM -exclude=<XXX> (这些选项前的双横线也可以用单横线）
REM 非常有用，减少不必要的文件下载。可以排除掉自己不需要的平台和VS版本，例如： setup.bat -exclude=Linux -exclude=IOS -exclude=HTML5  -exclude=Android -exclude=VS2013
REM 平台可选的参数:Win32, Win64, osx32,osx64, Linux, Android, IOS, HTML5
REM VS版本可选参数:VS2012,VS2013,VS2015
REM 警告： 不要排除Win32 和 VS2013, 不然后期编译会遇到问题
rem -threads
REM -threads=<N>
REM 可以多线程下载，速度倍增。例如：setup.bat --threads=20
REM -cache
REM -cache=<PATH>
REM 可以把下载的内容缓存在指定的目录，这样如果有多人需要，就可以只下载一次，然后分享给大家，例如：setup.bat --cache=D:\Temp
REM -proxy
REM -proxy=<user:password@url>
REM 可以使用代理下载

REM 参考https://www.cnblogs.com/AnKen/p/6964465.html
REM ***********************************************************
REM *****只需要将该bat文件放在UE4源码Setup.bat同级目录即可*****
REM ***********************************************************
@echo off

SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)

rem 换行操作符
echo(
powershell write-host -fore White -back Green       ***************************************
powershell write-host -fore White -back Magenta     **********  Setup With Params  **********
powershell write-host -fore White -back Green       ***************************************
echo(
@echo off

echo exclude params type:Win32, Win64, osx32,osx64, Linux, Android, IOS, HTML5

echo use backspace split multiple parameters
set /p ExcludeList=Exclude: 

@echo off
::定义一个以分号作为分隔的字符串
::str的副本
set remain=%ExcludeList%
set params=-exclude
set backspace= 
set all_params=%backspace%
:loop
for /f "tokens=1* delims= " %%a in ("%remain%") do (
	::输出第一个分段(令牌)
	echo %%a
	rem 将截取剩下的部分赋给变量remain，其实这里可以使用延迟变量开关
	set remain=%%b
	set all_params=%all_params%%params%=%%a%backspace%
)
::如果还有剩余,则继续分割
if defined remain goto :loop

echo %all_params%

setup.bat %all_params%
rem -exclude=Linux -exclude=IOS -exclude=HTML5  -exclude=Android -exclude=VS2013
pause
goto :eof

:ColorText
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof