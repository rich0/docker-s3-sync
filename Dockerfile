FROM alpine:latest
MAINTAINER Rich "rich@rich0.org"
# Forked from Firespring's original dockerfile"

RUN apk add --update s3cmd && \
    rm -rf /var/cache/apk/*

ENV AWS_DEFAULT_REGION=us-west-2 \
    AWS_ACCESS_KEY_ID='' \
    AWS_SECRET_ACCESS_KEY='' \
    AWS_SESSION_TOKEN='' \
    S3CMD_OPTIONS='' \
    S3CMD_SYNC_OPTIONS='' \
    SOURCE_LOCATION='/directory' \
    DEST_LOCATION='s3://bucket' \
    SYNC_PERIOD=0

CMD s3cmd $S3CMD_OPTIONS sync $S3CMD_SYNC_OPTIONS $SOURCE_LOCATION $DEST_LOCATION

