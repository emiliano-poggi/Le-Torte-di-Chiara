#!/bin/bash
CO=`git checkout gh-pages`
if [ "$?" -eq "0" ]; then
  git add .
  git commit -a -m 'Update project'
  git push origin gh-pages
	git checkout master	
	exit 0
fi
echo "Can't update gh-pages! Error code: $?"
