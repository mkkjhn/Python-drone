#!/bin/sh

# This script assumes that there is a git checkout in the current directory under "workspace-repo".
# Inside, a directory called "samples/" contains the input data for the string extraction.

# This repository will be cloned to "updated-workspace-repo", with the extracted strings in the "found-strings.txt" file at the root of the repository.

set -e
set -x
set -u

git clone workspace-repo updated-workspace-repo
cd updated-workspace-repo
git config user.email "robots@example.com"
git config user.name "$0"
strings samples/* > found-strings.txt
git add found-strings.txt
git commit -a -m "extracted strings from samples"
