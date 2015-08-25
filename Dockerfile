FROM borja/dockup

RUN apt-get update && apt-get install -y python-pip
RUN pip install --upgrade awscli

RUN aws configure set default.s3.signature_version s3v4

ADD backup.sh /backup.sh
ADD restore.sh /restore.sh
ADD run.sh /run.sh

RUN chmod 755 /*.sh

CMD ["/run.sh"]
