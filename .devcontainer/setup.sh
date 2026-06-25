#!/bin/bash
set -e

mkdir -p ~/.config/rclone

if [ ! -f ~/.config/rclone/rclone.conf ]; then
    if [ -n "$RCLONE_CONFIG_CONTENT" ]; then
        printf "%s" "$RCLONE_CONFIG_CONTENT" > ~/.config/rclone/rclone.conf
        chmod 600 ~/.config/rclone/rclone.conf
        echo "✓ Restored rclone config"
    else
        echo "No rclone secret found."
    fi
fi

echo
echo "Installed versions"

echo "FFmpeg:"
ffmpeg -version | head -1

echo
echo "Rclone:"
rclone version | head -2

echo
echo "Whisper:"
python -c "import whisper; print('Whisper installed successfully')"

echo
echo "Setup completed!"