taskkill /F /IM UnrealInsights.exe

set InSightPath="E:\WorkTools\UE5\UE_5.1_T3\Engine\Binaries\Win64"
set UE4EditorPath="D:\WP_YXK\UE_Src\UE_5.1_T3\Engine\Binaries\Win64\UnrealEditor.exe"

start /d %InSightPath% UnrealInsights.exe -tracehost=127.0.0.1 -trace=default,memory

pause