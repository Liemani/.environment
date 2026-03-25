## prologue

I recommand using this program on new environment not old. And `backup` aux script's uniformed commit message makes hard differentiating your commits. So I recommand to use this program for backup purpose of repository which is don't need to record the change log or version.


## File structure

```
$ENVHOME/
| .private/
| .environment/
```

## How to use

1. cd to `$ENVHOME` where you want to be environment home

```
ENVHOME=environment/home/path
cd $ENVHOME
```

2. clone this repository

```
git clone https://github.com/Liemani/.environment.git
```

3. edit `data` directory to you

- $ENVHOME/.environment/data/

4. run setup script with $SHELL command

```
$SHELL .environment/setup.sh
```

5. source shell rc file

```
. $ENVHOME/activate.sh
```

## Usage of `a`

```
a <a_script> [<arguments>]
```

script `a` run `a_script` in $env/bin

## endcode

- use builtin compiler

#### the compilation system concept

##### file flow

- source code (text)
- modified source code (text)
- assembly code (text)
- relocatable object programs (binary)
- executable object program (binary)

##### processor flow

- preprocessor(cpp)
- compiler(cc1)
- assembler(as)
- linker(ld)

#### file

##### files

- gcc_x.sh

- g++_x.sh
- g++_

##### gcc_x.sh

- generate from c file to executable x86_64 architecture program

##### compile.sh

- generate from c file to assembly program

##### g++_x.sh

- generate from c++ file to executable x86_64 architecture program

## Features

- Target : macOS.zsh, bash, Alpine Linux.ash (deprecated)
- Liemani's `.shrc`
- Liemani's `.vimrc`
- Liemani's global `.gitignore`
- Liemani's prompt
- Liemani's `a` script environment

## Deep Features

### vim

- all `vim` command call `a _vim`, and `_vim` call `command vim`
  - `vim (aliased)` -> `_vim.sh` -> `command vim`

### Directory Structure

`bin/`: Executable files. Used as `a_script`
`copy_source/`: Files are copied when execute `set_env.sh`
`data/`: Files are sourced when `source apply_env.sh` or whenever need
`script/`: Script files

## todo

- `a_script`
  - Adopt
    - `backcheck`
    - `backup`
  - Create
    - `mv`
  - Check
    - `vim` to create to script/sh/ correctly and create link file to bin/



## not working

- You can save vim session to `<repository>/.vimsession/<session name you want>` by pressing `<F3>` in vim
  - You have to `mkdir <repository>/.vimsession` before this to work
  - And you can load that session easily by `a vimsession <vim session name>`
    - Test `a vimsession env` which I saved! :D



## memo
`./file` could run another version of shell rather than current shell
  so i will use `$SHELL file` to run a shell script



## decision record
use "." not "bash" when calling a_script
{
  created : 2025-03-12 Wed
  last_modified : 2025-03-12 Wed
  status : accepted
  context :
  decision : use "."
  consequences : a_script will use same environment(ex> alias) with parent process. But must unset local variable.
}

{
  title : distinguish global and local environment variable visually
  created : 2026-03-24 Tue
  last_modified : 2026-03-25 Wed
  status : accepted
  context : a_script is called with 'source', have to avoid env conflict
  decision1 : prepend '_' for local variable
  decision2 : use lowercase letter for local variable
  decision3 : prepend '_' for local variable - lowercase letter is also used for variable already
  consequences : a_script avoid env conflict with original process
}
