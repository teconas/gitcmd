# Push all Tags present for HEAD

pushtags() {
	local tags tag
	tags=$(git tag --points-at "${1:-HEAD}") || return 1

	if [ -z "$tags" ]; then
		gitcmd_err "No tags point at ${1:-HEAD}"
		return 0
	fi

	while IFS= read -r tag; do
		gitcmd_run git push origin tag "$tag"
	done <<< "$tags"
}
