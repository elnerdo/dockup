FROM borja/dockup

ADD backup.sh /backup.sh
ADD restore.sh /restore.sh

RUN chmod 755 /*.sh

RUN apt-get update && apt-get install -y python-pip
RUN pip install --upgrade awscli

RUN aws configure set default.s3.signature_version s3v4

CMD ["/run.sh"]
