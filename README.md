# .environment

Personal terminal environment configuration.

This repository is the source of truth for Git, shell, Vim, aliases, and
terminal scripts. It is intended to reproduce the same environment on a new
machine.

## Installation

Supported installation policies:

- macOS (`Darwin`): register runtime activation in `~/.zshrc`
- Linux: register runtime activation in `~/.bashrc`

Clone the repository, create the machine-specific profile, build the effective
configuration, then run the installer.

```sh
git clone https://github.com/Liemani/.environment.git
cd .environment
cp profile/profile.ini.sample profile/profile.ini
# Edit profile/profile.ini for this machine.
./build.sh
./setup.sh
```

Open a new terminal after setup. The installer is implemented in Bash and does
not use the current login shell to choose its policy. `setup.sh` does not run a
build; run `./build.sh` again after changing `config/` or
`profile/profile.ini`.

## Runtime

The registered rc file sources `activate.sh`.

`activate.sh` supports Bash and Zsh. It determines the shell currently sourcing
it, initializes common environment settings, then applies the matching prompt,
completion, and key-binding integration.

## Configuration Lifecycle

- `config/`: editable configuration sources committed to Git
- `profile/profile.ini`: machine-specific input created from the sample and not committed
- `effective/`: built runtime configuration, not committed or edited directly
- `build.sh`: fully rebuilds `effective/` from `config/` after confirming a profile exists

`build.sh` creates a complete temporary build artifact before replacing
`effective/`. If a build fails before replacement, the previous effective
configuration is left intact. See [RENDERING.md](RENDERING.md) for the
placeholder specification.

## Configuration Contents

- `config/.gitconfig`: shared Git configuration
- `config/git-user.config`: Git user identity template
- `config/path.sh`: common environment paths
- `config/alias.sh`: shell aliases and functions
- `config/.vimrc`: Vim configuration
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
