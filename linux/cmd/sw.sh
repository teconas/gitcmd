# Type part of a branch name to switch to it

sw() {
	local term branch

	if [ -z "${1:-}" ]; then
		gitcmd_run git switch -
		return
	fi

	term=$1
	shift

	branch=$(gitcmd_find_branch "$term") || return 1

	gitcmd_run git switch "$branch" "$@"
}
