#!/bin/bash
for filename in ./_site/wiki/*.html; do
    sed -iE "s/\<h2 id=\"\(.*\)\"\>\(.*\)\<\/h2\>/\<h2 id=\"\1\"\>\<a href=\"#\1\"\>\2\<\/a\>\<\/h2\>/g" "$filename"
    echo "$filename" >> files_log.html
done

for filename in ./_site/*.html; do
    sed -iE "s/\<h2 id=\"\(.*\)\"\>\(.*\)\<\/h2\>/\<h2 id=\"\1\"\>\<a href=\"#\1\"\>\2\<\/a\>\<\/h2\>/g" "$filename"
    echo "$filename" >> files_log.html
done

for filename in ./_site/wiki/*.html; do
    sed -iE "s/\<h3 id=\"\(.*\)\"\>\(.*\)\<\/h3\>/\<h3 id=\"\1\"\>\<a href=\"#\1\"\>\2\<\/a\>\<\/h3\>/g" "$filename"
done

for filename in ./_site/*.html; do
    sed -iE "s/\<h3 id=\"\(.*\)\"\>\(.*\)\<\/h3\>/\<h3 id=\"\1\"\>\<a href=\"#\1\"\>\2\<\/a\>\<\/h3\>/g" "$filename"
done