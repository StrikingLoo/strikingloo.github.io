---
layout: post
title: "Useful bash commands"
date: 2020-11-04
description: "A series of bash commands I found useful, usually the product of some minutes of research or tinkering."
---

how many lines with a given extension?

```find . -name "*.$1" | xargs wc -l| tail -n 1```
