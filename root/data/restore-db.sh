#! /bin/bash
db_name="{%= domain_name %}_cmsdb_dev"
latest="./cms-latest-backup.sql"

database_imported="False"
while [[ ${database_imported} == "False" ]]; do
  files=($(find -E . -type f -regex "^./backup/.*$"))
  i=0
  for item in ${files[*]}
  do
    printf "   [%d] %s\n" $i $item
    ((i++))
  done
  printf " * [%d] %s\n" $i $latest

  echo "Restore which backup?"
  read Choice

  # If input was empty default to latest backup
  if [ -z ${Choice} ]; then
    Choice=${i}
  fi

  # if input == length of backup files list they must've picked latest
  if [ "${Choice}" -eq "${#files[@]}" ]; then
    mysql -uroot $db_name < $latest
    database_imported="True"
  # else import the user choice
  else
    # Check if user selected something outside of index range
    if [ "${Choice}" -gt "${#files[@]}" ]; then
      echo 'Please choose a number from the list.'
    else
      db_exists=`mysql -u root --skip-column-names -e "show databases like '$db_name'"`
      if [ "$db_exists" != "$db_name" ]; then
        mysql -u root -e "create database $db_name character set UTF8 collate utf8_bin"
      fi
      mysql -uroot $db_name < ${files[$Choice]}
      database_imported="True"
    fi
  fi
done
