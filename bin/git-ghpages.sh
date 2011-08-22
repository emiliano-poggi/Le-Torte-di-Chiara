#!/bin/bash
git checkout gh-pages
cp -r ../Le-Torte-di-Chiara-output-ghpages/* ./
git add .
git commit -a -m 'Update ghpages'
git push origin gh-pages
git checkout master
