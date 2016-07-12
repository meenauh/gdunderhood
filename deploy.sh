#!/bin/bash
set -e

echo "set git environment"
git config user.email "meenauh@gmail.com"
git config user.name "meenauh"
git remote rm origin
git remote add origin https://meenauh:${GITHUB_TOKEN}@github.com/meenauh/gdunderhood.git
git checkout master

echo "run update"
babel-node update

echo "save dump"
git add --all dump
git commit -m $'save dump\n\n[ci skip]'
git push origin master &>/dev/null

echo "build'n'deploy"
npm run deploy
