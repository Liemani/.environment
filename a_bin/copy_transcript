# copy transcript of youtube link

if [ $# -lt 1 ]; then
  echo 'usage : copy_transcript <youtube url>'
  return 1
fi

cd $script/python
a copy 요약해줘 `uv run get_transcript.py "$1"`
