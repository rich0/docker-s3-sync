FROM alpine:latest
MAINTAINER Firespring "info.dev@firespring.com"

RUN apk add --update curl python unzip && \
    rm -rf /var/cache/apk/*

# install latest awscli and clean up
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" \
    && unzip awscli-bundle.zip \
    && ./awscli-bundle/install -i /usr/local/ \
    && rm -rf awscli-bundle/* awscli-bundle.zip

COPY entrypoint.sh /entrypoint.sh

ENV AWS_DEFAULT_REGION us-west-2
ENV AWS_ACCESS_KEY_ID ''
ENV AWS_SECRET_ACCESS_KEY ''
ENV AWS_OPTIONS ''
ENV AWS_SYNC_OPTIONS ''
ENV SOURCE_LOCATION '/directory'
ENV DEST_LOCATION '/bucket'
ENV SYNC_PERIOD 600

ENTRYPOINT ["/entrypoint.sh"]
CMD ["aws $AWS_OPTIONS s3 sync $AWS_SYNC_OPTIONS $SOURCE_LOCATION $DEST_LOCATION"]
