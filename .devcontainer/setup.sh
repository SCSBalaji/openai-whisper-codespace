#!/bin/bash
set -e

echo "========== Setting up Codespace =========="

# Restore rclone config if secret exists
if [ -n "$RCLONE_CONFIG_CONTENT" ]; then
    mkdir -p ~/.config/rclone

    printf "%s" "$RCLONE_CONFIG_CONTENT" > ~/.config/rclone/rclone.conf

    chmod 600 ~/.config/rclone/rclone.conf

    echo "rclone config restored."
else
    echo "No rclone config secret found."
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