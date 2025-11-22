:: Disallow certain commands on the master branch to prevent bad things
@echo off
git branch --show-current | findstr "master main" > NUL & IF ERRORLEVEL 1 (
REM I dont't know on how to invert the if
) ELSE (
	IF "%~1"=="" (
		ECHO don't do this on production branch u dummy
	) ELSE (
		ECHO don't %* on production branch u dummy
	)	
	exit 1
)
@echo on