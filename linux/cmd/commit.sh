# Commit staged changes with the given message
#
# "$*" and not "$@": the whole rest of the line is one commit message.

commit() {
	git commit -m "$*"
}
