#!/bin/bash
VERSION=0.1.0b
echo "plathome application ver${VERSION}"


if [ $# -ne 1 ]; then
  echo "you putted arg $#" 1>&2
  echo "but this script need 1 arg" 1>&2
  exit 1
fi






## frontend-checking
echo "checking frontend folder..."

if [ -e ./plathome-frontend ]; then
  echo "plathome-frontend folder found."
else
  echo "plathome-frontend folder not found."
  echo "fetching plathome-frontend..."
  git clone https://github.com/reud/plathome-frontend.git
  echo "git clone finished"
  # 存在しない場合
fi

echo "checking git folder..."
cd plathome-frontend || { echo "move plathome-frontend failed" && exit 1; }
STATUS=`git status`

FATALGITSTATUS="fatal: not a git repository (or any of the parent directories): .git"
if [ "$STATUS" == "$FATALGITSTATUS" ]; then
  echo "error: git status failed"
  exit 1
fi

git pull

cd ..
## backend-checking
echo "checking backend folder..."

if [ -e ./plathome-backend ]; then
  echo "plathome-backend folder found."
else
  echo "plathome-backend folder not found."
  echo "fetching plathome-backend..."
  git clone https://github.com/reud/plathome-backend.git
  echo "git clone finished"
  # 存在しない場合
fi

echo "checking git status."
cd plathome-backend || { echo "move plathome-backend failed" && exit 1; }
STATUS=`git status`


if [ "$STATUS" == "$FATALGITSTATUS" ]; then
  echo "error: git status failed"
  exit 1
fi
git pull

cd ..


ENV="BASEURL=http://${1}:8080/"
cd plathome-frontend || { echo "move plathome-frontend failed" && exit 1; }
# SETUP .env for plathome-frontend
if [ -e ./.env ]; then
  CAT_ENV=`cat .env`
  if [ "$CAT_ENV" == "$ENV" ]; then
  echo "env found"

  else
    echo ".env corrupted. deleting .env ..."
    rm .env
    echo $ENV > .env
  fi
else
  echo "creating .env ..."
  echo $ENV > .env
fi
cd ..



# Starting Docker Compose...
echo "docker-compose start"
docker-compose -f dev-docker-compose.yml build
docker-compose  -f dev-docker-compose.yml up -d
