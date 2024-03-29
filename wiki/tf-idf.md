---
layout: post
date: 2021-12-09
title: "tf-idf"
description: "How tf-idf works"
tags: NLP,nlp,tf-idf,metrics,metric,statistics,word embeddings,programming
language: English
uses_mathjax: true
importance: 4
---

TF-IDF of a word t in a document d is defined as the product between the term's frequency in the document, and its inverse document frequency.

Respectively, term frequency (tf) is how many times the word appears in the document (usually normalized by \|d\|) and idf matches {% raw %} \\\( \frac{N}{ \{d \mid t \in d\} }\\\){% endraw %}.

A TF-IDF encoding of a document would be, for each word t in the word universe, the respective tf-idf(t, d), generating a vector Xd.

Some common tf-idf functions are:

{% raw %} \\\( log(1 + f_{t,d})\*log(1+\frac{N}{n_{t}}) \\\) {% endraw %}

{% raw %} \\\(   \\\) {% endraw %}

```
from sklearn.feature_extraction.text import TfidfVectorizer
def vectorize(text, maxx_features):
    
    vectorizer = TfidfVectorizer(max_features=maxx_features)
    X = vectorizer.fit_transform(text)
    return X
```
