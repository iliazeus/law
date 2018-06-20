#!/bin/bash

cd /tmp
git clone https://${GH_OAUTH_TOKEN}@github.com/${GH_USER_NAME}/${GH_PROJECT_NAME} gh-pages 2>&1
cd gh-pages

git checkout gh-pages
cp ${TRAVIS_BUILD_DIR}/*.html .

git add -A
git commit -m "Build gh-pages from:" -m "$(git log --oneline master | head -n 1)"
git push https://${GH_OAUTH_TOKEN}@github.com/${GH_USER_NAME}/${GH_PROJECT_NAME} 2>&1

