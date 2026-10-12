# Update master and rebase into current branch

rbm() {
	notonmaster rebase || return 1

	git fetch origin master:master &&
		git rebase -r master "$@"
}
