### prologue

I recommand using this program on new environment not old. And `backup` aux command's uniformed commit message makes hard differentiating your commits. So I recommand to use this program for backup purpose of repository which is don't need to record the change log or version.



## Environment Managent Program

### How to use

1. cd to `ENVHOME` where you want to be environment home

```
ENVHOME=environment/home/path
cd $ENVHOME
```

2. clone this repository

```
git clone https://github.com/Liemani/.environment.git
```

3. edit `data` directory for you

- $ENVHOME/.environment/data/

4. run setup script with $SHELL command

```
$SHELL .environment/setup.sh
```

5. source shell rc file

```
source $ENVHOME/activate.sh
```

### Usage of `a`

```
a <a_command> [<arguments>]
```

command `a` run `a_command` in $env/bin

#### endcode

##### the compilation system concept

###### file flow

- source program(text)
- modified source program(text)
- assembly program(text)
- relocatable object programs(binary)
- executable object program(binary)

###### processor flow

- preprocessor(cpp)
- compiler(cc1)
- assembler(as)
- linker(ld)

##### file

###### files

- gcc_x.sh

- g++_x.sh
- g++_

###### gcc_x.sh

- generate from c file to executable x86_64 architecture program

###### compile.sh

- generate from c file to assembly program

###### g++_x.sh

- generate from c++ file to executable x86_64 architecture program

### Features

- Target : macOS::zsh, ::bash, Alpine Linux::ash
- Liemani's `.shrc`
- Liemani's `.vimrc`
- Liemani's `.gitignore`
- Liemani's prompt
- Liemani's `a` command

### Deep Features

#### vim

- all `vim` command call `a _vim`, and `_vim` call `command vim`
  - `vim (aliased)` -> `_vim.sh` -> `command vim`

#### Directory Structure

`bin/`: Executable files. Used as `a_command`
`copy_source/`: Files are copied when execute `set_env.sh`
`data/`: Files are sourced when `source apply_env.sh` or whenever need
`script/`: Script files

## todo

- `a_command`
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
use "." not "bash" when calling a_command
{
  created : 2025-03-12 Wed
  last_modified : 2025-03-12 Wed
  status : accepted
  context :
  decision : use "."
  consequences : a_command will use same environment(ex> alias) with parent process. But must unset local variable.
}
