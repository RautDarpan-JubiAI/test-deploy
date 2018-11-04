#!/bin/bash
set -e$'\r'

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

if [[ "$KEYFILE" != "" ]]; then
  KEYARG="-i $KEYFILE"
else
  KEYARG=
fi

run scp -i id_rsa ./work.sh $SERVER:$REMOTE_SCRIPT_PATH
echo
echo "---- Running deployment script on remote server ----"
run ssh -i id_rsa $SERVER bash $REMOTE_SCRIPT_PATH