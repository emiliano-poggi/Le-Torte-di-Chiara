#!/bin/bash

git checkout gh-pages
if [ "$?" -eq "0" ]; then
	echo -e "\n__Replacing files from local gh-pages...\n"
	rm -rf ./*
	cp -r ../Le-Torte-di-Chiara-output-ghpages/* ./
	git status
	echo -e "\n__Adding changes to commit...\n"
	git add .
  	git commit -a -m 'rake gh-pages:update'
	echo -e "\n__Committing changes on gh-pages branch...\n"
  	git push origin gh-pages
	echo -e "\n__Switching to master branch..."
	git checkout master
	git status
	exit 0
fi
echo "Can't update gh-pages! Error code: $?"
