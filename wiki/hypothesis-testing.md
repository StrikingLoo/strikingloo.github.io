---
layout: post
title: "Hypothesis Testing and p-value Cheatsheet"
date: 2024-03-13
tags: Statistics, A/B testing, p-values
description: "Quick cheatsheet for p-values and statistical tests."
language: English
importance: 2
---

## P-value two-sample Hypothesis testing

We start with two samples, which we will call treatment and control, with their means and standard deviations known.

We call H<sub>0</sub>, the hypothesis 'there is no significant difference/effect' the null hypothesis. We purport to reject this hypothesis by a test.

The most basic formula to use here is the one for p-values:

> t = (μ<sub>A</sub> - μ<sub>B</sub>) / sqrt((σ<sub>A</sub>^2/n<sub>A</sub>) + (σ<sub>B</sub>^2/n</sub>B</sub>))

The value for t is then plugged into Welch's t-test.

### P-move

_[Source: Objective Bayesian Two Sample Hypothesis Testing for
Online Controlled Experiments, Deng et al., Microsoft](https://exp-platform.com/Documents/BayesianAB.pdf)._

Instead of slightly unintuitive p-values (which users tend to conflate with the posterior probability of H<sub>0</sub>), Deng et al. propose using a metric called P-move, or 'probability of H1 (such that effect is positive)'.

They start by estimating prior values for _p_ (P(H<sub>1</sub>)) and _V_ (variance of Cohen's _d_ in previous experiments).

They then do this:
- Calculate a posterior of H<sub>1</sub> using the formula:

![](image/bayesian.png){alt="Bayesian EM expression for the posterior of H1" loading="lazy"}

- Under H<sub>1</sub>, the posterior of µ is N(Aδ, A/N<sub>E</sub>), where A = V<sup>2</sup>/(V<sup>2</sup> + 1/N<sub>E</sub>), a shrinkage factor that goes to 1 as N grows. So in effect for sufficiently big N, our posterior of µ under H<sub>1</sub> is normally distributed around δ with 1/N<sub>E</sub> (inverse of effective sample size or geometric mean of sample sizes) variance.

Then:

P(Flat) = P(H<sub>0</sub>\|Data)

P(Negative) = (1 − P(Flat)) × Φ(0; Aδ, A/N<sub>E</sub>) 

_(That is, the CDF evaluated to 0)_

and P(Positive) is the rest.

In effect, we're for sufficiently big N measuring how likely is the empirical data's effect size to come from a null-hypothesis (mean 0) distribution, given a prior on this being the case and on V's value.

For reasonable values of V this will converge nicely, and for any value of V it should be enough to set a high value of _p_ with non-zero effect size and enough data.

