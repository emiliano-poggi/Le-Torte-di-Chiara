#!/bin/bash

git checkout master
git status
echo -e "\n>> Synch master..."
git add .
git commit -a -m 'Update project'
git status
git push origin master
