# Backup scripts for MySql applications

## Prerequisites

* You need to have `mysql` CLI installed on the machine and `mysqldump` command available
* You need to have `ssh` setup to use `scp` command

## Setup

### Clone

* `mkdir dumps`
* `git clone git@github.com:re-connect/backup.git`
* `cd backup`
* `touch ./.passwords.sh`

### Generate a ssh keypair on the prod machine

* `ssh-keygen -f ~/.ssh/id_ed25519 -t ed25519 -C "admin@prod.fr" -N ''`

### Add the ssh public key to the preprod machine

* Copy the content of prod `~/.ssh/id_ed25519.pub` file
* Into `~/.ssh/authorized_keys`

### 

Then, Hydrate password.sh with the following values

#### For Preprod : 

* MYSQL_PREPROD_DB
* MYSQL_PREPROD_PASSWORD
* MYSQL_PREPROD_USER
* MYSQL_PREPROD_HOST

#### For Prod : 

* MYSQL_PASSWORD
* MYSQL_USER
* MYSQL_DB
* MYSQL_HOST
* PREPROD_USER
* PREPROD_IP
