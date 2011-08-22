#!/bin/bash

git checkout master
git add .
git checkout config.yaml
git commit -a -m 'Update project'
git push origin master
