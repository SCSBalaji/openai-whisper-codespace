FROM mcr.microsoft.com/devcontainers/python:3.11

# Update packages
RUN apt-get update && apt-get upgrade -y

# Install ffmpeg
RUN apt-get install -y ffmpeg

# Install rclone
RUN apt-get install -y rclone

# Upgrade pip
RUN pip install --upgrade pip

# Install Whisper
RUN pip install openai-whisper