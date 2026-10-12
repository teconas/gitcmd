# GitCMD
Because I use Git so often that ```rebase main``` is nicer to type than ```git rebase main```.

- Also some Shortcuts use multiple git commands.

- The usage of git is highly opinionated to my own likings. (e.g. rebase > merge etc)

- Windows (.bat-Scripts) and Linux (shell functions) are both supported, with the same command names.

## Usage (Windows)
- Check out and add the [Commands-Folder](commands) to your PATH.
- Some of the commands need Python installed with the GitPython Module (```python -m pip install GitPython```)
- Check what each script does before using it

## Usage (Linux)
Source the loader from your `~/.bashrc` or `~/.zshrc`:

```sh
source /path/to/gitcmd/linux/gitcmd.sh
```

- Only as shell functions
- Needs only git and a POSIX-ish shell (no Python).
- Run `gitcmd` to list every command with its description.
- Tab completion for branches
- Check what each script does before using it

## License
Licensed under [Unlicense](LICENSE.MD). 
TLDR:
- Do whatever you want
- I don't care
- Don't blame me