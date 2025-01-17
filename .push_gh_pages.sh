#!/bin/bash
mkdir out;

GH_REPO="@github.com/stephlocke/RSaturday-proposal.git"

FULL_REPO="https://$GH_TOKEN$GH_REPO"

git config --global user.name "stephs-travis"
git config --global user.email "steph@travis.ci"

R CMD BATCH 'ghgenerate.R'
cp ghgenerate.Rout out

cd out
git init
git add .
git commit -m "deployed to github pages"
git push --force --quiet $FULL_REPO master:gh-pages