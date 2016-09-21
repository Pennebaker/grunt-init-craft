#! /bin/bash
DB_NAME="PROJECT_cmsdb_dev"
PREFIX=`date +%Y%m%d-%H%M-`

# Detect paths
MYSQLDUMP=$(which mysqldump)

FILE="cms.sql"
LATEST="cms-latest-backup.sql"

echo "Who is this?"
read NAME

NAME=`echo $NAME | tr "[:upper:]" "[:lower:]"`

rm $LATEST
$MYSQLDUMP -uroot $DB_NAME >> $LATEST
mkdir -p backup
cp $LATEST backup/$PREFIX$NAME-$FILE
