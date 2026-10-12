# Shared helpers for gitcmd. Sourced before any command.
#
# These live in the user's interactive shell, so: always declare variables
# `local`, and never call `exit` - that would kill the terminal. Use `return`.

# Print a message to stderr.
gitcmd_err() {
	printf '%s\n' "$*" >&2
}

# Echo a command, then run it. Mirrors the `@echo on` sections of the .bat
# versions, where seeing the resolved git command is half the point.
gitcmd_run() {
	printf '%s\n' "$*"
	"$@"
}

# Print the names of all local branches, one per line.
gitcmd_branches() {
	git branch --format='%(refname:short)'
}

# Lowercase stdin-free: lowercase "$*". Uses tr rather than bash's ${v,,} or
# zsh's ${(L)v}, because those are parse errors in the respective other shell.
gitcmd_lower() {
	printf '%s' "$*" | tr '[:upper:]' '[:lower:]'
}

# Find the first local branch whose name contains <term>, case-insensitively.
# Prints the branch name on stdout, or an explanation on stderr and returns 1.
#
# Matching is done with a shell `case` glob rather than grep: the term is used
# literally, so branch names full of /, ., - and + need no escaping.
gitcmd_find_branch() {
	local term branches branch needle hay
	term=$1

	branches=$(gitcmd_branches) || return 1
	needle=$(gitcmd_lower "$term")

	while IFS= read -r branch; do
		[ -n "$branch" ] || continue
		hay=$(gitcmd_lower "$branch")

		case "$hay" in
			*"$needle"*)
				printf '%s\n' "$branch"
				return 0
				;;
		esac
	done <<< "$branches"

	gitcmd_err "Not found $term in $(printf '%s' "$branches" | tr '\n' ' ')"
	return 1
}
