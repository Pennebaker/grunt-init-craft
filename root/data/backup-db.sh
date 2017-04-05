#! /bin/bash
PREFIX=`date +%Y%m%d-%H%M-`

FILE="cms.sql"
LATEST="cms-latest-backup.sql"

echo "Who is this?"
read NAME

NAME=`echo $NAME | tr "[:upper:]" "[:lower:]"`

rm $LATEST
mysqldump -uroot PROJECT_cmsdb_dev >> $LATEST
mkdir backup
cp $LATEST backup/$PREFIX$NAME-$FILE
