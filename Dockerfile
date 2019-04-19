FROM mongo

RUN apt-get update && apt-get -y install cron s3cmd

ENV CRON_TIME="0 0 * * *"

ADD backupMongo.sh /usr/sbin/backupMongo.sh
ADD run.sh /usr/sbin/run.sh
RUN ["chmod", "+x", "/usr/sbin/backupMongo.sh"]
RUN ["chmod", "+x", "/usr/sbin/run.sh"]
CMD /usr/sbin/run.sh
