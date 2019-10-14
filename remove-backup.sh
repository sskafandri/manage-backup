#!/bin/bash

for i in `ls /var/cpanel/users/`;do
  for f in `ls /home/$i/backup*.tar.gz`;do
    BACKUP_CREATED=$(date -r "$f" +"%s")

    if [ $BACKUP_CREATED -lt $(date -d -"7 days" +"%s") ]
    then
      ls -l $f >> /home/$i/backup_removed
      rm -f $f
    fi
  done
done

#atau bisa juga pakai ini, tp recursive, jadi ga hanya di dalam home dir saja


for i in `ls /var/cpanel/users/`; do
  find /home/$i/ -name "backup*.tar.gz" -mtime +7 -delete
done
