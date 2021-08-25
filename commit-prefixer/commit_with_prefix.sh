#!/bin/bash

config_path="commit_prefix.txt"

commit_flow(){
    #current_prefix=$(<$config_path)
    current_prefix=$(test -f $config_path && cat $config_path || echo "none")
    if [ "$1" == "config" ]; then
        read -p "Enter preferable prefix for commit message ($current_prefix) : " commit_msg
        echo "$commit_msg">"$config_path"
        exit
    fi

    read -p "Enter commit message ($current_prefix): " commit_msg

    git commit -m "$current_prefix: $commit_msg"
}


#Check if file exist
if [ -f "$config_path" ] || [ "$1" == "config" ]; then
    commit_flow $@
else 
    echo "Please initialize the config first by -> git-commit-prefix config"
fi