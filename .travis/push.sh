#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_update() {
  git checkout -b emma-deploy
  echo "Travis build: $TRAVIS_BUILD_NUMBER" >  image-updated.txt  
  git add .
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

push_update() {
  git remote add origin-pages https://${GH_TOKEN}@github.com/juliankamil/emma-deploy.git > /dev/null 2>&1
  git push --quiet --set-upstream emma-deploy
}

setup_git
commit_update
push_update
