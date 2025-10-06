# Base image từ n8n
FROM n8nio/n8n:latest

# Cài ffmpeg
USER root
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    rm -rf /var/lib/apt/lists/*

# Quay lại user n8n
USER node
