# Base image từ n8n
FROM n8nio/n8n:latest

# Switch to root để cài gói
USER root

# Cài ffmpeg trong Alpine
RUN apk add --no-cache ffmpeg

# Quay lại user node (n8n chạy với user node)
USER node
