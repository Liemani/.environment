if [ "$1" = 'a' ]; then
    >&2 echo 'a_a : [a] as a_command is forbidden.'
    return 1
elif [ $# -eq 0 ]; then
    >&2 echo 'usage : a <a_command> <arguments>'
    >&2 echo 'Enter "a ls" to list all available a_commands.'
    return 1
fi



a_command="$bin/$1"

if [ -f "$a_command" ]; then
    shift
    $SHELL "$a_command" "$@"
else
    >&2 echo "a: There is no a_command [$1]"
fi

unset a_command
