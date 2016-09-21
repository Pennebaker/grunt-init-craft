#! /bin/bash
DB_NAME="PROJECT_cmsdb_dev"
LATEST="./cms-latest-backup.sql"

# Detect paths
MYSQL=$(which mysql)
AWK=$(which awk)
GREP=$(which grep)


# We need to drop all tables incase there are extras tables existing that are not going to be removed by restoring a backup
TABLES=$($MYSQL -u 'root' $DB_NAME -e 'show tables' | $AWK '{ print $1}' | $GREP -v '^Tables' )
for t in $TABLES
do
	$MYSQL -u 'root' $DB_NAME -e "SET FOREIGN_KEY_CHECKS=0;drop table $t"
done

# Ask the user which DB they want to restore.
database_imported="False"
while [[ ${database_imported} == "False" ]]; do
  files=($(find -E . -type f -regex "^./backup/.*$"))
  i=0
  for item in ${files[*]}
  do
    printf "   [%d] %s\n" $i $item
    ((i++))
  done
  printf " * [%d] %s\n" $i $LATEST

  echo "Restore which backup?"
  read Choice

  # If input was empty default to latest backup
  if [ -z ${Choice} ]; then
    Choice=${i}
  fi

  # if input == length of backup files list they must've picked latest
  if [ "${Choice}" -eq "${#files[@]}" ]; then
    mysql -uroot $DB_NAME < $LATEST
    database_imported="True"
  # else import the user choice
  else
    # Check if user selected something outside of index range
    if [ "${Choice}" -gt "${#files[@]}" ]; then
      echo 'Please choose a number from the list.'
    else
      mysql -uroot $DB_NAME < ${files[$Choice]}
      database_imported="True"
    fi
  fi
done
