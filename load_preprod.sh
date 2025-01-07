#!/bin/bash

echo 'Starting database backup dump load';
. ./variables.sh
. ./.passwords.sh
sh ./start_timestamp.sh

echo 'Loading dump to preprod database';
cd $HOME/www/current && php ./bin/console doctrine:database:drop --force --env=preprod -n && cd -
cd $HOME/www/current && php ./bin/console doctrine:database:create --env=preprod -n && cd -
mysql --host=$MYSQL_PREPROD_HOST --port=$MYSQL_PORT -u $MYSQL_PREPROD_USER $MYSQL_PREPROD_DB -p$MYSQL_PREPROD_PASSWORD < $HOME/dump.sql;
cd $HOME/www/current && php ./bin/console doctrine:migrations:migrate -n && cd -
echo 'Dump copied';

sh ./end_timestamp.sh
exit
