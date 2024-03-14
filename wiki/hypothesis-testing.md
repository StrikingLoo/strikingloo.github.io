---
layout: post
title: "Hypothesis Testing and p-value Cheatsheet"
date: 2024-03-13
tags: Statistics, A/B testing, p-values
description: "Quick cheatsheet for p-values and statistical tests."
language: English
importance: 2
---

We start with two samples, which we will call treatment and control, with their means and standard deviations known.

We call H<sub>0</sub>, the hypothesis 'there is no significant difference/effect' the null hypothesis. We purport to reject this hypothesis by a test.

The most basic formula to use here is the one for p-values:

> t = (μ<sub>A</sub> - μ<sub>B</sub>) / sqrt((σ<sub>A</sub>^2/n<sub>A</sub>) + (σ<sub>B</sub>^2/n</sub>B</sub>))

The value for t is then plugged into Welch's t-test.

Otherwise, for effect size we may calculate P-move.

> P-Move = Φ(d / sqrt(2)) + (1 - β) * (1 - Φ(d / sqrt(2)))

- Φ() is the cumulative distribution function (CDF) of the standard normal distribution.
d is the effect size, often calculated using Cohen's d: d = (μ<sub>A</sub> - μ<sub>B</sub>) / sqrt((σ<sub>A</sub>^2 + σ<sub>B</sub>^2) / 2)
- μ<sub>A</sub> and μ<sub>B</sub> are the means of the two groups A and B
- σ<sub>A</sub> and σ<sub>B</sub> are the standard deviations of the two groups
β is the probability of making a Type II error (failing to reject the null hypothesis when it is false)
- (1 - β) represents the statistical power of the test (usually left on 0.8)