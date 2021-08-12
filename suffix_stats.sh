echo 'Markdown lines: '
find ./wiki-articles/ -name "*.md"| xargs wc -l | tail -n 1
echo 'Markdown word count: '
find ./wiki-articles/ -name "*.md"| xargs wc -w | tail -n 1
echo '# of Markdown files: '
find ./wiki-articles/ -name "*.md"|wc -l



