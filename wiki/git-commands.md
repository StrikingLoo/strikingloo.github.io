---
layout: post
title: "Useful git commands"
date: 2020-06-13
description: "Just a series of git commands I found helpful."
language: English
importance: 3
tags: programming
---
Just a series of git commands I found useful. 

If they're here, it means I didn't come accross all of them in the same place, and I chose to bunch them all together for future ease of recollection.

```git config --global alias.cm 'commit -m' ```

```git config --global user.name strikingLoo ``` 

Considered a lot less secure (for obvious reasons) so don't use this for passwords.

`git config --global alias.uu 'diff --name-status --diff-filter=U'` _List unmerged files._

`git difftool --dir-diff main` _Compare against a branch._