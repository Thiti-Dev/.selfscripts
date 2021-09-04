#!/bin/bash


if [ "$1" != "" ]; then
    if ! [ -x "$(command -v $1)" ]; then
        echo Error: $1 is not installed
        exit 1
    fi
    #if the process exist
    $1 &> /dev/null &
    echo "$1 -> $!"
fi