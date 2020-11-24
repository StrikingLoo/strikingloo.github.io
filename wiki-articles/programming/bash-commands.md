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
