#!/bin/bash

echo "--------------------------------"
echo "Whisper Codespace Ready"
echo "--------------------------------"

echo "FFmpeg Version:"
ffmpeg -version | head -n 1

echo ""
echo "Rclone Version:"
rclone version | head -n 2

echo ""
echo "Whisper Version:"
python -c "import whisper; print('Whisper Installed Successfully')"

echo ""
echo "If rclone is not configured, run:"
echo "rclone config"