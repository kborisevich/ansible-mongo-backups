# mongo-backups

Playbook creates docker container on host which runs mongodump to backup data using cronjob to an s3 bucket.

## Usage

You should fill hosts and missed variables in playbook.yml and play it with ansible:
```
ansible-playbook playbook.yml
```

## Parameters

`MONGO_CONNECTION_STRING` - your mongo URI to connect to mongo database

`S3_SECRET_KEY` - your access key id for s3 bucket

`S3_ACCESS_KEY` - your secret access key for s3 bucket

`S3_BUCKET` - your s3 bucket

## License

BSD
