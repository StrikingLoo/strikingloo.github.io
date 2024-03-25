---
layout: post
title: "Spearman Correlation"
date: 2024-03-25
tags: Statistics, metrics, math
description: "How to calculate Spearman Correlation, which measures correlation based on ranks instead of values."
language: English
importance: 4
---

## Spearman Correlation

Spearman's Correlation coefficient measures correlation based on variables' ranks instead of their values. It is more robust to outliers and ignores how spread out the values are, merely concerning itself with their ordering.

The formula is thus:

![](image/rank_correlation.svg){: alt="Spearman correlation formula" loading="lazy"}

- ρ = Spearman's rank correlation coefficient
- d<sub>i</sub>	=	difference between the two ranks of each observation (e.g. rank(X<sub>i</sub>) - rank(Y<sub>i</sub>))
- n = number of observations

