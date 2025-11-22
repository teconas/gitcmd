:: Push all Tags present for HEAD
@echo off
for /f "tokens=* delims=" %%T in ('git tag --points-at %1') do (
	echo git push origin tag %%T
    git push origin tag %%T
)
