# export ENVHOME
# export useful paths

if [[ $SHELL =~ .*/zsh ]]; then
  export ENVHOME=$(realpath $(dirname ${(%):-%x})/../..)
elif [[ $SHELL =~ .*/bash ]]; then
  export ENVHOME=$(realpath $(dirname ${BASH_SOURCE[0]})/../..)
fi

export derivedData=$HOME/Library/Developer/Xcode/DerivedData
export environment=$ENVHOME/.environment
  export bin=$environment/bin
  export script=$environment/script
export private=$ENVHOME/.private
export playground=$ENVHOME/1_area/playground
