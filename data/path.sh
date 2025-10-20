# export ENVHOME
# export useful paths

if [[ $SHELL =~ .*/zsh ]]; then
  export ENVHOME=$(realpath $(dirname ${(%):-%x})/../..)
elif [[ $SHELL =~ .*/bash ]]; then
  export ENVHOME=$(realpath $(dirname ${BASH_SOURCE[0]})/../..)
fi

export derivedData=$HOME/Library/Developer/Xcode/DerivedData
export environment=$ENVHOME/.environment
  export script=$environment/script
export private=$ENVHOME/.private
export playground=$ENVHOME/1_area/playground

export private_a_bin=$private/a_bin
export environment_a_bin=$environment/a_bin

export A_PATH=$private_a_bin:$environment_a_bin
