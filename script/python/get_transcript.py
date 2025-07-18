# get transcript from youtube link

from youtube_transcript_api import YouTubeTranscriptApi
import sys
import re

def extract_video_id(url):
    from urllib.parse import unquote, urlparse, parse_qs

    # Handle Google redirect URLs
    if 'url=' in url:
        parsed = urlparse(url)
        query = parse_qs(parsed.query)
        if 'url' in query:
            real_url = unquote(query['url'][0])
            return extract_video_id(real_url)

    # 지원하는 유튜브 URL 형식 예:
    # - https://www.youtube.com/watch?v=VIDEO_ID
    # - https://youtu.be/VIDEO_ID
    # - https://www.youtube.com/embed/VIDEO_ID
    patterns = [
        r"v=([a-zA-Z0-9_-]{11})",
        r"youtu\.be/([a-zA-Z0-9_-]{11})",
        r"youtube\.com/embed/([a-zA-Z0-9_-]{11})",
        r"youtube\.com/shorts/([a-zA-Z0-9_-]{11})",
    ]
    for pattern in patterns:
        match = re.search(pattern, url)
        if match:
            return match.group(1)
    raise ValueError("Invalid YouTube URL")


def try_transcript(video_id):
    from youtube_transcript_api import YouTubeTranscriptApi, TranscriptsDisabled, NoTranscriptFound
    try:
        transcript_list = YouTubeTranscriptApi.list_transcripts(video_id)
        try:
            return transcript_list.find_manually_created_transcript(['en']).fetch()
        except NoTranscriptFound:
            pass
        try:
            return transcript_list.find_manually_created_transcript(['ko']).fetch()
        except NoTranscriptFound:
            pass
        try:
            return transcript_list.find_generated_transcript(['en']).fetch()
        except NoTranscriptFound:
            pass
        try:
            return transcript_list.find_generated_transcript(['ko']).fetch()
        except NoTranscriptFound:
            pass
    except (TranscriptsDisabled, NoTranscriptFound):
        return []

    return []

def main():
    if len(sys.argv) != 2:
        print("Usage: python get_transcript.py <youtube_url>")
        sys.exit(1)

    url = sys.argv[1]
    video_id = extract_video_id(url)

    transcript = try_transcript(video_id)

    if transcript:
        for line in transcript:
            print(line.text)
    else:
        print("❌ 사용할 수 있는 자막이 없습니다.", file=sys.stderr)

if __name__ == "__main__":
    main()
