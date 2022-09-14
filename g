#!/bin/bash
if [ "$1" == "" ]; then
    if [ "$(find-git-root)" == "$(pwd)" ] && [ ! -e ".git" ]; then
        echo "error: Not a git repo".
        exit
    fi
    git status -sb
else
    grep --color=auto --line-buffered "$@" | less -RSFX
fi

