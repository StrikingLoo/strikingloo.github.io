---
layout: post
title: "The Unreasonable Effectiveness of Inlining CSS"
date: 2024-03-28
tags: css, webdev, web design
description: "A case study: I inlined CSS on the site and document how that impacted its loading times and traffic."
abstract: "A case study: I inlined CSS on the site and document how that impacted its loading times and traffic."
language: English
importance: 7
sitemap: true
---

Since I started this site, I have endeavored to make it load as fast as possible. Call it a tradesman's pride, or a small obsession.

Recently, after a long period of not changing anything on the design or implementation, I decided to fix a few things I knew to be bottlenecks. None of these were major, I knew. Site speed was at \~1.2s according to [webpagetest.org](https://www.webpagetest.org), but I also knew changes in loading speed have superlinear effects on traffic, and don't really have diminishing returns.

Both because a small increase in loading times is enough to dissuade some users, and because search results are influenced by loading speed, so that a winner-take-all effect may make what looks like a small improvement yield big rewards, making the site faster seemed worth it. 

One of the biggest improvements I've had on reducing latency came a couple years ago, when I switched from using web font linking to using system fonts. I don't think the site's aesthetics lost much by the trade, and I shaved somewhere around 300ms to the loading speed. That and making non-critical CSS load lazily at the end gave me the biggest gains, and left me at the point I was at the beginning of this post.

I began by running Webpagetest on the site's most visited page: [Stable Diffusion Prompt Guide](https://strikingloo.github.io/stable-diffusion-vs-dalle-2).

These were my results:

![](resources/speed1.png){: loading="lazy"}

### Inlining CSS

You can see the speed index was at 1.2s, First Contentful Paint (the moment the screen is first filled with content) came at almost the same time.

Looking at the cascade graph, there was a whole 200ms in the network call to load the CSS file. This was a minified CSS with the styles for the post, less than 3KB in size for a 176KB page, so it made no sense: if those same file contents were just part of the site's code (surrounded by a \<style> tag, of course), you'd lose only the little network transfer cost of 3KB. That's 3ms on a 1MB/s speed connection. Compared to the 200ms I was losing by establishing a connection, requesting a different file, etc., it seemed like I could gain speed by inlining.

I was careful to copy the correct minified CSS for each site (for cases where the styles differ slightly) and tested again on the same page.

![](resources/speed2.png){: loading="lazy"}

This time the speed index went down to 1.1s, and the FCP to 1050ms, leaving us 150ms faster.

That's a 12% loading time reduction, not bad for a small change. It's true you lose the ability to cache the CSS, but for this particular site where most users just visit one post or two and leave, it doesn't amount to much, and really that cache lookup can't be much faster than 3ms.

## Moving JavaScript Rendering Logic to HTML Static Generation

After that I made another change. You see how when you hover over one of the headers, it becomes clickable and links to itself? To do that you have to add an anchor on top of the header that points to the header's id on its href.

I was doing that with JavaScript that ran for every header. It only added a bit of latency (\~20ms) but now that I had got started I wanted to go all the way. 

I moved that into a little sed script that does the change once for every HTML file on the site before deployment -as a GitHub action-, making the site fully static on load.

This had negligible (I'd argue zero) effect on loading times, but consistently lowered 'Total blocking time', which makes sense as now there was no blocking JS script.

![](resources/speed3.png){: loading="lazy"}

Finally, I moved the non-critical part of CSS -like the CSS for the buttons that only become visible after you scroll down- to the end of the HTML file so it only loads after rendering the DOM.

This left me with my final numbers:

![](resources/speed4.png){: loading="lazy"}

As you can see, FCP went down by another 100ms, as content that was always below the fold is now loading lazily. Speed index also went down 100ms, so that this change was about as important as inlining CSS (or rather, inlining all CSS to the top of the document was only half as effective as splitting the styles as before and inlining both).

At this point, FCP is below 1s, and the speed index is finally at 1s flat. Seeing no other possible improvements, I left it at that. For now.

In the end, I went from an FCP of 1200ms to 947ms, for a **22% reduction**. The speed index ended up at 1s from 1.2s, for a **16% decrease**.

But was all this effort worth it? I needed to know, so I made no other changes -other than a small post that had close to 0 visits- for one week.

### Impact of Loading Speed Increase on Site Traffic

One week after improving the site's loading speed, these were the analytics for the last 7 days:

![](resources/post_image/analytics-after-change.png){: loading="lazy"}

This means finally, a 22% reduction in loading times led to a **32% increase in page_views**, 6% increase in session_start, and 36% in user_engagement. 

I had to check but, according to Google Analytics, _user_engagement_ triggers for “sessions that lasted longer than 10 seconds, or had a conversion event, or had 2 or more screen or page views.”

## Conclusion

Inlining CSS is a relatively free change, and it can save a network connection when loading the site, reducing latency by about 200ms. For static sites where the CSS is not too heavy, consider trying this out and seeing if it improves your loading times.

In this case, inlining CSS resulted in a 22% reduction in loading times, which ultimately led to a 32% increase in pageviews over one week, though these data have limitations and new posts and site changes will muddy future calculations.

