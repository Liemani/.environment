# copy transcript of youtube link

if [ $# -lt 1 ]; then
  echo 'usage : copy_transcript <youtube url>'
  return 1
fi

a copy 요약해줘 `uv run $script/python/get_transcript.py "$1"`
