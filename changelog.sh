#!/bin/bash -el

nvm install 10
nvm use 10

git reset --hard # remove the credential
git config user.email 'builds@travis-ci.com' && \
git config user.name 'Travis CI' && \
npx standard-version --commit-all --message $'chore: %s\n\n[skip changelog]' --no-verify && \
git push --follow-tags origin https://${GH_TOKEN}@github.com/${TRAVIS_REPO_SLUG} master > /dev/null 2>&1
