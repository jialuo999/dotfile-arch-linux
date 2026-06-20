#!/bin/bash

#二次元图片拉取

CACHE_DIR="${HOME}/.cache/anime-fastfetch"
IMG_PATH="${CACHE_DIR}/current.png"
mkdir -p "$CACHE_DIR"

# 主力: yppp.net（跟随跳转直接下载图片）
if curl -sfL --max-time 10 "https://api.yppp.net/pe.php" -o "$IMG_PATH" && [[ -s "$IMG_PATH" ]]; then
    echo "yppp.net"
    exit 0
fi

# 备用: nekos.best
cats=("neko" "kitsune" "waifu")
cat="${cats[$((RANDOM % ${#cats[@]}))]}"
url=$(curl -sf --max-time 5 "https://nekos.best/api/v2/${cat}" \
      | python3 -c "import sys,json; print(json.load(sys.stdin)['results'][0]['url'])" 2>/dev/null)

[[ -z "$url" || "$url" == "null" ]] && echo "拉取失败" && exit 1

curl -sfL --max-time 10 "$url" -o "$IMG_PATH" && echo "nekos.best"
