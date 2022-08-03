#!/bin/sh

set -ex 

git clone my-rw-git-repo updated-gist

cd updated-gist
echo $(date) > bumpme

git config --global user.email "ruan.ru.bekker@gmail.com"
git config --global user.name "Ruan Bekker"

git add .
git commit -m "Bumped date"
