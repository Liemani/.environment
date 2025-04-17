# soure path.sh
# run activate.sh.d/activate.sh

if [[ $SHELL =~ .*/zsh ]]; then
  . "$(dirname "${(%):-%x}")/data/path.sh"
elif [[ $SHELL =~ .*/bash ]]; then
  . "$(dirname "${BASH_SOURCE[0]}")/data/path.sh"
fi

. $environment/activate.sh.d/activate.sh
