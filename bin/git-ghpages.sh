#!/bin/bash
CO=`git checkout gh-pages`
if [ "$?" -eq "0" ]; then
  echo "Worked!"
  exit 1
fi
