---
title: "Vim: How to Start Using The Text Editor for Developers"
layout: post
tags: programming, linux, productivity, text editor
date: 2019-04-14
importance: 5
sitemap: true
---

*Note: I originally wrote this article on my first blog, so it may not be as polished as newer things.*

To some, Vim is a beautiful relic from the past. To others, it’s that annoying thing you have to escape whenever you need to write a message for a merge commit.

Let me introduce you to this picturesque text editor and its wonders, and show you why we’re still using it [26 years after its first release.](https://en.wikipedia.org/wiki/Vim_%28text_editor%29)

First a small piece of advice: this text editor shines the most when used for editing structured text files (like JSONs) or code, not so much when writing new files from scratch (though I do use it for that a lot too). Also, many people like adding a vim plugin to their IDE instead of going full vim, so they get the commands and the nice UI. Your mileage may vary.

Now fire up your terminal on your working directory of choice, and type

```
vim sample.txt
```

so that we can start this tutorial!

## First steps: navigating, editing and exiting.

Whenever you open Vim on a file, there are three basic things you may want to do:

- Reading the file’s contents
- Writing on the file
- Quitting the program

### Navigation

To navigate a file on Vim, use the letters _h,j,k, _and_ l._These commands are called_ motions_, as they move the cursor.

The keys _h_ and _l_ will move your cursor horizontally (one character at a time), while _j_ and _k_ move vertically (one line at a time). If you put your hand on them, the layout sorta makes sense.

Some people have trouble remembering which key goes up and which goes down. Pro tip: _j_ sorta looks like a downwards pointing arrow.

As a general note, it is considered bad practice -even though it’s possible- to use the arrow keys for moving in Vim. Get used to using _hjkl_, and I promise you’ll see a significant boost in speed.

### Repetition

Once you’re confident moving through a file one character or line at a time, try pressing a number (any number, it could have many digits) before moving. You’ll jump as many times as the number you entered.

This is a very powerful concept in Vim: Repetition. Have you ever found yourself editing a text file and doing the same thing over and over? Especially something very mundane, like deleting quotes and replacing them with commas? Vim’s got you covered: Just do the thing once, and press . to repeat it. Enter a number and press . again if you want to repeat it as many times.

### Edition

Moving around in a text file and reading what’s in it is good and all, but what if we need to change some of its contents? Do not despair, editing a file is as easy as pressing the _i_ key. That will move you from _normal mode_ into _editing mode_.

Most Vim commands will only be available on normal mode, and entering editing mode is usually frowned upon, and should be avoided as much as possible. However, when entering editing mode, Vim will be like any other Text Editor (with Syntax Highlighting on), making its functionalities a superset of those available in your typical notepad.

To exit editing mode, press the _ESC_ key.

### Quitting

To quit Vim, enter normal mode, and press _:wq_ if you want to save your changes (write and quit), or _q!_ if you want to leave without saving.

## More commands: Some Useful Features.

Editing files from the terminal might make you look like a cool hacker or something, but why should we use this text-based program instead of good old Sublime Text? The answer is _commands_. 

### A thousand ways of deleting text

Want to delete part of your file? You _could_ enter editing mode and press backspace once for every character. It doesn’t really beat using Sublime and pressing _ctrl+shift+left_ to select a whole word before deleting it.

If you really want to harness the power of Vim, you should try pressing the_d_key. Pressed once, it won’t do anything. But it’s not sitting idle, it is actually expectant, waiting for an order. Pass it a motion like the ones we learned today (_l, 5j_, whichever you feel like really) and it will gobble those characters up. For instance, _dNl_ for any number _N_, will delete the following _N_ letters from the cursor.

### Introducing new motions

- _e_ : Moves the cursor to the end of the current word (defined as a concatenation of letters, numbers and underscores).
- _w_ : Moves it to the beginning of the next word.

So if I have this text:

```
Hello there, general.
```

And my cursor is standing on the H. When I press _de_ in normal mode, the line will end up looking like this:

```
there, general.
```

While using _dw_ will leave it like this:

```
there, general
```

Notice how in the second example, there’s no space before ‘there’.

We could then press _i_ to insert some replacement word after deleting ‘Hello’. Luckily, there’s an even more fluid way of doing that: the _c_ command (for _change_). Pressing _c_ and a motion is exactly equivalent to pressing _d+motion+i_.

This is starting to look nicer, but it still doesn’t beat pressing shift+home/end and deleting a whole line in a few keystrokes, right? Well I see that, and raise you to the _$_ and _0_ motions.

- **0:** moves the cursor to the first character in the current line.
- **$:** moves the cursor to the last character in the line.

There’s an even faster way of deleting the whole current line though: _dd_. And if you want to delete many lines? _dxd_ deletes the x following lines.

### Generally useful Vim commands

By now, the usefulness of vim when editing code should start to become apparent.

A few other commands you may want to check out are:

- _o_ and _O_: create a new line above or below the current one, respectively, and enter editing mode.
- _v_ : enter _visual mode_ to select text to which you may then apply more commands.
- _y_ or _Y_: _yank (copy)_ the selected text, or the current line, respectively.
- _p_ : _put_ the _yanked_ content. Notice that yanking will move text to a special Vim reserved buffer, and not to your usual clipboard. This way, you can effectively manage two different clipboards! One you can paste from with _ctrl+shift+v_ as usual (in editing mode), and the other with _p_ (in normal mode).
- \* : find the next occurrence of the current word.

When writing software, I find myself duplicating lines to change a few words quite often, so I think _Yp_ is an amazing command.

### Conclusion

I’ve barely scratched the surface with this introduction, but I hope I’ll at least have persuaded you into trying Vim out for yourself. It may not replace an IDE if you’re coding in Java or C++, especially if you’re using frameworks and auto-complete is helping you. But when coding in C or Python, I usually pick it as my editor of choice. And sometimes when I need to transform a string quickly, editing it from Vim is faster than coding a script in Bash or Python.

I also encourage you to try the software on your own, and run the _vimtutor_ program from your shell (it usually comes preinstalled with Linux and on Macs). If you want to really learn how to optimize your Vim use after going through vimtutor, this very geeky, awesome site [vim golf](http://vimgolf.com/) may be of interest to you as well.

I hope you found this article useful or interesting, and as usual any feedback will be welcome, whether anything I said was plain wrong, or you actually liked some part of this tutorial.

_Follow me on [Twitter](http://www.twitter.com/strikingloo) for more Programming tutorials, tips and tricks, and if you liked it please consider tweeting my article!_