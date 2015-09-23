#!/bin/bash

confirm () {
    # call with a prompt string or use a default
    read response
    case $response in
        [yY][eE][sS]|[yY])
            true
            ;;
        *)
            false
            ;;
    esac
}

git() {
    if [[ $@ == "commit --amend"* ]]; then

        command echo '
        Thou Shalt not
        git commit --amend
        '
        echo -n "Do you want to start fires? "
        confirm && command git "$@"
    else
        command git "$@"
    fi
}
