FROM borja/dockup

ADD backup.sh /backup.sh
ADD restore.sh /restore.sh

RUN chmod 755 /*.sh

RUN apt-get update && apt-get install -y awscli

CMD ["/run.sh"]
