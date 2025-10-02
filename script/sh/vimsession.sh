#!/bin/bash
# open vimsession in private/.vimsession or in git root

print_usage()
{
  echo "usage : vimsession [-l] [-h] <identifier>"
  echo "  -l   list available sessions"
  echo "  -h   show this help"
}

while getopts "lh" opt; do
  case "$opt" in
    l)
      echo "Available sessions:"
      ls "$private/.vimsession"
      exit 0
      ;;
    h)
      print_usage
      exit 0
      ;;
    \?)
      print_usage
      exit 1
      ;;
  esac
done

shift $((OPTIND-1))

if [ $# -eq 0 ]; then
  gitroot=$(git rev-parse --show-toplevel 2>/dev/null)

  if [ -n "$gitroot" ]; then
    if [ -f "$gitroot/.vimsession" ]; then
      echo "Opening session from $gitroot/.vimsession"
      a _vim -S "$gitroot/.vimsession"
      exit 0
    else
      reponame=$(basename "$gitroot")
      if [ -f "$private/.vimsession/$reponame" ]; then
        echo "Opening session from $private/.vimsession/$reponame"
        a _vim -S "$private/.vimsession/$reponame"
        exit 0
      fi
    fi
  fi

  echo "No identifier provided, and no suitable .vimsession found."
  exit 1

elif [ $# -eq 1 ]; then
  session_file="$private/.vimsession/$1"
  if [ -f "$session_file" ]; then
    echo "Opening session from $session_file"
    a _vim -S "$session_file"
  else
    echo "Session file not found: $session_file"
    exit 1
  fi
else
  print_usage
  ls "$private/.vimsession"
  exit 1
fi
