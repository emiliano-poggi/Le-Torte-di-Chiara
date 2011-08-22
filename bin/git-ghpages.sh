#!/bin/bash
CO=`git checkout gh-pages`
if [ "$?" -eq "0" ]; then
  git checkout master
  git add .
  git commit -a -m 'Update project'
  git push origin master  echo "Worked!"
  exit 0
fi
echo "Can't update gh-pages! Error code: $?"
