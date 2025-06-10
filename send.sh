#!/bin/bash

echo 'Starting database backup dump send to preprod';
. ./variables.sh
. ./.passwords.sh
sh ./start_timestamp.sh

echo 'Adding ssh-key to keychain';
eval $(ssh-agent)
ssh-add ~/.ssh/id_ed25519
ssh-add -l
echo 'Identity added';

echo 'Copying dump to preprod';
scp $LAST_DUMP_PATH $PREPROD_USER@$PREPROD_IP:~/dump.sql.gz
echo 'Dump copied';

sh ./end_timestamp.sh
exit
