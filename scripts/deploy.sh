#!/bin/bash

SOURCE_BRANCH="master"

if [ "$TRAVIS_PULL_REQUEST" != "false" ] || [ "$TRAVIS_BRANCH" != "$SOURCE_BRANCH" ]
then
    echo "Skipping deploy; just doing a build"
    npm run build
    exit 0
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
npm run build

git config --global user.name "Travis CI"
git config --global user.email "ci@travis-ci.org"
git remote set-url origin git@github.com:docschina/ecma262.git


openssl aes-256-cbc -K $encrypted_37575234dd3c_key -iv $encrypted_37575234dd3c_iv -in scripts/deploy_key.enc -out scripts/deploy_key -d
chmod 600 scripts/deploy_key
eval `ssh-agent -s`
ssh-add scripts/deploy_key

# Update the content from the `gh-pages` branch

chmod -R 777 node_modules/gh-pages/
npm run deploy
