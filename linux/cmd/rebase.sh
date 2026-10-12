# Rebase the current branch

rebase() {
	notonmaster rebase || return 1

	git rebase "$@"
}
