rem 将Run.bat放入执行文件XXX.exe统计目录
rem 双击启动即可

taskkill /F /IM UnrealInsights.exe

set InSightPath="F:\UE5\UE_Src\UE_5.3_T3\Engine\Binaries\Win64"
set UE4EditorPath="F:\UE5\UE_Src\UE_5.3_T3\Engine\Binaries\Win64\UnrealEditor.exe"

rem 启动UnrealInsight
start /d %InSightPath% UnrealInsights.exe -tracehost=127.0.0.1 -trace=default,memory &

rem 启动执行文件
set ProjectName=M2_Client
set ProjectDebugName=M2_Client
set ExePath=BuildApp/Windows/%ProjectName%/Binaries/Win64/
cd %ExePath%
%ProjectDebugName%.exe -trace=default,memory
pause