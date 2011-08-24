#!/bin/bash

git checkout gh-pages
if [ "$?" -eq "0" ]; then
	echo -e "\nReplacing files from local gh-pages...\n"
	rm -rf ./*
	cp -r ../Le-Torte-di-Chiara-output-ghpages/* ./
	git status
	echo -e "\nAdding changes to commit...\n"
	git add .
  	git commit -a -m 'rake gh-pages:update'
	echo -e "\nCommitting changes on gh-pages branch...\n"
  	git push origin gh-pages
	echo -e "\nSwitching to master branch..."
	git checkout master
	git status
	exit 0
fi
echo "Can't update gh-pages! Error code: $?"
