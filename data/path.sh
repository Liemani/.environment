if [ -z "${ENVIRONMENT-}" ] || [ -z "${ENVHOME-}" ]; then
  printf 'data/path.sh must be sourced through activate.sh.\n' >&2
  return 1 2>/dev/null || exit 1
fi

export DERIVED_DATA=$HOME/Library/Developer/Xcode/DerivedData
export SCRIPT=$ENVIRONMENT/script
export A_CORE=$SCRIPT/core
export PRIVATE=$ENVHOME/.private
export PLAYGROUND=$ENVHOME/1_area/playground

export A_PATH_PRIVATE=$PRIVATE/a_bin
export A_PATH_PUBLIC=$SCRIPT/a_bin

export A_PATH=$A_PATH_PRIVATE:$A_PATH_PUBLIC
a_path=("$A_PATH_PRIVATE" "$A_PATH_PUBLIC")
