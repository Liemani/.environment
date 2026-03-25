# export ENVHOME
# export useful paths

if [[ $SHELL =~ .*/zsh ]]; then
  export ENVHOME=$(realpath $(dirname ${(%):-%x})/../..)
elif [[ $SHELL =~ .*/bash ]]; then
  export ENVHOME=$(realpath $(dirname ${BASH_SOURCE[0]})/../..)
fi

export DERIVED_DATA=$HOME/Library/Developer/Xcode/DerivedData
export ENVIRONMENT=$ENVHOME/.environment
  export SCRIPT=$ENVIRONMENT/script
    export A_CORE=$SCRIPT/core
export PRIVATE=$ENVHOME/.private
export PLAYGROUND=$ENVHOME/1_area/playground

export A_PATH_PRIVATE=$PRIVATE/a_bin
export A_PATH_PUBLIC=$SCRIPT/a_bin

export A_PATH=$A_PATH_PRIVATE:$A_PATH_PUBLIC
a_path=("$A_PATH_PRIVATE" "$A_PATH_PUBLIC")
