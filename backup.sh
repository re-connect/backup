#!/bin/bash

echo 'Starting database backup dump fetch';
. ./variables.sh
. ./.passwords.sh
sh ./start_timestamp.sh

mkdir -p "$DUMPS_FOLDER"
cd "$BACKUP_FOLDER" || exit

echo 'Creating dump';
mysqldump --add-drop-table --host="$MYSQL_HOST" --port="$MYSQL_PORT" -u "$MYSQL_USER" "$MYSQL_DB" -p"$MYSQL_PASSWORD" | gzip > "$DUMP_FILE_PATH";
echo 'Dump created';

sh ./archieve_monthly_and_yearly_dumps.sh
sh ./delete_old_dumps.sh
sh ./end_timestamp.sh
exit
