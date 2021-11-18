find ./wiki-articles/ -name "*.md"| xargs grep '🌱'
len="$(find ./wiki-articles/ -name "*.md"| xargs grep '🌱'| wc -l)"
echo "Number of open threads: $len"
