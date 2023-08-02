---
layout: post
title: "Curious HTML Elements"
date: 2023-08-01
tags: design, front end, html, web, programming
description: "A list of interesting HTML elements not used often"
language: English
importance: 4
---

Catskull's [I'm betting on HTML](https://catskull.net/html.html) has a list of interesting HTML elements. I summarize a few I found of note.

### Details: natively supported spoiler tag

```html
<details>
	<summary>click to see</summary> 
	...rest of message
</details>
```
### Mark: highlight text

```html
This text appears <mark>highlighted</mark>.
```
### New input types

```html
<input type='color|date|range'>
```

{% raw %}
<input type='color'>
{% endraw %}

### Meter

```html
<meter id="fuel"
       min="0" max="100"
       low="33" high="66" optimum="80"
       value="50">
    at 50/100
</meter>
```
{% raw %}
<meter id="fuel"
       min="0" max="100"
       low="33" high="66" optimum="80"
       value="50">
    at 50/100
</meter>
{% endraw %}



