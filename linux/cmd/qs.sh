# QuickSave the current state: create a stash object without touching the worktree
#
# `git stash create` builds the stash commit but neither stores it in the
# stash ref nor cleans the worktree, so the files stay exactly as they are.
# `git stash store` then makes it reachable, so `git stash list` finds it again.

qs() {
	local label stamp msg hash

	label=$*
	stamp=$(date '+%Y-%m-%d %H:%M:%S')

	if [ -n "$label" ]; then
		msg="temp quicksave $label ($stamp)"
	else
		msg="temp quicksave ($stamp)"
	fi

	hash=$(git stash create "$msg") || return 1

	if [ -z "$hash" ]; then
		printf '%s\n' "Nothing to save."
		return 0
	fi

	gitcmd_run git stash store -m "$msg" "$hash" || return 1
	printf 'Snapshot saved: %s\n' "$hash"
}
