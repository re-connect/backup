#!/bin/bash

# General
CURRENT_DATE=$(date +%Y-%m-%d);
export CURRENT_MONTH=$(date +%m-%Y);

# Folders
export BACKUP_FOLDER=$HOME'/backup';

# Dumps
DUMPS_FOLDER=$HOME'/dumps';
export MONTHLY_BACKUP_FOLDER=$DUMPS_FOLDER'/monthly';
export YEARLY_BACKUP_FOLDER=$DUMPS_FOLDER'/yearly';
DUMP_FILE_NAME=$(printf "backup_dump_%s.sql" "$CURRENT_DATE");
export DUMP_FILE_PATH="$DUMPS_FOLDER/$DUMP_FILE_NAME";

LAST_DUMP_NAME='';
if [ -d "$DUMPS_FOLDER" ]; then
    LAST_DUMP_NAME=$(ls -t "$DUMPS_FOLDER"/ | head -1);
fi
export LAST_DUMP_PATH=$DUMPS_FOLDER/$LAST_DUMP_NAME;

# MySql
export MYSQL_PORT=3306;
