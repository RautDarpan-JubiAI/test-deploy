#!/bin/bash
set -e

### Configuration ###

SERVER=ubuntu@129.213.21.4
APP_DIR=/var/www/app
KEYFILE=id_rsa
REMOTE_SCRIPT_PATH=/tmp/deploy-myapp.sh


### Library ###

function run()
{
  echo "Running: $@"
  "$@"
}


### Automation steps ###
run scp $KEYARG ./work.sh $SERVER:$REMOTE_SCRIPT_PATH
echo
echo "---- Running deployment script on remote server ----"
run ssh -i $KEYARG $SERVER bash $REMOTE_SCRIPT_PATH