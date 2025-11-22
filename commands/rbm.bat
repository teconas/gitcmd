:: Update master and rebase into current branch
CALL %~dp0notonmaster.bat rebase
git fetch origin master:master
git rebase master %*