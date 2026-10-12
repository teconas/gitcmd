# Create branch and also switch to it

branch() {
	git branch "$@" && sw "$@"
}
