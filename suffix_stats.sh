echo 'Markdown lines: '
find . -name "*.md"| xargs wc -l | tail -n 1
echo 'Markdown word count: '
find . -name "*.md"| xargs wc -w | tail -n 1
echo '# of Markdown files: '
find . -name "*.md"|wc -l



