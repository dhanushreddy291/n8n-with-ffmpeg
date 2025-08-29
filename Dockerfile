FROM n8nio/n8n:latest
USER root
RUN apk add --update ffmpeg
USER node
