#!/bin/bash

SOURCE_BRANCH="cn"

if [ "$TRAVIS_PULL_REQUEST" != "false" -o "$TRAVIS_BRANCH" != "$SOURCE_BRANCH" ]; then
    echo "Skipping deploy; just doing a build"
    npm run build
    exit 0
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

git config --global user.name "Travis CI"
git config --global user.email "ci@travis-ci.org"
git remote set-url origin git@github.com:docschina/ecma262.git


openssl aes-256-cbc -K $encrypted_37575234dd3c_key -iv $encrypted_37575234dd3c_iv -in ./deploy_key.enc -out ./deploy_key -d
chmod 600 ./deploy_key
eval `ssh-agent -s`
ssh-add ./deploy_key

# Update the content from the `gh-pages` branch

$(npm bin)/update-branch --commands "npm run build" \
                         --commit-message "Update gh-pages [skip ci]" \
                         --directory "out" \
                         --distribution-branch "gh-pages" \
                         --source-branch "master"
