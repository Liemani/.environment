# .environment

Personal terminal environment configuration.

This repository is the source of truth for Git, shell, Vim, aliases, and
terminal scripts. It is intended to reproduce the same environment on a new
machine.

## Installation

Supported installation policies:

- macOS (`Darwin`): register runtime activation in `~/.zshrc`
- Linux: register runtime activation in `~/.bashrc`

Clone the repository, enter it, and run the installer.

```sh
git clone https://github.com/Liemani/.environment.git
cd .environment
./setup.sh
```

Open a new terminal after setup. The installer is implemented in Bash and does
not use the current login shell to choose its policy.

## Runtime

The registered rc file sources `activate.sh`.

`activate.sh` supports Bash and Zsh. It determines the shell currently sourcing
it, initializes common environment settings, then applies the matching prompt,
completion, and key-binding integration.

## Configuration

- `data/.gitconfig`: shared Git configuration
- `data/git-user.config`: Git user identity
- `data/path.sh`: common environment paths
- `data/alias.sh`: shell aliases and functions
- `data/.vimrc`: Vim configuration
- `script/`: terminal scripts, including scripts invoked through `a`

## Usage of `a`

```text
a <script> [arguments]
```

`a` sources a script from the configured public or private script paths.

## Scope

This is a personal environment repository, not a generic dotfiles framework.
`setup.sh` installs the repository's preferred environment; migration and
existing-environment analysis are outside its scope.
