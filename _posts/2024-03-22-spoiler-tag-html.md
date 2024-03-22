---
layout: post
title: "How to Create a Spoiler Tag in HTML"
date: 2024-03-22
tags: html, web development, frontend, js
description: "Using HTML to create a spoiler tag that shows/hides content."
language: English
importance: 5
sitemap: true
---

Many forums or blogs make use of the spoiler tag: a little button or anchor that, if clicked, reveals otherwise invisible content.

I wanted to add this functionality to the site for Tables of Content, so I figured adding this guide here could be useful both for my own future reference and for anyone else looking for a concise explanation.

What we will do to implement a spoiler tag is use these three parts:

### CSS Example Class

```css
    .spoiler-content {
        display: none;
    }
```

With the `display` property set to `none`, we make content invisible (but still part of the page's HTML). Setting this to `block` would make it visible again.

### HTML Part

```html
<a href="#" onclick="toggleSpoiler(event, '1')">Table of Contents</a>

<div class="spoiler-content" id='1'>
    <!-- Your invisible content here.> </!-->
</div>
```

Pretty straightforward: the `div` has the spoiler-content class that makes it invisible by default, and a unique id. We pair that content with that anchor by sending the same id as the second argument to the toggleSpoiler function.

### JavaScript Part

```js
function toggleSpoiler(event, id) {
    event.preventDefault();
    var spoilerContent = document.getElementById(id);
    if (spoilerContent.style.display === 'none' || spoilerContent.style.display === '') {
        spoilerContent.style.display = 'block';
    } else {
        spoilerContent.style.display = 'none';
    }
}
```
For the script, we define toggleSpoiler such that, given an id, if the element with that id is visible it becomes hidden, or viceversa. I add the check for `display === ''` as for some reason in this toy example, js was detecting the value as '' the first time even if the class was correctly applied, so that you don't need to click twice to reveal the content.

And there you have it, a simple spoiler tag in plain HTML/JS. Note that you could make the anchor a button or any other thing instead, and make the div contain any arbitrary HTML elements.
