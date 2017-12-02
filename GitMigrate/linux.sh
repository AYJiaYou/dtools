#!/bin/bash

echo "dt-git-migrate: migrate a local git repo to a new remote server"
echo "lfree 2017-11-15 14:37"
echo 


echo "1) fetch all info from remote origin:"
git pull
git fetch origin
echo "OK"
echo 

echo "2) make sure all the remote branches have been checked out locally:"
git branch -a
read -p "Is that OK? [Y,n] " OK
if [[ $OK == "Y" ]]; then
    echo "got it!"
    git checkout master
else
    exit 0
fi
echo

echo "3) push local repo to a new remote server:"
read -p "Input the new repo url: " URL
echo "    $URL"
read -p "Is that right? [Y,n] " OK
if [[ $OK == "Y" ]]; then
    echo "got it!"
else
    exit 0
fi
git remote add new-origin $URL
git push --all new-origin
if [ $? != 0 ]; then
    exit 0
fi
git push --tags new-origin
if [ $? != 0 ]; then
    exit 0
fi
echo "OK"
echo

echo "4) change local repo to track the new remote server:"
git remote rm origin
git remote rename new-origin origin
git branch --set-upstream-to=origin/master master
echo "OK"
echo
