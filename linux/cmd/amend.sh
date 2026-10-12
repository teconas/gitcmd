# Amend everything to last commit

amend() {
	notonmaster amend || return 1

	git add . &&
		git commit --amend --no-edit
}
