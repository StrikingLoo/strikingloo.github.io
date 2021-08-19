---
layout: post
title: "Useful Bash Commands"
date: 2020-11-04
description: "A series of bash commands I found useful, usually the product of some minutes of research or tinkering."
---

how many lines with a given extension?

```find . -name "*.$1" | xargs wc -l| tail -n 1```

---

To run this site locally

```
sudo gem install rails
sudo gem install jekyll
sudo gem install jekyll bundler
cd ~/desiredFolder

bundle init
bundle install
bundle add jekyll
bundle exec jekyll serve
```

---

To turn .enex notes from Evernote into .md files directly: [evernote2md](https://github.com/wormi4ok/evernote2md)

---

To find all files containing a given expression. 
``` grep -rnw '/path/to/somewhere/' -e 'pattern' ```

---

### Tar commands:

To extract a tarfile:

``` tar -xzf myfile.tar.gz ```

x for extract, z for zip, f for file. -v for verbose, is optional.

``` tar -czf new_name.tar.gz source_directory ```

c for create, z for zip, v for verbose (optional) and f for file. 

**Note that source comes after destination, like in a ASM instruction!** 

---

### Basic sed use case

``` echo 'this-is-a-path' | sed 's/-/\//g' ```
output:
` this/is/a/path `

---

### Redshift copy from S3

``` 
copy $TABLE\_NAME
from 'S3\_PATH'
iam\_role '$iam\_role'
removequotes
emptyasnull
blanksasnull
maxerror 100
delimiter ','
IGNOREHEADER 1
; 
```
