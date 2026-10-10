# .environment

Personal terminal environment configuration.

This repository is the source of truth for Git, shell, Vim, aliases, and
terminal scripts. It is intended to reproduce the same environment on a new
machine.

## Installation

Supported installation policies:

- macOS (`Darwin`): register runtime activation in `~/.zshrc`
- Linux: register runtime activation in `~/.bashrc`

The repository's parent directory becomes `ENVHOME`; private scripts are read
from `ENVHOME/.private/a_bin`. Choose the clone location accordingly. On a
machine with existing shell or Git configuration, inspect and back up the
target rc file, global Git configuration, and `~/.config/environment` before setup.

Clone the repository, create the machine-specific profile, build the generated
configuration, then run the installer.

```sh
git clone https://github.com/Liemani/.environment.git
cd .environment
cp profile/profile.toml.sample profile/profile.toml
# Edit profile/profile.toml for this machine.
./build.sh
./setup.sh
```

The current configuration uses `username` and `email` from the profile.

Open a new terminal after setup. The installer is implemented in Bash and does
not use the current login shell to choose its policy. `setup.sh` does not run a
build. Run `./build.sh` again after changing `config/`, `lib/runtime/`, or
`profile/profile.toml`; setup does not need to be rerun after a rebuild.

## Runtime

The registered rc file sources `activate.sh`.

`activate.sh` supports Bash and Zsh. It determines the shell currently sourcing
it, initializes common environment settings, then applies the matching prompt,
completion, and key-binding integration.

## Configuration Lifecycle

- `config/`: editable configuration sources committed to Git
- `profile/profile.toml`: machine-specific input created from the sample and not committed
- `generated/`: built runtime configuration, not committed or edited directly
- `build.sh`: rebuilds `generated/` from `config/` and `lib/runtime/` after confirming a profile exists

`build.sh` creates a complete temporary build artifact before replacing
`generated/`. If a build fails before replacement, the previous generated
configuration is left intact. See [RENDERING.md](RENDERING.md) for the
placeholder specification.

## Repository Structure

### Public API

- `build.sh`: builds `generated/` from `config/`, `lib/runtime/`, and `profile/`
- `setup.sh`: links `~/.config/environment` to `generated/`, registers Git
  through the link, and adds the repository's `activate.sh` path to the target
  shell rc file
- `activate.sh`: initializes the built environment in the current Bash or Zsh session

### Internal Implementation

- `lib/build/`: profile parsing and configuration rendering
- `lib/runtime/`: shared and shell-specific runtime initialization
- `lib/setup/`: installer context and registration helpers

`lib/` is implementation detail. Use the root lifecycle commands rather than
invoking its scripts directly.

## Runtime Registration

`setup.sh` registers one runtime directory:

```text
~/.config/environment -> <repository>/generated
```

Git includes `~/.config/environment/.gitconfig`, and that configuration uses
`~/.config/environment/.gitignore`. The shell rc file instead sources
`<repository>/activate.sh` by absolute path, so keep the installed repository
at that location.

If `~/.config/environment` is already a symbolic link, setup replaces that
link. If it is a regular file or directory, setup leaves it unchanged, skips
Git registration, completes independent shell registration, and returns a
failure status.

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
