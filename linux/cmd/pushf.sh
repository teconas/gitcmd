# Force Push

pushf() {
	notonmaster force push || return 1

	git push "$@" --force-with-lease
}
