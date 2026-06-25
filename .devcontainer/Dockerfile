FROM mcr.microsoft.com/devcontainers/python:3.11

# Update packages
RUN apt-get update && apt-get upgrade -y

# Install system packages
RUN apt-get install -y \
    ffmpeg \
    rclone

# Upgrade pip
RUN python -m pip install --upgrade pip

# Install Python packages
RUN pip install openai-whisper