#!/bin/sh

yt-dlp -w -x --audio-format opus --audio-quality 0 -o "%(title)s.%(ext)s" "https://soundcloud.com/ridx5j-627664167/likes"
