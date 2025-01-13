#!/bin/bash

usage() {
    echo "Usage: ./ghclone.sh [
        { -r [$ username/repo_name ] | [$ username/repo_name ] }: specify the repository to clone
    ]"
    exit 0
}

repo_name=""
while getopts hr: opt; do
    case "${opt}" in
        t)
            repo_name=$OPTARG
            ;;
        *)
            usage
            ;;
    esac
done

if [ -z $repo_name ]; then
    if [ -z $1 ]; then
        echo "Error: Repository name not given"
        exit 1
    fi
    repo_name=$1
fi

git clone "https://github.com/$repo_name.git"

exit 0
