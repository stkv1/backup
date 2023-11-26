#!/bin/bash
# Переменная даты-времени для подстановки в лог
current_date_time="`date +%Y-%m-%d\ %H:%M:%S`";
log_path="/var/log/syslog";

rsync /home/stanislav /tmp/backup/ -a -c --update --delete --exclude ".*"
exit_code=$?

if  [ $exit_code -eq 0 ]; then 
        echo $current_date_time "Backup completed succesfully" >> $log_path
else
        echo $current_date_time "Backup failed!" >&2 >> $log_path
fi;
