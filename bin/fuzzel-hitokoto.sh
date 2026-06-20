#!/bin/bash

#fuzzel每日一言脚本包装

CACHE_FILE="$HOME/.cache/fuzzel_hitokoto"

if [ -f "$CACHE_FILE" ] && [ -s "$CACHE_FILE" ] ; then
    QUOTE=$(cat "$CACHE_FILE")
else
    QUOTE="清风理残影......"
fi

fuzzel --placeholder="$QUOTE" &

(
    # max_length=15 
    curl -s --connect-timeout 2 -f "https://v1.hitokoto.cn/?encode=text&max_length=15" > "$CACHE_FILE"
) &
