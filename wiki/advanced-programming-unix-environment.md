---
layout: post
date: 2022-11-01
title: "Advanced Programming in the UNIX Environment (MOOC notes)"
tags: mooc, computer science, operating systems, systems programming, syscalls
description: "Notes for the course on Advanced Programming in the UNIX Environment by Stevens Institute of Technology. Systems programming, the UNIX development environment -syscalls, shell commands- and a little bit of UNIX history."
abstract: "Notes for the course on Advanced Programming in the UNIX Environment by Stevens Institute of Technology. Systems programming, the UNIX development environment -syscalls, shell commands- and a little bit of UNIX history. I am currently doing this MOOC so the notes are kind of raw so far."
language: English
importance: 3
---

_[Course Syllabus](https://stevens.netmeister.org/631/#syllabus) - [YouTube Playlist](https://www.youtube.com/watch?v=w3spRzZ8bSA&list=PL0qfF8MrJ-jxTKXYNnLjf2qN7DwoU5MQr)_.

## Facts section

Man pages: Section 2 for calls, 3 for library functions.

`strerror` turns error codes into string description.



## File I/O

Optimal buffer size for big file I/O operations -imagine using write in chunks, for instance- matches the filesystem's block size. You can obtain this for a given file by running `stat -f "%k" $FILENAME`.

Relevant syscalls: _open, creat, close, read, write, lseek_.

**File Sharing**: process table -> file table -> v-node table (each has pointers to entries in the next). `dup` Allows to have a process table entry that points to the same file file table entry with two different file descriptors, allowing for the creation of, among other things, pipes.

Stdin, out or err can be represented as devices (`/dev/std{in,out,err}`) which can be referenced in any bash commands etc. Alternatively they can be mentioned as `/dev/fd/{0,1,2}`

### Interesting _man_ pages

- sysexits

> Consistency underlies all aspects of quality. <br>_- Frederick P. Brooks, Jr._


**Process time** is measured in clock ticks, and includes three values:
- clock time (wallclock running time)
- user CPU time
- kernel CPU time
user+kernel, counterintuitively, do not add up to clock time, as wait time does not count as either user or kernel time.

Standard way to create a process: _fork, exec and wait_.

### Interesting UNIX programs / Bash commands

- `mkfifo` makes a FIFO named pipe (you can treat it like a temp storage file).


### Related Reading and Interesting Links

- [The Unexpected Effects of Cache Associativity](https://en.algorithmica.org/hpc/cpu-cache/associativity/#hardware-caches).
