# docker-s3-sync
A lightweight container which synchronizes a directory or s3 bucket with a directory or s3 bucket.

Forked from https://github.com/firespring/docker-s3-sync

### Configuration Options:
##### AWS_DEFAULT_REGION (default: us-west-2)
The region of the destination bucket

##### AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN
You know the drill

##### S3CMD_OPTIONS
Options passed after the `s3cmd` part of the command

##### S3CMD_SYNC_OPTIONS
Options passed after the `sync` part of the command

##### SOURCE_LOCATION
Either a directory or an s3 bucket (e.g. /foo or s3://foo)

##### DEST_LOCATION
Either a directory or an s3 bucket (e.g. /bar or s3://bar)

CMD s3cmd $S3CMD_OPTIONS sync $S3CMD_SYNC_OPTIONS $SOURCE_LOCATION $DEST_LOCATION


