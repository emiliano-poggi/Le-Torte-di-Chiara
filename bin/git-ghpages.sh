#!/bin/bash
CO=`git checkout gh-pages`
if [ "$?" -eq "0" ]; then
  echo "Copying files from output gh-pages..."
	cp -r ../Le-Torte-di-Chiara-output-ghpages/* ./
	echo "Synch repo..."
	git add .
  git commit -a -m 'Update project'
  git push origin gh-pages
	git checkout master	
	exit 0
fi
echo "Can't update gh-pages! Error code: $?"
