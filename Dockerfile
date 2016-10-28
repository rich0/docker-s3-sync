FROM alpine:latest
MAINTAINER Firespring "info.dev@firespring.com"

RUN apk add --update curl python unzip && \
    rm -rf /var/cache/apk/*

# install latest awscli and clean up
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" \
    && unzip awscli-bundle.zip \
    && ./awscli-bundle/install -i /usr/local/ \
    && rm -rf awscli-bundle/* awscli-bundle.zip

ENV AWS_DEFAULT_REGION us-west-2
ENV AWS_ACCESS_KEY_ID ''
ENV AWS_SECRET_ACCESS_KEY ''
ENV AWS_ENDPOINT ''
ENV SYNC_DIRECTORY '/directory'
ENV SYNC_BUCKET '/bucket'
ENV SYNC_PERIOD 600

CMD while [ true ]; do aws $AWS_ENDPOINT s3 sync $SYNC_DIRECTORY s3://$SYNC_BUCKET/; sleep $SYNC_PERIOD; done;
