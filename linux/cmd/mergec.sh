# Merge cleanly with forced commit

mergec() {
	local src target

	if [ -z "${1:-}" ]; then
		gitcmd_err "usage: mergec <branch> [git merge args...]"
		return 1
	fi

	src=$1
	shift

	target=$(git branch --show-current) || return 1

	if ! git merge-base --is-ancestor "$target" "$src" >/dev/null 2>&1; then
		gitcmd_err "Error: Rebase $target into $src first."
		return 1
	fi

	gitcmd_run git merge "$src" --no-ff "$@"
}
