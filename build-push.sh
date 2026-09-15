#!/bin/bash
set -euo pipefail

IMAGE=registry.rich0.org/public/docker-s3-sync
VERSION=1.0.0

#regctl image copy  "${IMAGE}:latest" "${IMAGE}:previous"
docker build . --pull --no-cache --tag "${IMAGE}:latest" --tag "${IMAGE}:${VERSION}"
docker push "${IMAGE}:latest"
docker push "${IMAGE}:${VERSION}"
