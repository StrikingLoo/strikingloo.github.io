---
layout: post
title: "Alien Designers - Asking Large Language Models to Design CSS"
date: 2024-04-03
tags: css, webdev, web design, LLMs, Large Language Model
description: "I prompt Claude, a Large Language Model, to write CSS templates, and try them out in a single HTML layout, giving my opinions. I find that it is great for first-iteration prototyping."
abstract: "I prompt Claude, a Large Language Model, to write CSS templates, and try them out in a single HTML layout, giving my opinions. I find that it is great for first-iteration prototyping."
language: English
importance: 7
sitemap: true
---

People keep debating whether Large Language Models have an internal model of the world (encoded somewhere in their weights or their correlations) or not. Some go as far as to entertain the idea that a model may be sentient though, in my opinion, we're still far from that. 

Today I was wondering a different thing: how good is a Large Language Model's eye for design? 

I work as a full-stack web developer, among other things, but I am no designer. This made me wonder, can a Language Model write CSS for a design at least close to as good as what I could come up with? Definitely far from the level of a professional designer, but still good enough for a fast MVP?

To answer this question, I decided to ask Claude Sonnet -As Claude is considered by many the best model for aesthetic or artistic purposes, over GPT- for designs with several style cues (thinking back to my experiences with text-to-image models), and then try each CSS file, with no modifications, in the same HTML template, so the competition is fair. This idea was also partially motivated by [CSS Zen Garden](https://www.csszengarden.com/), a website where people submit their own spin on the design for a fixed HTML.

## Creating the Template

I began by creating a simple static website template, a [Lorem Ipsum](https://en.wikipedia.org/wiki/Lorem_ipsum). This is the kind of relatively mindless task where a language model like Claude should shine, so I just gave it this prompt.

> Please create a lorem ipsum template HTML with h1, h2, h3, \<article>, \<footer>, \<p> and \<a>s

I was explicit on which tags I wanted, since I wanted to stress the design a little and make sure it wasn't too simple.

It came up with this.

<div class='wide-eighty'><img src="resources/post_image/claude-css-design/plain-html.png" loading="lazy" style="max-width:100%"/></div>

It's a simple design with a nav bar, several kinds of headers and links. I wonder how much better we can make it look without having to write the CSS ourselves?

## Experimenting with Different CSS Styles

I began trying different prompts with style cues and testing each CSS on the HTML above.

### Ghibli-Inspired Style

From what I'd seen in text-to-image models, ghibli-inspired aesthetic tended to yield good outputs. I wondered if that would work for this set up.

> What would a good CSS style look like for a Ghibli aesthetic? You're styling an HTML like the one above and you're a great designer

It came up with a pretty bland design. It definitely didn't say 'Studio Ghibli' to me.

<div class='wide-eighty'><img src="resources/post_image/claude-css-design/ghibli-1.png" loading="lazy" style="max-width:100%"/></div>

Unimpressed, I asked it to add more colors and shades of green.

> I love the general vibe but want it to have more colors, maybe a bit green or light blue

<div class='wide-eighty'><img src="resources/post_image/claude-css-design/ghibli-2.png" loading="lazy" style="max-width:100%"/></div>

> These colors are inspired by natural elements like foliage, oceans, and forests, which can add a sense of liveliness and serenity to the overall aesthetic, while still maintaining a warm and whimsical feel.<br>_Claude_

This time the pastel palette gave it a nicer look, but I really disliked the hard-to-read fonts in the headers. I decided to change gears to a different style altogether.

### Steampunk Design

> Can you create a CSS that makes this steampunk? Be creative and original

<div class='wide-eighty'><img src="resources/post_image/claude-css-design/steampunk.png" loading="lazy" style="max-width:100%"/></div>

> The overall color palette is dark and rich, featuring shades of brown, bronze, and beige, which evoke a vintage and industrial feel.

> The font families used are 'Playfair Display' and 'Playfair Display SC', which have a classic and elegant appearance reminiscent of the Victorian era.

> This CSS style combines dark, rich colors, metallic accents, and classic typography to capture the essence of steampunk design.

I think in this case we see an improvement, at least I like this design. The palette is thematically relevant (maybe it got that after I corrected it in the Ghibli example?) and the fonts look good and readable. Playfair is just nice.

### Gothic Cathedral

> What about a site that's like a Gothic cathedral, with a vitro themed effect on hovering \<h2>s

I was still not convinced Claude could do animations well, but I figured I'd try different time periods as inspiration. For _Gothic Cathedral_, I think the model did something pretty good.

<div class='wide-eighty'><img src="resources/post_image/claude-css-design/gothic-cathedral.png" loading="lazy" style="max-width:100%"/></div>

It's quite monochromatic, but the typesetting looks nice. I can see this as a nice first step that a real designer could iterate on to get to a real Cathedral-inspired design. Maybe just adding a few images on the background or a banner could help.

### Psychedelic Design

I tried asking Claude to make a psychedelic, whimsical design.

It came up with possibly the ugliest, worst design in this post. I'll share it for completion, but viewer discretion is advised.

<div class='wide-eighty'><img src="resources/post_image/claude-css-design/psychedelic.png" loading="lazy" style="max-width:100%"/></div>

Between the comic-sans, the dots and the weird pastel palette, I think this one is less _psychedelic_ and more _baby's first PowerPoint presentation_. Easily the weakest result so far.

### Cyberpunk Design

> What about a modern design with color gradients and bells and whistles, a little cyberpunk, for a hacker's blog

<div class='wide-eighty'><img src="resources/post_image/claude-css-design/cyberpunk.png" loading="lazy" style="max-width:100%"/></div>

> In this design, we're using a dark primary color (#0d0d0d) for the background, with a bright "cyber green" (#00ff9b) as the accent color and a "cyber purple" (#9b59b6) as the secondary color. The headings have a gradient effect created by blending the accent and secondary colors, with the text being filled using the -webkit-background-clip and -webkit-text-fill-color properties.

> The blog post articles have a subtle gradient background with a cyber green border and a glowing box shadow. The monospace font family ('Courier New') adds a hacker-like touch to the text.

> Additionally, there's a glitch animation applied to the headings, which creates a flickering effect reminiscent of a malfunctioning computer system.

This one looks pretty good, very '80s sci-fi vibes.

### Garden and Plants

> Now do one that's garden-themed, I want it to be very laid-back, relaxing, with something of the organic

<div class='wide-eighty'><img src="resources/post_image/claude-css-design/garden.png" loading="lazy" style="max-width:100%"/></div>

> This CSS style combines natural colors, classic typography, and organic textures to create a garden-themed, laid-back, and relaxing atmosphere. You can further enhance the aesthetic by adding additional elements such as leaf patterns, floral illustrations, or botanical motifs using CSS or image assets.

I asked it to add said patterns and illustrations, expecting little as I wasn't sure how much could be achieved with plain CSS given I don't think Claude will be able to do CSS illustrations or something.

It ended up leaving it like this.

<div class='wide-eighty'><img src="resources/post_image/claude-css-design/plant-based.png" loading="lazy" style="max-width:100%"/></div>

If you squint, the weird SVG it added to the background kinda looks like a mitochondria. Given it was a _huge_ piece of SVG right on the CSS, I think it's 50\% hallucinated.

Moving on.

### Disco - Shibuya at Night

> Create a night club aesthetic like it's Shibuya at night. I want neon effects on headers, black background and white fonts, very flashy effects

<div class='wide-eighty'><img src="resources/post_image/claude-css-design/shibuya-at-night.png" loading="lazy" style="max-width:100%"/></div>

Okay, I got what I asked for I guess. The image doesn't capture the sheer horror of this design: all headers pulsate constantly with a strobe light animation.

It does evoke a neon effect, so I'll give it a passing grade.

Something similar happened when I asked for a 'disco' design

<div class='wide-eighty'><img src="resources/post_image/claude-css-design/disco.png" loading="lazy" style="max-width:100%"/></div>

### Flat Design

I asked for a minimalist, flat design.

<div class='wide-eighty'><img src="resources/post_image/claude-css-design/flat-minimalist-design.png" loading="lazy" style="max-width:100%"/></div>

> This CSS style adheres to the principles of flat design, which emphasizes simplicity, minimalism, and a focus on typography and color. The use of flat colors, subtle shadows, and simple shapes creates a clean and modern aesthetic. The overall design is clean, crisp, and user-friendly, which is a hallmark of flat design.

Honestly one of the best of the bunch. Though I guess there are less obvious failure modes with a minimalist design, even if pulling it off with excellence does require a lot of skill.

### Crystal

> Now do a beautiful geometric design with lots of diamonds and crystal-looking

<div class='wide-eighty'><img src="resources/post_image/claude-css-design/crystal.png" loading="lazy" style="max-width:100%"/></div>

The weird background image, the glowing header and the diamond on hover showing up after \<h3>s. This time Claude went off the rails, and it's cute.

### The Ultimate Design

So far, I had been asking Claude for designs for a certain style or another. I was wondering what would happen if I asked it to throw everything at the wall. If I made it go all out.

> Now give me the most beautiful, highest quality, detailed, amazing design you can come up with. Use all the tools in the arsenal, all the CSS you know, all the principles of good design, everything

Slightly afraid to see the beast unleashed, I refreshed the HTML and this is what I got.

<div class='wide-eighty'><img src="resources/post_image/claude-css-design/final.png" loading="lazy" style="max-width:100%"/></div>

It's actually a pretty nice design! You can't tell from the screenshot but links and headers both had animations for hover effects. I like the simple palette and the font choices. The round bullet before \<h2>s is a weird choice, but other than that I can see how this could make for a nice design.

After this Claude went crazy explaining all the virtues of its design, to the point where it reached its token limit for the message. Here is an excerpt.

> Attention to Detail: The design pays close attention to small details, such as hover effects on navigation links, underlines on headings and links, and decorative elements like the circular bullet points before headings.<br><br>Animations and Transitions: Smooth transitions and animations are implemented for various interactive elements, such as the navigation link underlines and the link underline effect, adding a polished and refined touch to the user experience.

## Conclusion

All in all, Claude does seem to produce passable designs when pressed, and it makes for a good starting point if you need inspiration. Its font and palette choices are pretty solid, and could be iterated on. 

Any improvements that depend on images, animations and backgrounds will however require human intervention, and if you have a pretty clear idea of what you want you may have an easier time just writing it yourself than trying to wring it out of the model.

I wonder how much better these prompts would work with the biggest, paid version of Claude -Opus-, or with GPT4. Maybe this is all just an artifact of using a smaller model, and the state of the art ones do make good CSS _ex nihilo_. If anyone feels like trying out that experiment, let me know and I'll link to your results.

I also imagine this could be a great enabler for someone without web development skills. Imagine asking Claude for 4 or 5 different CSS versions, trying them all out in your HTML by copying and pasting, even if you know no CSS. A person could start a static blog with very little technical knowledge without having to depend on WordPress or one of those services.

For the moment, I think the best use for LLMs remains calling them for isolated bits of CSS or syntax examples, which you can iterate on later.

I made all CSS and parts of Claude's responses available as an [appendix on my wiki](/wiki/css-scrapbook), in case you want to see them in more detail. Feel free to borrow them, partially or totally, no need to credit me either.

Have you tried using Claude for design ideas?
