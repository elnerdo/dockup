#!/bin/bash

# Get timestamp
: ${BACKUP_SUFFIX:=.$(date +"%Y-%m-%d-%H-%M-%S")}
readonly tarball=$BACKUP_NAME$BACKUP_SUFFIX.tar.gz

env; mount; $PATHS_TO_BACKUP;

sleep 60

# Create a gzip compressed tarball with the volume(s)
tar czf $tarball $BACKUP_TAR_OPTION $PATHS_TO_BACKUP

# Create bucket, if it doesn't already exist
BUCKET_EXIST=$(aws s3 ls | grep $S3_BUCKET_NAME | wc -l)
if [ $BUCKET_EXIST -eq 0 ]; 
then
  aws s3 mb s3://$S3_BUCKET_NAME --region=$AWS_DEFAULT_REGION
fi

# Upload the backup to S3 with timestamp
aws s3 cp $tarball s3://$S3_BUCKET_NAME/$tarball --region=$AWS_DEFAULT_REGION
