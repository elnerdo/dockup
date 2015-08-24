FROM borja/dockup

ADD backup.sh /backup.sh
ADD restore.sh /restore.sh

RUN chmod 755 /*.sh

CMD ["/run.sh"]
