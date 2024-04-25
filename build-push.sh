#!/bin/bash
#docker build . --pull --no-cache --tag ghcr.io/rich0/docker-s3-sync:latest && docker push ghcr.io/rich0/docker-s3-sync:latest
docker build . --pull --tag ghcr.io/rich0/docker-s3-sync:latest && docker push ghcr.io/rich0/docker-s3-sync:latest




