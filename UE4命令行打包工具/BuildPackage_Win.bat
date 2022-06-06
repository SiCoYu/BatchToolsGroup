echo off
set UAT_Path="G:\WorkTools\UE_4.26\Engine\Build\BatchFiles\RunUAT.bat"
set PakType=0
set /p PakMapsID=Map Names(0:StartScene 7457,701,426,1762,239): 
set /p StartMap=Start Map(0:StartScene 7457,701,426,1762,239):
set /p SelectLanguage=Language(0:En  1:Cn):
set /p PakType=PackageType(0:Debug  1:Release):
set /p UseGM=Use GM(0:Open  1:Close):

setlocal
set CurPath=%~dp0
set ProjectPath=%CurPath%ProjectX.uproject
set OutputPath=%CurPath%Pak
set LanguagePath=%CurPath%Config\Language.ini
set GMPath=%CurPath%Config\HelloWorld.ini
if not exist %OutputPath% (
	md %OutputPath%
)

set MapA=/Game/GameRes/Designer/Levels/Scp5175/SCP5175_Main.SCP5175_Main
set MapB=/Game/GameRes/Designer/Levels/Scp426/SCP426_Main.SCP426_Main
set MapC=/Game/SCP/SCP1762/Maps/SCP1762_Main.SCP1762_Main
set MapD=/Game/SCP/SCP701/Maps/SCP701_Main.SCP701_Main
set MapE=/Game/SCP/SCP239/Maps/Map_239_Main.Map_239_Main
set MapStart=/Game/GameRes/Designer/Levels/GameStart/StartScene.StartScene

set MapACookDir=/Game/Sequence/SCP5175
set MapBCookDir=/Game/Sequence/SCP426
set MapCCookDir=/Game/Sequence/SCP1762
set MapDCookDir=/Game/Sequence/SCP701
set MapECookDir=/Game/Sequence/Scp239
set MapCommonCookDir=/Game/Sequence/Common

set Map_701=701
set Map_5175=5175
set Map_426=426
set Map_1762=1762
set Map_239=239

echo Waitting for modify language......
echo %SelectLanguage%
set TempLanguage=Language=%SelectLanguage%
@echo off >tmp.ini
set language_file=%LanguagePath%
for /f "tokens=1* delims=:" %%i in ('findstr /n ".*" "%language_file%"') do (
      if "%%j"=="" (echo.>>tmp.ini) else (
            echo %%j|find "Language=">nul&&(
				call echo %TempLanguage% >>tmp.ini)||(
                      >>tmp.ini echo %%j)
      )
)

copy tmp.ini "%language_file%" /y >nul||(attrib -s -a -r -h "%language_file%"& copy tmp.ini "%language_file%" /y >nul)

echo Waitting for modify gm......
echo %UseGM%
set TempGM=Hello=%UseGM%
@echo off >tmp.ini
set gm_file=%GMPath%
for /f "tokens=1* delims=:" %%i in ('findstr /n ".*" "%gm_file%"') do (
      if "%%j"=="" (echo.>>tmp.ini) else (
            echo %%j|find "Hello=">nul&&(
				call echo %TempGM% >>tmp.ini)||(
                      >>tmp.ini echo %%j)
      )
)

copy tmp.ini "%gm_file%" /y >nul||(attrib -s -a -r -h "%gm_file%"& copy tmp.ini "%gm_file%" /y >nul)
echo Waitting for modify start scene......
set PakMaps=
set AdditionalCookDir=
set DefaultMap=%StartMap%
echo %PakMapsID%|findstr "7457" >nul
if %errorlevel% equ 0 (
	if [%PakMaps%]==[] (
		set PakMaps=%MapA%
		set AdditionalCookDir=%MapACookDir%
		if [%DefaultMap%] ==[] (
			set DefaultMap=%Map_5175%
		)
	) else (
		set PakMaps=%PakMaps%+%MapA%
		set AdditionalCookDir=%AdditionalCookDir%+%MapACookDir%
	)
) 

echo %PakMapsID%|findstr "426" >nul
if %errorlevel% equ 0 (
	if [%PakMaps%]==[] (
		set PakMaps=%MapB%
		set AdditionalCookDir=%MapBCookDir%
		if [%DefaultMap%] ==[] (
			set DefaultMap=%Map_426%
		)
	) else (
		set PakMaps=%PakMaps%+%MapB%
		set AdditionalCookDir=%AdditionalCookDir%+%MapBCookDir%
	)
) 

echo %PakMapsID%|findstr "1762" >nul
if %errorlevel% equ 0 (
	if [%PakMaps%]==[] (
		set PakMaps=%MapC%
		set AdditionalCookDir=%MapCCookDir%
		if [%DefaultMap%] ==[] (
			set DefaultMap=%Map_1762%
		)
	) else (
		set PakMaps=%PakMaps%+%MapC%
		set AdditionalCookDir=%AdditionalCookDir%+%MapCCookDir%
	)
)

echo %PakMapsID%|findstr "701" >nul
if %errorlevel% equ 0 (
	if [%PakMaps%]==[] (
		set PakMaps=%MapD%
		set AdditionalCookDir=%MapDCookDir%
		if [%DefaultMap%] ==[] (
			set DefaultMap=%Map_701%
		)
	) else (
		set PakMaps=%PakMaps%+%MapD%
		set AdditionalCookDir=%AdditionalCookDir%+%MapDCookDir%
	)
)
  
echo %PakMapsID%|findstr "239" >nul
if %errorlevel% equ 0 (
	if [%PakMaps%]==[] (
		set PakMaps=%MapE%
		set AdditionalCookDir=%MapECookDir%
		if [%DefaultMap%] ==[] (
			set DefaultMap=%Map_239%
		)
	) else (
		set PakMaps=%PakMaps%+%MapE%
		set AdditionalCookDir=%AdditionalCookDir%+%MapECookDir%
	)
)
set AdditionalCookDir=%AdditionalCookDir%+%MapCommonCookDir%

set INIPath=%CurPath%Config\DefaultEngine.ini
echo %INIPath%
@echo off >tmp.ini
set file=%INIPath%
for /f "tokens=1* delims=:" %%i in ('findstr /n ".*" "%file%"') do (
      if "%%j"=="" (echo.>>tmp.ini) else (
            echo %%j|find "GameDefaultMap">nul&&(
				if [%DefaultMap%] ==[701] (
					call echo GameDefaultMap=/Game/SCP/SCP701/Maps/SCP701_Main.SCP701_Main>>tmp.ini
				) else if [%DefaultMap%] ==[1762] (
					call echo GameDefaultMap=/Game/SCP/SCP1762/Maps/SCP1762_Main.SCP1762_Main>>tmp.ini
				) else if [%DefaultMap%] ==[426] (
					call echo GameDefaultMap=/Game/GameRes/Designer/Levels/Scp426/SCP426_Main.SCP426_Main>>tmp.ini
				) else if [%DefaultMap%] ==[5175] (
					call echo GameDefaultMap=/Game/GameRes/Designer/Levels/Scp5175/SCP5175_Main.SCP5175_Main>>tmp.ini
				) else if [%DefaultMap%] ==[0] (
					call echo GameDefaultMap=/Game/GameRes/Designer/Levels/GameStart/StartScene.StartScene>>tmp.ini
				)
                )||(
                      >>tmp.ini echo %%j)
      )
)
copy tmp.ini "%file%" /y >nul||(attrib -s -a -r -h "%file%"& copy tmp.ini "%file%" /y >nul)

echo Waitting for packing......
echo %PakMaps%
echo %DefaultMap%
echo %AdditionalCookDir%
echo %OutputPath%
echo %UAT_Path%

if "%PakType%"=="0" (
	%UAT_Path% BuildCookRun -project=%ProjectPath% -noP4 -platform=Win64 -clientconfig=Development -serverconfig=Development -cook -CookDir=%AdditionalCookDir% -map=%PakMaps% -build -stage -pak -archive -archivedirectory=%OutputPath% > Buildlog_Client.txt
) else if "%PakType%"=="1" (
	%UAT_Path% BuildCookRun -project=%ProjectPath% -noP4 -platform=Win64 -clientconfig=Shipping -serverconfig=Shipping -cook -CookDir=%AdditionalCookDir% -map=%PakMaps% -build -stage -pak -archive -archivedirectory=%OutputPath% > Buildlog_Client.txt
)

pause
@echo off