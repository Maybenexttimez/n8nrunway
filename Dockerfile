FROM docker.n8n.io/n8nio/n8n:latest
USER root

# Используем apt-get вместо apk для установки ffmpeg и curl
RUN apt-get update && apt-get install -y ffmpeg curl && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n
USER node
