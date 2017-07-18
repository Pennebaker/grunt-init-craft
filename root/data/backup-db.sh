#! /bin/bash
PREFIX=`date +%Y%m%d-%H%M-`

FILE="cms.sql"
LATEST="cms-latest-backup.sql"

echo "Who is this?"
read NAME

NAME=`echo $NAME | tr "[:upper:]" "[:lower:]"`

rm $LATEST
mysqldump -uroot {%= domain_name %}_cmsdb_dev >> $LATEST
mkdir -p backup
cp $LATEST backup/$PREFIX$NAME-$FILE
