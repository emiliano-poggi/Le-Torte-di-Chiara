#!/bin/bash

echo -e "\nSwitching to master branch...\n"
git checkout master
git status
echo -e "\nCommitting changes...\n"
git add .
git commit -a -m 'rake master:update'
git status
echo -e "\nSynchronizing master branch...\n"
git push origin master
