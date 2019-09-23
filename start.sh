#!/bin/bash
VERSION=0.1.0b
echo "plathome application ver${VERSION}"

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
cd plathome-frontend
STATUS=`git status`

FATALGITSTATUS="fatal: not a git repository (or any of the parent directories): .git"
if [ "$STATUS" == "$FATALGITSTATUS" ]; then
  echo "error: git status failed"
  exit 1
fi

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
cd plathome-backend
STATUS=`git status`


FATALGITSTATUS="fatal: not a git repository (or any of the parent directories): .git"
if [ "$STATUS" == "$FATALGITSTATUS" ]; then
  echo "error: git status failed"
  exit 1
fi

cd ..

# WIP: Docker