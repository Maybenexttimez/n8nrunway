# Шаг 1: Берем технический образ с готовым статичным ffmpeg
FROM mwader/static-ffmpeg:latest AS ffmpeg

# Шаг 2: Берем твой n8n
FROM docker.n8n.io/n8nio/n8n:latest
USER root

# Копируем бинарники ffmpeg и ffprobe прямо в твою систему
COPY --from=ffmpeg /ffmpeg /usr/local/bin/
COPY --from=ffmpeg /ffprobe /usr/local/bin/

# Настраиваем права папок
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n
USER node
