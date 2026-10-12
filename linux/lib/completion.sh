# Tab completion for the commands that take a branch or a tag.
#
# `sw` matches on a substring, so completing it against full branch names is
# still useful: it tells you what is there to abbreviate.

if [ -n "${BASH_VERSION:-}" ]; then

	_gitcmd_complete_branches() {
		local cur
		cur=${COMP_WORDS[COMP_CWORD]}
		COMPREPLY=($(compgen -W "$(gitcmd_branches 2>/dev/null)" -- "$cur"))
	}

	_gitcmd_complete_tags() {
		local cur
		cur=${COMP_WORDS[COMP_CWORD]}
		COMPREPLY=($(compgen -W "$(git tag 2>/dev/null)" -- "$cur"))
	}

	complete -F _gitcmd_complete_branches sw branch fetchb merge mergec rebase
	complete -F _gitcmd_complete_tags tag pushtags

elif [ -n "${ZSH_VERSION:-}" ] && command -v compdef >/dev/null 2>&1; then

	_gitcmd_complete_branches() {
		local -a branches
		branches=(${(f)"$(gitcmd_branches 2>/dev/null)"})
		compadd -a branches
	}

	_gitcmd_complete_tags() {
		local -a tags
		tags=(${(f)"$(git tag 2>/dev/null)"})
		compadd -a tags
	}

	compdef _gitcmd_complete_branches sw branch fetchb merge mergec rebase
	compdef _gitcmd_complete_tags tag pushtags

fi
