FROM ubuntu:latest
MAINTAINER Rich "rich@rich0.org"
# Forked from Firespring's original dockerfile"

RUN apt-get update
RUN apt-get --yes upgrade
RUN apt-get --yes install python3 curl unzip

# install latest awscli and clean up

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
	unzip awscliv2.zip && \
	./aws/install

RUN aws --version

ENV AWS_DEFAULT_REGION=us-west-2 \
    AWS_ACCESS_KEY_ID='' \
    AWS_SECRET_ACCESS_KEY='' \
    AWS_SESSION_TOKEN='' \
    AWS_OPTIONS='' \
    AWS_SYNC_OPTIONS='' \
    SOURCE_LOCATION='/directory' \
    DEST_LOCATION='s3://bucket' \
    SYNC_PERIOD=0

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["aws $AWS_OPTIONS s3 sync $AWS_SYNC_OPTIONS $SOURCE_LOCATION $DEST_LOCATION"]
