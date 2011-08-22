#!/bin/bash

CO=`git checkout gh-pages`
if [ "$?" -eq "0" ]; then
  rm -rf ./*
	echo -e "\n>> Copying files from output gh-pages..."
	cp -r ../Le-Torte-di-Chiara-output-ghpages/* ./
	git status
	echo -e "\n>> Synch ghpages..."
	git add .
  git commit -a -m 'Update project'
  git push origin gh-pages
	echo -e "\n>>Switch to master..."
	git checkout master
	git status
	exit 0
fi
echo "Can't update gh-pages! Error code: $?"
