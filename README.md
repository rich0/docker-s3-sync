# docker-s3-sync
A lightweight container which synchronizes a directory or s3 bucket with a directory or s3 bucket at a specified interval.

### Configuration Options:
##### AWS_DEFAULT_REGION (default: us-west-2)
The region of the destination bucket

##### AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN
You know the drill

##### AWS_OPTIONS
Options passed after the `aws` part of the command

##### AWS_SYNC_OPTIONS
Options passed after the `sync` part of the command

##### SOURCE_LOCATION
Either a directory or an s3 bucket (e.g. /foo or s3://foo)

##### DEST_LOCATION
Either a directory or an s3 bucket (e.g. /bar or s3://bar)

##### SYNC_PERIOD (default: 0)
The length of seconds to wait before running the sync command again. Set this value to 0 to turn off this functionality.

ENTRYPOINT ["/entrypoint.sh"]
CMD ["aws $AWS_OPTIONS s3 sync $AWS_SYNC_OPTIONS $SOURCE_LOCATION $DEST_LOCATION"]


### Usage examples:
##### Sync a local folder to an s3 bucket
`docker run -ti \
  -e AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY \
  -e AWS_SESSION_TOKEN \
  -e SOURCE_LOCATION=/foo \
  -e DEST_LOCATION=s3:/foo \
  firespring/s3-sync`


