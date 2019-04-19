#!/bin/sh

TIMESTAMP=`/bin/date +"%Y%m%dT%H%M%S"`
BACKUP_NAME=${TIMESTAMP}.dump.gz
S3_BACKUP=s3://${S3_BUCKET}/${BACKUP_NAME}
S3_LATEST=s3://${S3_BUCKET}/latest.dump.gz
S3_CREDENTIALS="--access_key=${S3_ACCESS_KEY} --secret_key=${S3_SECRET_KEY}"
echo "=> Backup started"
if mongodump --uri ${MONGO_CONNECTION_STRING} --archive=${BACKUP_NAME} --gzip && \
    s3cmd put ${BACKUP_NAME} ${S3_BACKUP} ${S3_CREDENTIALS} && \
    s3cmd cp ${S3_BACKUP} ${S3_LATEST} ${S3_CREDENTIALS} && \
    rm ${BACKUP_NAME};
then
    echo "   > Backup succeeded"
else
    echo "   > Backup failed"
fi
echo "=> Done"
