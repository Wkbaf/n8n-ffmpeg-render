# Base image từ n8n
FROM n8nio/n8n:latest

# Switch to root để cài gói
USER root

# Cài ffmpeg trong Alpine
RUN apk add --no-cache ffmpeg

# 1. Update repositories
# 2. Install LibreOffice
# 3. Install Java (often required for certain LibreOffice features/plugins)
# 4. Install fonts (essential for document conversion)
RUN apk add --no-cache \
    libreoffice \
    openjdk11-jre \
    ttf-dejavu \
    ttf-liberation \
    font-noto

# Set execution to headless mode (standard for Docker) khi docker run image thì sẽ chạy câu này (set libreoffice chạy ở chế độ headless mode) nhưng nếu
# bật cái này thì nó sẽ chạy đè n8n mà mình chỉ muốn nó chạy khi n8n gọi bằng execute comand. nên không bật câu này
# ENTRYPOINT ["libreoffice", "--headless", "--nologo", "--nofirststartwizard"]

# Quay lại user node (n8n chạy với user node)
USER node
