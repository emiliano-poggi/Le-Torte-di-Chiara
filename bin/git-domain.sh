#!/bin/bash

echo -e "\n__Switching to master branch...\n"
git checkout master
git status
echo -e "\n__Adding changes to commit...\n"
git add .
git commit -a -m 'rake master:update'
git status
echo -e "\n__Committing changes on master branch...\n"
git push origin master
