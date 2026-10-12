# Fetch/Pull another branch not currently on

fetchb() {
	if [ -z "${1:-}" ]; then
		gitcmd_err "usage: fetchb <branch>"
		return 1
	fi

	git fetch origin "$1:$1"
}
