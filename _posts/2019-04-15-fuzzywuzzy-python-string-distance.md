---
title: "FuzzyWuzzy: How to Measure String Distance in Python"
description: "Fuzzy string matching and string similarity. This is how FuzzyWuzzy works and how you can use it."
layout: post
tags: programming,computer science,feature engineering,python
date: 2019-04-15
importance: 5
sitemap: true
twitter_image: "https://strikingloo.github.io/resources/post_image/fuzzyplant.jpeg"
---

*Note: I originally wrote this article on my first blog, so it is not as polished as newer things.*

Python’s _FuzzyWuzzy_ library is used for measuring the similarity between two strings. Here’s how you can start using it too.

Sometimes, we need to see whether two strings are the same. When comparing an entered password’s hash to the one stored in your login database, ‘similarity’ just won’t cut it.

Other times, however, things can get a bit… _fuzzier_.

If my customer’s name is _Albert Thompson_, but he pays with a Credit Card under the name of _Albert G. Thompson_, should I be calling the police to report fraud? Should “The Lord of the Rings II: The Two Towers” and “The Lord of the Rings 2: the 2 Towers” be treated as two completely separate books by a website? Are Austria and Australia really two different countries?

Okay, I may have gotten carried away with that last one, but you get the idea.

## String distance measures

What we want is some function that measures how similar two strings are, but is robust to small changes. This problem is as common as it sounds: scientists have been coming up with solutions to it for a long while.

### Jaccard Distance: a first approach

One of the most intuitive ones is the Jaccard distance. It can be generalized to a distance measure for any two sets. It has the following formula:

![Formula for the Jaccard String Distance](/resources/post_image/fuzzywuzzy1.svg){: loading = "lazy" class="invertible"}

That is, how many elements are on either set, but not shared by both, divided by the total count of distinct elements.

For instance, given the strings “Albert” and “Alberto”, it will report a similarity of 85.7%, since they share 6 letters out of a total of 7.

However, this is not a measure specifically tailored for strings.

It will fail in many use-cases, since it doesn’t really take ordering into account. For example two anagrams, like “rail safety” and “fairy tales”, will always have a 100% match, even if those strings are quite different.

### Levenshtein Distance

Invented by the Russian Scientist Vladimir Levenshtein in the ’60s, this measure is a bit more intuitive: it counts how many substitutions are needed, given a string _u_, to transform it into _v_.

For this method, a substitution is defined as:

- Erasing a character.
- Adding one.
- Replacing a character with another one.

The minimum amount of these operations that need to be done to _u_ in order to turn it into _v,_ correspond to the Levenshtein distance between those two strings.

It can be obtained recursively with this formula:

![Levenshtein Distance Formula](/resources/post_image/fuzzywuzzy2.svg){: loading = "lazy" class="invertible"}

Where _i_ and _j_ are indexes to the last character of the substring we’ll be comparing. The second term in the last expression is equal to 1 if those characters are different, and 0 if they’re the same.

This is the measure Python's FuzzyWuzzy library uses.

## Using FuzzyWuzzy in Python

To obtain the similarity ratio between two strings, all we have to do is this:

```
from fuzzywuzzy import fuzz
similarity = fuzz.ratio("hello","world")
```

You probably noticed I said ratio. The ratio method will always return a number between 0 and 100 (yeah, I’d have preferred it to be between 0 and 1, or call it a percentage, but to each their own).

It can be shown that the Levenshtein distance is at most the length of the longest string: replace all characters in the shorter one with the first part of the longer one, and then add the remaining ones.

That’s how we can normalize the distance to return a ratio, so that the number won’t fluctuate enormously given inputs with different sizes.

This solves some of the previously mentioned problems:

```
fuzz.ratio("Albert Thompson", "Albert G. Thompson") #91%

fuzz.ratio("The Lord of the Rings II: The Two Towers",
 "The Lord of the Rings 2: the 2 Towers") #88%
```

Even if it may bring a few new ones:

```
#88% for two different countries
fuzz.ratio("Austria","Australia")

#57% but it's the same country
fuzz.ratio("Czechia","Czech Republic")
```

## Other FuzzyWuzzy methods

Python's FuzzyWuzzy library provides us not only with the vanilla Levenshtein distance, but also with a few other methods we can make use of.

### partial\_ratio

The _partial\_ratio_ method calculates the FuzzyWuzzy ratio for all substrings of the longer string with the length of the shorter one, and then returns the highest match.

For instance,

```
fuzz.partial_ratio("abc","a") == 
min([fuzz.ratio( char, "a") for char in "abc"])
```

This has some interesting effects:

```
fuzz.partial_ratio("Thomas and His Friends", "Thomas") #100%
fuzz.partial_ratio("Batman vs Superman", "Batman") #100%
```

Effectively, the partial\_ratio method could be a fuzzy replacement to the _contains_ string method, just as the regular ratio may replace the _equals_ method.

However, it will fail for strings that are similar, but whose words appear in a different order. Even a slight order change will break it.

```
#72% with basically the same idea
fuzz.partial_ratio("Peanut Butter and Jelly",
 "Jelly and Peanut Butter") 

#86% with a random (carefully selected) string
fuzz.partial_ratio("Peanut Butter and Jelly",
 "Otter and Hell")
```

### token\_sort\_ratio

The Token Sort Ratio divides both strings into words, then joins those again alphanumerically, before calling the regular ratio on them.

This means:

```
fuzz.partial_ratio("Batman vs Superman", 
 "Superman vs Batman") #100%

fuzz.partial_ratio("a b c", "c b a") #100%
```

### token\_set\_ratio

The Token Set Ratio separates each string into words, turns both lists into sets (discarding repeated words) and then sorts those before doing the ratio.

This way not only do we rule out shared words, we also account for repetitions.

```
fuzz.token_set_ratio("fun","fun fun fun") #100%

fuzz.token_set_ratio("Lord the Rings of",
 "Lord of the Rings") #100%
```

## Conclusions

Python's FuzzyWuzzy library can be a useful tool to have under your belt. Both for customer’s names matching, or acting as a poor man’s word embedding, it can save you a lot of trouble or help with your Machine Learning model’s feature engineering.

However, since it requires preprocessing (like turning both strings to lowercase) and doesn’t take synonyms into account, it may not be the best solution for cases where actual NLP or [Clustering methods](/wiki/clustering) may be needed.

I hope you’ve found this article helpful, and let me know if you find another use for FuzzyWuzzy in your job.

_Follow me on [Twitter](http://www.twitter.com/strikingloo) to stay up to date with more Python tutorials, tips and tricks._

_If you found this article useful, please consider sharing it on social media._

_For other programming notes and articles, visit the [programming tag page](/tagged?q=programming)._