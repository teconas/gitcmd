import os
import sys
import git

# Find root path of current git
def get_git_root(path):
    git_repo = git.Repo(path, search_parent_directories=True)
    git_root = git_repo.git.rev_parse("--show-toplevel")
    return git_root

# Fetch and return name of all local branches
def get_branches():
    path = get_git_root(os.getcwd())
    r = git.Repo(path)
    return list(map(lambda x: x.name,r.heads))

def find_branch(term):
    branches = get_branches()
    for branch in branches:
        if term.lower() in branch.lower():
            return branch
    print("Not found "+term+" in " + str(branches))
    exit(1)

print(find_branch(sys.argv[1]))