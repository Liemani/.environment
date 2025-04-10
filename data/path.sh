if [[ $SHELL =~ .*/zsh ]]; then
  export ENVHOME=$(realpath $(dirname ${(%):-%x})/../..)
elif [[ $SHELL =~ .*/bash ]]; then
  export ENVHOME=$(realpath $(dirname ${BASH_SOURCE[0]})/../..)
fi

export environment=$ENVHOME/.environment
  export bin=$environment/bin
  export script=$environment/script

export private=$ENVHOME/.private

  export playground=$ENVHOME/0_areas/playground

export derivedData=$HOME/Library/Developer/Xcode/DerivedData
