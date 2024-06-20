taskkill /F /IM UnrealInsights.exe

set InSightPath="F:\UE5\UE_Src\UE_5.3_T3\Engine\Binaries\Win64"
set UE4EditorPath="F:\UE5\UE_Src\UE_5.3_T3\Engine\Binaries\Win64\UnrealEditor.exe"

start /d %InSightPath% UnrealInsights.exe -tracehost=127.0.0.1 -trace=default,memory &

%UE4EditorPath%  D:/WP_YXK/UE5_WP/UT_UE5T3/UT_UE5T3.uproject -trace=default,memory
pause