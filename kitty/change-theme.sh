#!/bin/bash

usage() {
    echo "Usage: ./change-theme.sh [
        -t [$ theme name] : give the name of the theme to change to
    ]"
    exit 0
}

if [ $PWD != "/home/$USER/.config/kitty" ]; then
    echo "Error: Must be inside .config/kitty"
    exit 1
fi

theme_name=""
while getopts t: opt; do
    case "${opt}" in
        t)
            theme_name=$OPTARG
            ;;
        *)
            usage
            ;;
    esac
done

if [ -z $theme_name ]; then
    if [ -z $1 ]; then
        echo "Error: Theme name not given"
        exit 1
    fi
    theme_name=$1
fi

original_file="kitty-themes/themes/$theme_name.conf"
if [ ! -f "$original_file" ]; then
    echo "Error: Theme file not found: $original_file"
fi

rm -f theme.conf
ln -s kitty-themes/themes/$theme_name.conf theme.conf

exit 0
