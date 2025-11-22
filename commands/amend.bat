:: Amend everything to last commit
CALL %~dp0notonmaster.bat amend

git add .
git commit --amend --no-edit