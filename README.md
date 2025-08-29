# n8n with FFmpeg Docker Image

[![Build Status](https://github.com/dhanushreddy291/n8n-with-ffmpeg/actions/workflows/build-and-push.yml/badge.svg)](https://github.com/dhanushreddy291/n8n-with-ffmpeg/actions/workflows/build-and-push.yml)
[![Docker Pulls](https://img.shields.io/docker/pulls/dhanushreddy29/n8n-ffmpeg?style=flat-square)](https://hub.docker.com/r/dhanushreddy29/n8n-ffmpeg)
[![Docker Image Size (amd64)](https://img.shields.io/docker/image-size/dhanushreddy29/n8n-ffmpeg/latest-amd64?style=flat-square&label=amd64)](https://hub.docker.com/r/dhanushreddy29/n8n-ffmpeg)
[![Docker Image Size (arm64)](https://img.shields.io/docker/image-size/dhanushreddy29/n8n-ffmpeg/latest-arm64?style=flat-square&label=arm64)](https://hub.docker.com/r/dhanushreddy29/n8n-ffmpeg)

This repository automatically builds and publishes a Docker image for **n8n** that includes the **FFmpeg** toolkit.

The official n8n Docker image doesn't come with FFmpeg, which is essential for automating workflows that involve video or audio processing. This image solves that by adding FFmpeg to the official base image, ready for your multimedia tasks.

## ✨ Key Features

* **FFmpeg Included**: Execute any FFmpeg command directly from your n8n workflows using the "Execute Command" node.
* **Multi-Arch Support**: The `latest` tag supports both `linux/amd64` (for standard x86 servers) and `linux/arm64` (for Apple Silicon, Raspberry Pi, etc.). Docker automatically pulls the correct version for your system.
* **Always Up-to-Date**: A GitHub Action workflow rebuilds this image weekly, ensuring it always has the latest version of n8n.

## 🚀 How to Use

The image is available on Docker Hub at `dhanushreddy29/n8n-ffmpeg`.

### Docker CLI

You can run the container directly using the `docker run` command. This example forwards port `5678` and mounts a local volume to persist your n8n data.

```sh
docker run -it --rm \
  --name n8n \
  -p 5678:5678 \
  -v ~/.n8n:/home/node/.n8n \
  dhanushreddy29/n8n-ffmpeg:latest
````

### Docker Compose (Recommended)

Using Docker Compose is the recommended way to manage your n8n instance. Create a `docker-compose.yml` file with the following content:

```yaml
services:
  n8n:
    image: dhanushreddy29/n8n-ffmpeg:latest
    container_name: n8n_with_ffmpeg
    restart: unless-stopped
    ports:
      - "5678:5678"
    volumes:
      # This mounts a local directory to persist your n8n data
      - ./n8n_data:/home/node/.n8n
    environment:
      # Optional: Set your timezone to get correct timestamps
      - GENERIC_TIMEZONE=Asia/Kolkata
```

Save the file and run it with:

```sh
docker-compose up -d
```

## 🤖 Build Automation

This image is built automatically using the GitHub Actions workflow defined in `.github/workflows/build-and-push.yml`. The workflow triggers:

1.  On a push to the `main` branch.
2.  On a weekly schedule (every Sunday at midnight UTC).
3.  Manually via `workflow_dispatch`.

The process builds images for both `amd64` and `arm64` and then creates a multi-arch manifest (`latest`) that points to them.
