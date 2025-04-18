if [ $# -ne 1 ]; then
    echo 'usage : ln <target>'
    echo '    target is relative path from $script/sh'
    return 1
fi

target_absolute=$script/sh/$1

if [ ! -f "$target_absolute" ]; then
    echo 'a::ln : no file exist ['"$target_absolute"']'
    unset target_absolute
    return 1
else
    unset target_absolute
fi

basename=$(basename "$1")
filename=${basename%.*}
target_relative=../script/sh/$1

ln -s "$target_relative" "$bin/$filename"

unset basename
unset filename
unset target_relative
