#!/bin/sh

# Commit in Branch: Check if specified commit is in current Git branch.
#
# Usage: ./cib.sh <commit>

current_branch=$(git symbolic-ref --short HEAD)
commit=$1

if git merge-base --is-ancestor $commit HEAD; then
    echo "$current_branch contains $commit"
else
    echo "$current_branch does NOT contain $commit"
fi

