#!/bin/bash
find "pages" -type f \( -iname "*.html" -o -iname "*.js" -o -iname "*.css" -o -iname "*.json" \) -print | while read file; do tfile=$(mktemp "${file}.XXX"); cat "${file}" | tr -d '\n\r' | tr -s '[:space:]' > "${tfile}"; mv -f "${tfile}" "${file}"; done
