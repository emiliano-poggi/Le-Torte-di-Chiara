#!/bin/bash

echo -e "\nSwitching to master branch...\n"
git checkout master
git status
echo -e "\nAdding changes to commit...\n"
git add .
git commit -a -m 'rake master:update'
git status
echo -e "\nCommitting changes on master branch...\n"
git push origin master
