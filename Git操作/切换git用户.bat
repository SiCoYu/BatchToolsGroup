@echo off
git config user.name
git config user.email

set /p user=”√ªß—°‘Ò(1:yuxikuo or 2:SiCoYu):

if %user%==1 (
	git config --global user.name xxx
	git config --global user.email xxxxx@google.com.cn
) else (
	git config --global user.name yyy
	git config --global user.email yyyyy@163.com
)

echo ============================================
git config user.name
git config user.email

pause