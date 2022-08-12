---
title: "Making Notes Work for Me: Reflections after 2 Years of Digital Gardening"
layout: post
tags: note making, note taking, notes, digital garden, personal wiki, archiving
date: 2022-08-12
importance: 8
description: "My thoughts on note taking, personal wikis, digital gardens and zettelkastens."
twitter_image: "https://strikingloo.github.io/resources/post_image/pathway.jpg"
---

I have been maintaining a Personal Wiki / Digital Garden for two years. Throughout all this time, I've reflected a lot on how I keep my notes, why I do it and what I get from doing it. Here is what I have learned.

To save you time, I will start by stating my conclusion. It could be summarized as: **Keeping notes is great, definitely do it. Maybe use a personal wiki?**

Before I started running this site, I basically kept no notes, except the odd random paper scribble, unless it was for college related things. Even then, I just wrote things down on a notebook, never to be seen again. 

I was already using [Spaced Repetition systems](/wiki-articles/information-storage/anki) for language learning, but I wasn't that deliberate about my memory in other areas of my life like programming.

In the time since I set up [this site's wiki](/wiki), I finished my degree in Computer Science, and also aced a few key interviews. I am not saying my successes were completely or even mainly dependent on note-taking, but they definitely helped with my final exams. So after hitting the 80 notes benchmark, I thought I would write this post as a way to look back and do a little retro.

![](/resources/post_image/pathway.jpg){: loading="lazy"}

I would say the main advantages of note taking, to me at least, have been in improving my search capabilities over my own memory (a filesystem definitely beats a chunk of electric meat), and helping me be more organized and procrastinate less.

It's a lot easier to prepare for an exam when you have all of the relevant knowledge in a single markdown file, waiting to be reviewed. 

As for search, my criteria for adding things to my wiki is usually "will I want to review this fact in the future eventually, and will I have probably forgotten it if I don't write it down?"

That is why most of my notes are either literature notes or paper summaries: I mostly find myself going back to impressing facts I read, or wanting to recall that pesky equation from that one diffusion paper I read and can't quite put my finger on. In those cases, having all that information in a single place has been a life-saver. The same goes for remembering the exact flags of a bash command, or a few useful bookmarks.

## How I set up my personal wiki

First, let me tell you about my digital garden set up. It is actually very simple: a **jekyll static site**, running on github pages because I wasn't going to pay for a domain and hosting for something I'm not interested in profiting from.

Every wiki article is a single markdown, rendered by jekyll as an HTML, and the most I've engineered things on is just adding social media buttons (which, by the way, if reading this is fun, click them!), and putting a lot of thought and effort into interlinking my notes.

This is what my personal wiki looked like initially:

![](/resources/post_image/screenshot1.png){: loading="lazy"}

Notice the monochromatic, very rustic design compared to what it is now. And this what it looked after my first round of modifications:

![](/resources/post_image/screenshot2.png){: loading="lazy"}

I was very married to the idea of a "cloud of ideas", but I think the file names weren't descriptive enough and anone besides me who entered that site would not have known where to click at all. Even now I'm not sure how to present the wiki's articles to make them more appealing, as design is not my strong point.

The features I added to the site over time were:
- **Search** which I implemented based on tags and also matching queries to titles. This was very easy to set up by making a big JSON which has each article's metadata (title, tags, description, abstract).
- **Importance scores** for the articles in my wiki. This was mostly for other readers, as I am pretty aware of what's going on with each article, but I like making things more transparent for others. They mostly reflect how polished or relevant an article is.
- **Category pages** and **support for mathematical notation**. These two weren't that hard, but importing MathJax into my workflow made for much sleeker interfaces when writing down equations from papers or textbooks. I was getting very tired of "\<sub\>" HTML tags and writing greek letters by hand. With MathJax you basically get LaTeX support for HTML.

### Starting Your Own Personal Wiki

If you want to start your own personal wiki, I recommend you head over to [Tom Critchlow's guide](https://tomcritchlow.com/2019/02/17/building-digital-garden/) for a step by step on setting up a jekyll static web site where each markdown file is a note. 
You can alternatively fork [this site's Github repository](https://github.com/StrikingLoo/strikingloo.github.io) and host it in a free GitHub page (you can customize the CSS!), following the instructions on the README to build your own wiki. 

Either way, it's about one afternoon's work if you're not too picky with the design (or a potentially infinite time sink otherwise).

## How I take notes

I have spent more time than I am proud of reading articles about the ZettelKasten Method, posts in the zettelkasten forum and subreddit, and browsing other peoples Digital Gardens from [Maggie Appleton's Digital Gardeners Repo](https://github.com/MaggieAppleton/digital-gardeners) for inspiration (or, calling it like it is, procrastination). 

By now I could say thinking of note-taking systems is a bit of a hobby of mine. And anyone who knows me can tell you I am a bit obsessive about productivity and workflows.

So the first thing I will say is, my wiki is not a [zettelkasten](/wiki-articles/information-storage/archiving#zettelkasten). 

Zettelkastens, very briefly, are based around the idea of using many atomic notes (usually short pieces of text), and interlinking them heavily, where a train of thought can be reconstructed by following a trail of multiple notes (zettels). This is supposed to make you a more prolific writer and help you develop essays, and zettels are expected to be mostly written in your own words as opposed to quotes and excerpts. The zettelkasten methodology also assumes you will start your trails from some particular zettel, and not just see the whole wiki as a big thing with search and tags, etc.

There is also a big emphasis in most of the online digital gardening / note making community in networked thought: link your new notes to as many existing notes as possible, and find patterns and connections between concepts you learn. I don't do this as much, as I don't think there is that much value in linking (I especially dislike the idea of automatic backlinks for notes, and [some in the zettelkasten community agree](/wiki-articles/information-storage/archiving#ideas-from-backlinks-are-bad-links)).

Instead, I prefer to take a slightly **monolitical approach**, where I write big notes of 500\~1000 lines or more for a single topic, and make each atomic idea a paragraph or subheading. If necessary, I can then just link to headings through their *id* instead of the whole note -like my link to the zettelkasten section of my wiki just now-.

I'm not saying it's better, it just works better for me. I'd rather be able to review a whole subject in a few minutes by reading a single page instead of opening a hundred tabs every time. This is the part where I tell you to @ me in Twitter or hackernews and tell me what you prefer doing and how you think it works better, because I love hearing about other people's methodologies. 

I think if I was more writing or content-generation oriented instead of writing notes for future search, making more atomic notes and linking them could be better, but then each note itself would be further from being an essay.

I mostly write the notes as I go, for instance by rephrasing an interesting paragraph from a paper just after I read it, or summarizing a book one chapter at a time. Whenever I copy or restate a point from an essay or blog post, I add a link to it as a source. If an idea relates relevantly to a different note and I think the connection is worth expanding upon, I will link to it, but also if I think I will want to have the other note on hand when reading this one.

## Conclusions

Taking notes and keeping them tidy in a single place has helped me a lot when reading new, long textbooks or keeping up to date with the current deep learning literature. It's also very convenient for preparing exams. 

Linking them has helped insofar as it makes the site's navigation easier, but I don't think particularly deep insights come from just interlinking notes or sections, and don't feel my wiki is an insight-generating machine or anything like some people see the Zettelkasten (even though I think 80 big notes should count as 'critical mass').

Being able to reflect on things while writing about them, and review my thoughts on a matter months down the line in an ordered, persistent and friendly way has definitely improved my thinking and retention of technical material, and knowing my source for each thing I jot down has been a godsend when directing other people to it. I am not as bullish as [Paul Graham](http://paulgraham.com/essay.html) on this, but I think sitting down to write ideas helps expand them and solidify them into something better. 

I also think this relates to the Feynman method of learning: if you can explain an idea you just read, you probably understood it. If you can't go reread.

There's something very rewarding to being asked for advice or how to solve an issue and saying "oh don't worry, that's on my wiki". It's even more rewarding when you yourself are the one with the issue.

All in all, I think most knowledge workers and scholars should take notes in the way that best suits them, and that this space deserves [lots of experimentation](https://numinous.productions/ttft/), especially on an individual level to see what works for each person.

_If you liked this post, please let me know by upvoting on HackerNews or sharing on Tweeter/Reddit! Knowing people read me is my biggest driver for writing more._

### Related Reading

- [How Can We Develop Transformative Tools for Thought?](https://numinous.productions/ttft/): A very good long form essay about tools that help us think. Much of the current craze around personal wikis or digital gardens originated here, and it's also a very entertaining read (if you're the kind of person who finds this sort of content fun).
- [The Age of the Essay](http://paulgraham.com/essay.html): A great essay by Paul Graham on the history of the essay, and general writing tips. It touches on how writing helps us think.
- [My blog is a digital garden, not a blog](https://joelhooks.com/digital-garden): One of the original essays that started the digital garden movement. A call to go back to the Old Ways of the web, do away with timelines (the stream) and move back to evergreen pages that are continually being tended.
- [A Brief History & Ethos of the Digital Garden - Maggie Appleton](https://maggieappleton.com/garden-history): A great summary of the Digital Garden movement with beautiful illustrations.
- [About this Website - Gwern](https://www.gwern.net/About): Definitely an inspiration for my wiki.