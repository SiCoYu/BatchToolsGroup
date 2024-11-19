@echo off

REM 删除项目中间文件
rmdir /S /Q "Intermediate"

REM 删除插件中间文件
for /D %%i in ("Plugins\*\Intermediate\*") do (
    rmdir /S /Q "%%i"
)

REM 删除项目的 Binaries 目录
rmdir /S /Q "Binaries"

REM 删除插件的 Binaries 目录
for /D %%i in ("Plugins\*") do (
    rmdir /S /Q "%%i\Binaries"
)

REM 删除项目的 DerivedDataCache 目录
rmdir /S /Q "DerivedDataCache"

REM 删除插件的 DerivedDataCache 目录
for /D %%i in ("Plugins\*") do (
    rmdir /S /Q "%%i\DerivedDataCache"
)

echo 中间文件已清理完毕。
pause