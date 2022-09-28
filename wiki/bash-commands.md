---
layout: post
title: "Useful Bash Commands"
date: 2020-11-04
description: "A series of bash commands I found useful, usually the product of some minutes of research or tinkering."
language: English
tags: linux, image compression, programming
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
```grep -rnw '/path/to/somewhere/' -e 'pattern'```

---

### Tar commands:

To extract a tarfile:

```tar -xzf myfile.tar.gz```

x for extract, z for zip, f for file. -v for verbose, is optional.

```tar -czf new_name.tar.gz source_directory```

c for create, z for zip, v for verbose (optional) and f for file. 

**Note that source comes after destination, like in a ASM instruction!** 

---

### Basic sed use case

```echo 'this-is-a-path' | sed 's/-/\//g'```
output:
`this/is/a/path`

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

---

Watch example:
```watch -n 10 ls -lAhF ```

---

Classic nvidia commands:

- nvcc --version : get CUDA version
- nvidia-smi : display cute table with stats that include VRAM.

---

python reindex after sorting panads dataframe:

```
limit_df.sort_values(['case', 'limit'],inplace = True)
limit_df.reset_index(drop=True, inplace = True)
```

---
### Image compression with optimizt
```
npm i -g @funboxteam/optimizt
find . -iname \*.png -exec optimizt --lossless {} +
```

---
To find a book if it's on the public domain, easily look for it on archive.org with this google search:
```
site:archive.org intitle:full/text/of intext:Lovecraft
```

---

### Values for *rel* attribute in anchor tags.

- *rel="noopener"* you use on all links opening in new tabs using the target *_blank*. There are security implications if you don’t use the *noopener* value on your links opening in new tabs. A malicious attacker can use the window.opener object to change the content and location of the originating page.
- *rel="noreferrer"* can serve a similar purpose as the *noopener*, especially in older browsers. Hence, it makes sense to use them both. Additionally, *noreferrer* can affect your analytics and report traffic as **direct instead of referral**.
- *rel="nofollow"* will inform search engines **not to pass the link juice** to the linked page, and it will not pass PageRank. You can consider it as a value that is used when you want to link to another page but without "endorsing" it. It is the only rel value with a tangible effect on SEO efforts.