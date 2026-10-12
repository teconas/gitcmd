# gitcmd - Linux edition.
#
# Source this from your ~/.bashrc or ~/.zshrc:
#     source /path/to/gitcmd/linux/gitcmd.sh
#
# Every command is a shell function, not a script on PATH. The names are very
# generic (log, status, merge, tag, ...), and a PATH entry would hand them to
# every child process too - build scripts, cron jobs, anything running /bin/sh.
# Functions stay scoped to the interactive shell that sourced this file.

# Resolve our own directory, in bash and zsh alike.
if [ -n "${ZSH_VERSION:-}" ]; then
	GITCMD_DIR=${0:A:h}
else
	GITCMD_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
fi

. "$GITCMD_DIR/lib/common.sh"
. "$GITCMD_DIR/lib/help.sh"

for _gitcmd_file in "$GITCMD_DIR"/cmd/*.sh; do
	. "$_gitcmd_file"
done
unset _gitcmd_file

. "$GITCMD_DIR/lib/completion.sh"
