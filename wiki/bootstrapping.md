---
layout: post
title: "Confidence Intervals through Bootstrapping in Python"
date: 2022-07-13
description: "A tutorial with an example gist on implementing Confidence Intervals through Bootstrapping in Python"
language: English
tags: bootstrapping, python, statistics, math, programming
importance: 7
uses_mathjax: true
---

Suppose you have data, and want to report a certain metric. For instance, you'd like to estimate the value of some KPI given a set of measures, or you're a physicist trying to estimate a constant from the readings of a sensor.

Since you're estimating that quantity using empiric data, sampled from the "true" distribution, you will have sample error in your estimation. This means even if your measuring method is free of bias, there is no guarantee that your estimation is "correct".

To solve this problem, statisticians came up with confidence intervals. This means instead of reporting a single number, you may report an interval like this:

> I am 95% certain that the real value lies between X and Y.

This way, by regulating our certainty (in that example, 95%) we can indirectly move our precision (here the difference between Y and X). For instance, if I say the average length of a species of fish is between 10 and 12 inches (95% sure), I may also estimate I am 80% sure it's between 10.5 and 11.5 inches, or 99% sure it's between 9 and 13.

In the case where we **assume the data come from a normal distribution**, the 95% confidence interval for the mean is easy to calculate: take the sample's mean, and add and subtract its standard deviation times two:
{% raw %} \\\( \mu \pm 2\sigma  \\\) {% endraw %}. 

There is however a method that doesn't assume anything about the data's underlying distribution. It's called **bootstrapping**.

Bootstrapping is in a way a lot simpler than other methods: it makes less assumptions, and it simply works by taking multiple samples and recomputing our metric, which makes it ideal for a programmatic solution.

Say we want to give a 95% confidence interval for the mean of a variable, and we have _N_ instances of it. What we do is:

- Take _M_ random samples of _k_ elements each from our data.
- For each sample, estimate the value of our metric. Store this new list of _M_ estimations.
- Take the percentiles of that list such that X% of values are bound by them, where X is our desired confidence.

More concretely, if we wanted the 95% confidence interval for the mean of a variable _Y_, and we have N instances of that variable, we would take M smaller samples (of k elements each), compute the mean for each of them, then take the p2.5 and p97.5 for those means. We could then say we are 95% sure the true mean lies between those two percentile values. If we wanted to be 99% certain, we would take the p0.5 and p99.5, and so on. 

Typically, _k_ is a very small number (like 30 or 100), and _M_ is bigger (like \~N/k).

So, in case we want to add confidence intervals to our predictions or measurements, or we want to check how stable a prediction is over time / different population segments, bootstrapping may be the solution for us.

Here is a minimal implementation I made in Python, which I plan to copy and paste from here on out. Feel free to use it too.

{% raw %} <script src="https://gist.github.com/StrikingLoo/f309573b19d075751ebf010c4c863b9a.js"></script> {% endraw %}

### Additional Reading

- [The hacker's guide to uncertainty estimates - Erik Bernhardsson](https://erikbern.com/2018/10/08/the-hackers-guide-to-uncertainty-estimates.html)

