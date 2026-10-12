# The `gitcmd` command itself: list every command with its description.
#
# The description is the first line of each cmd/*.sh file, which is why those
# files start with a `# ...` comment instead of a shebang.

gitcmd() {
	local file name desc

	printf 'gitcmd commands (%s):\n\n' "$GITCMD_DIR"

	for file in "$GITCMD_DIR"/cmd/*.sh; do
		name=${file##*/}
		name=${name%.sh}

		IFS= read -r desc < "$file"
		desc=${desc###}
		desc=${desc# }

		printf '  %-12s %s\n' "$name" "$desc"
	done

	printf '  %-12s %s\n' "gitcmd" "List all gitcmd commands"
}
