# under construct
# log screen for every 10 minutes

screencapture -Cm /Volumes/mac/4_storage/storage/screen_log/$(date '+%C%y%m%d%H%M%S').png

# 저장할 경로
SAVE_DIR="/Volumes/mac/4_storage/storage/screen_log"

# 저장 경로 없으면 생성
mkdir -p "$SAVE_DIR"

while true
do
    # 현재 시간 (YYYYMMDDHHMMSS 형식)
    TS=$(date '+%Y%m%d%H%M%S')

    # 캡처 파일 이름
    FILE="$SAVE_DIR/screencap_$TS.png"

    # 스크린샷 찍기 (커서 포함, 전체화면)
    screencapture -Cm "$FILE"

    echo "Saved screenshot: $FILE"

    # 600초(10분) 대기
    sleep 600
done



#!/bin/zsh

SAVE_DIR="/Volumes/mac/4_storage/storage/screen_log"
FLAG_FILE="/tmp/screencap_active.flag"
mkdir -p "$SAVE_DIR"

capture() {
    TS=$(date '+%Y%m%d%H%M%S')
    FILE="$SAVE_DIR/screencap_$TS.png"
    screencapture -Cm "$FILE"
    echo "Saved screenshot: $FILE"
}

while true; do
    if [ -f "$FLAG_FILE" ]; then
        capture
        sleep 600   # 10분마다 캡처
    else
        sleep 5     # flag 없으면 짧게 기다리며 다시 확인
    fi
done



#!/bin/zsh

DAEMON="screencap_daemon.sh"
FLAG_FILE="/tmp/screencap_active.flag"

case "$1" in
    start)
        touch "$FLAG_FILE"
        echo "▶ 캡처 시작 (10분마다 실행)"
        ;;
    stop)
        rm -f "$FLAG_FILE"
        echo "■ 캡처 중지"
        ;;
    *)
        echo "사용법: $0 {start|stop}"
        exit 1
        ;;
esac



<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
 "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.user.screencap</string>

    <key>ProgramArguments</key>
    <array>
        <string>/path/to/screencap_daemon.sh</string>
    </array>

    <key>StartCalendarInterval</key>
    <dict>
        <key>Hour</key>
        <integer>9</integer>
        <key>Minute</key>
        <integer>0</integer>
    </dict>

    <key>StopCalendarInterval</key>
    <dict>
        <key>Hour</key>
        <integer>18</integer>
        <key>Minute</key>
        <integer>0</integer>
    </dict>

    <key>StandardOutPath</key>
    <string>/tmp/screencap.out</string>
    <key>StandardErrorPath</key>
    <string>/tmp/screencap.err</string>
</dict>
</plist>
