# Disallow certain commands on the master branch to prevent bad things
#
# Unlike the .bat version (which uses findstr and therefore matches any branch
# *containing* "master" or "main", e.g. feature/master-fix), this matches the
# branch name exactly.

notonmaster() {
	local current
	current=$(git branch --show-current) || return 1

	case "$current" in
		master | main)
			if [ $# -eq 0 ]; then
				gitcmd_err "don't do this on production branch u dummy"
			else
				gitcmd_err "don't $* on production branch u dummy"
			fi
			return 1
			;;
	esac

	return 0
}
