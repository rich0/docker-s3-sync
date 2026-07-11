#!/bin/bash
set -euo pipefail

IMAGE=registry.rich0.org/public/docker-s3-sync

docker build . --pull --no-cache --tag "${IMAGE}:latest"
docker push "${IMAGE}:latest"
