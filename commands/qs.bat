:: QuickSave für den Current State. Hash-wird ausgegeben und in den Stash gepackt
@echo off
for /f %%i in ('git stash create "temp quicksave %~1 %DATE% %TIME%"') do (
	@echo on
    git stash store -m "temp quicksave %~1 (%DATE% %TIME%)" %%i
    echo Snapshot gespeichert: %%i
    goto :done
)
echo Keine Änderungen zum Speichern.
:done