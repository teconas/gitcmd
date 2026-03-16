:: Merge cleanly with forced commit
@echo off
SET SOURCE=%1
SET EXTRA_ARGS=
for /f "tokens=1,* delims= " %%a in ("%*") do set EXTRA_ARGS=%%b
for /f %%i in ('git branch --show-current') do SET TARGET=%%i

git merge-base --is-ancestor %TARGET% %SOURCE% >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Error: Rebase %TARGET% into %SOURCE% first.
	exit 1
)

@echo on
git merge %SOURCE% --no-ff %EXTRA_ARGS%