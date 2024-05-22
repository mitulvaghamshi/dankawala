#!/bin/bash

function visit {
    local item
    for item in "$1"/*; do
        if [ -d "$item" ]; then visit "$item";
        elif [ -f "$item" ]; then minify "$item"; fi
    done
}
function minify {
    case "$1" in
        *.html | *.js | *.css| *.json)
            TMP_FILE=$(mktemp "$1.XXXXXX")
            tr -d '\n\r' < "$1" > "$TMP_FILE"
            mv -f "$TMP_FILE" "$1" ;;
    esac
}
visit "pages";
