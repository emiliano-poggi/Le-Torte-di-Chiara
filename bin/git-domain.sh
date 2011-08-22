#!/bin/bash

git checkout master
git status
git add .
git commit -a -m 'Update project'
git status
git push origin master
