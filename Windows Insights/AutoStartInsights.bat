taskkill /F /IM UnrealInsights.exe

set InSightPath="G:\WorkTools\UE_4.26\Engine\Binaries\Win64"
set UE4EditorPath="G:\WorkTools\UE_4.26\Engine\Binaries\Win64"
start /d %InSightPath% UnrealInsights.exe rem -tracehost=127.0.0.1 -trace=frame,cpu,gpu,memory

rem 在Editor选择Stand模式，使用这种启动Insights
start /d %InSightPath% UnrealInsights.exe -tracehost=127.0.0.1 -trace=frame,cpu,gpu,memory
rem 直接独立运行Stand模式，使用这种启动Insights
rem start /d %UE4EditorPath% UE4Editor.exe D:\UE_Project\XGame_Master\ProjectX\ProjectX.uproject -game -WINDOWED -RestX=1280 -RestY=720 -nosound -trace=frame,cpu,gpu,memory
pause