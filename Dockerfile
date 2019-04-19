FROM mongo

RUN apt-get update && apt-get -y install cron s3cmd

ENV CRON_TIME="0 0 * * *"

ADD backupMongo.sh /usr/sbin/backupMongo.sh
CMD /usr/sbin/backupMongo.sh