:: Type part of a branch name to switch to it. Requires python.
@ECHO OFF
if "%1"=="" (
	@echo ON
	git switch -
	@echo OFF
	GOTO EOF
)
call python %~dp0sub/find-git-branch.py "%1" > switch_output.txt
SET SUCCESS=%ERRORLEVEL%
SET /p BRANCH=<switch_output.txt
DEL switch_output.txt
if %SUCCESS% NEQ 0 (
	echo %BRANCH%
	GOTO EOF
)


for /f "tokens=1,* delims= " %%a in ("%*") do set ALL_BUT_FIRST=%%b
@echo on
git switch %BRANCH% %ALL_BUT_FIRST%
@echo OFF

:EOF