---
layout: post
title: "CSS Scrapbook"
date: 2024-03-23
tags: CSS, frontend, web development, design
description: "Examples of CSS designs for future reference"
abstract: "The following are CSS templates I keep for different scenarios. I may eventually try using variations of them for this website, or any future projects, or collect them for fun. This is a scrapbook of sorts."
language: English
importance: 5
---

### Scholar

A somewhat stern, austere design with earthy or somber colors.

```css
/* Color Palette */
:root {
  --main-bg-color: #f7f5ed; /* Parchment */
  --text-color: #333333; /* Rich Black */
  --accent-color: #8b5e3c; /* Chestnut */
  --heading-color: #4d4d4d; /* Charcoal Grey */
}

/* General Styles */
body {
  font-family: Georgia, serif;
  line-height: 1.5;
  color: var(--text-color);
  background-color: var(--main-bg-color);
  margin: 0;
  padding: 0;
}

/* Headings */
h1, h2, h3, h4, h5, h6 {
  font-family: 'Times New Roman', serif;
  color: var(--heading-color);
  margin-top: 1.5em;
}

/* Links */
a {
  color: var(--accent-color);
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}

/* Layout */
.container {
  max-width: 800px;
  margin: 0 auto;
  padding: 2rem;
}

/* Blog Post */
article {
  background-color: #ffffff;
  padding: 2rem;
  border: 1px solid var(--accent-color);
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

article header {
  margin-bottom: 1.5rem;
}

article h1 {
  font-size: 2rem;
  margin-top: 0;
}

article p {
  margin-bottom: 1.5rem;
}

/* Footer */
footer {
  text-align: center;
  padding: 1rem;
  color: var(--accent-color);
}
```

### Cyberpunk 

A cyberpunk-ish feel and an example of linear-gradient. Uses a glitchy effect for headers.

```css
/* Color Palette */
:root {
  --primary-color: #0d0d0d; /* Cyber Black */
  --accent-color: #00ff9b; /* Cyber Green */
  --secondary-color: #9b59b6; /* Cyber Purple */
  --gradient: linear-gradient(135deg, var(--accent-color), var(--secondary-color));
}

/* General Styles */
body {
  font-family: 'Courier New', monospace;
  line-height: 1.5;
  color: var(--accent-color);
  background: var(--primary-color);
  margin: 0;
  padding: 0;
}

/* Headings */
h1, h2, h3, h4, h5, h6 {
  font-weight: bold;
  text-transform: uppercase;
  background: var(--gradient);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

/* Links */
a {
  color: var(--accent-color);
  text-decoration: none;
  transition: all 0.3s ease;
}

a:hover {
  color: var(--secondary-color);
}

/* Layout */
.container {
  max-width: 960px;
  margin: 0 auto;
  padding: 2rem;
}

/* Blog Post */
article {
  background: linear-gradient(to bottom right, #1a1a1a, #2d2d2d);
  padding: 2rem;
  border: 1px solid var(--accent-color);
  box-shadow: 0 0 10px rgba(0, 255, 155, 0.5);
}

article header {
  margin-bottom: 1.5rem;
}

article h1 {
  font-size: 2.5rem;
  margin-top: 0;
}

article p {
  margin-bottom: 1.5rem;
}

/* Footer */
footer {
  text-align: center;
  padding: 1rem;
  color: var(--accent-color);
}

/* Animations */
@keyframes glitch {
  0% { opacity: 1; }
  25% { opacity: 0.8; text-shadow: 2px 2px var(--accent-color); }
  50% { opacity: 1; }
  75% { opacity: 0.8; text-shadow: -2px -2px var(--accent-color); }
  100% { opacity: 1; }
}

h1 {
  animation: glitch 2s infinite;
}
```

### Related Reading

- [CSS Zen Garden](https://www.csszengarden.com/): Website where people submit their own spin on the design for a fixed HTML. A nice little place to check.