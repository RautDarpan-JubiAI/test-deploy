#!/bin/bash
set -e

### Configuration ###

APP_DIR=/var/www/app
GIT_URL=https://RautDarpan-JubiAI:9405707315darpan@github.com/JubiAi/test-deploy.git
APP_NAME=test-app
APP_START_FILENAME=index.js
RESTART_ARGS=

### Automation steps ###

set -x

# Pull latest code
if [[ -e $APP_DIR ]]; then
  cd $APP_DIR
  git pull
  # Restart app
  sudo pm2 restart 
else
  git clone $GIT_URL 
  cd $APP_DIR
  sudo pm2 start $APP_START_FILENAME --name $APP_NAME
fi

# Install dependencies
npm install --production
npm prune --production

