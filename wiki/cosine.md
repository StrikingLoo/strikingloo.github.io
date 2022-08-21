---
layout: post
title: "Ways cosine is computed in C"
date: 2022-03-29
description: "An analysis from HN where three different approaches are tried for computing cosine"
tags: math, hardware, taylor, programming
language: English
importance: 4
---
Source: <https://austinhenley.com/blog/cosine.html> 

Analyses how cosine is computed and benchmarks against math.h. 

Tries 3 different approaches: 

- Taylor series (with k terms) which gets perfect accuracy vs wolfram alpha/math.h, but is much slower. 
- Table lookup where you generate all values of cosine for multiples of 1e-k for some k between 0 and pi, and get the closest value (so for e.g., precision 0.1, you'd get same result for 0.15, 0.16, 0.199). 
- Finally, the best result comes from linear interpolation between subsequent lookups (0.15 would be (0.1+0.2)/2). 

Neat. This last one is faster and as accurate as math.h, except it takes up a big chunk of space.
