#!/bin/bash

#list all .tar.gz file which are modified more that 7 days ago (exist more that 7 days)
#then the output is saved on list_backup file
for i in `ls /var/cpanel/users`; do 
    echo "username:"$i
    find /home/$i/ -name "*.tar.gz" -mtime +7 -ls
    echo "===================="
done>list_backup

