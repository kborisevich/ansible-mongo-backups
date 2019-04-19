#!/bin/sh

echo "${CRON_TIME} /usr/sbin/backupMongo.sh >> /mongo_backup.log 2>&1" > /crontab.conf
crontab /crontab.conf
echo "=> Running cron job"
touch /mongo_backup.log
/usr/sbin/backupMongo.sh >> /mongo_backup.log 2>&1
cron && tail -f /mongo_backup.log
