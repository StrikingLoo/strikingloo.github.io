---
layout: post
date: 2021-01-16
title: "AUC and ROC"
description: "A few notes about ROC curves and the AUC -area under curve- metric."
tags: work, fraud, classifier, supervised learning
language: English
tags: programming, machine learning, python
importance: 3
---

AUC presents threshold invariance (no need to set a threshold as in accuracy) and scale invariance (if you scale all predictions linearly, but maintain ranking, then resulting auc is the same), which necessarily means that the AUC metric doesn’t depend on the chosen threshold or the scale of probabilities.

These properties make AUC pretty valuable for evaluating binary classifiers as it provides us with a way to compare them without caring about the classification threshold.

To plot a ROC (Receiver Operating Characteristic) curve, simply plot TPR as a function of FPR. That is, 

` true positives / total positives ` (recall) vs `false positives / total negatives ` (how many errors did you make in the negative case)

It can also be mathematically proven that AUC is equal to the probability that a classifier will rank a randomly chosen positive instance higher than a randomly chosen negative one.


*Source: [Guide to ROC Curves, Medium]*(https://towardsdatascience.com/an-understandable-guide-to-roc-curves-and-auc-and-why-and-when-to-use-them-92020bc4c5c1)

---

Small snippet for risk distribution plot.

```
positive_qty = df_a[df_a[LABEL]==1].count()['unique_id']
df_sym = pd.concat([df_a.loc[df[LABEL]==1], (df_a.loc[df[LABEL]==0]).sample(positive_qty)])
sns.displot(data=df_sym, x="prediction", hue=LABEL)
plt.title('Risk distribution')
```

Also possible to

> `sns.catplot(x='prediction', y=category, hue=LABEL, kind="box", data=df_a)`

### Related Reading
- [FID](/wiki/fid)
- [Permutation Importance](/wiki/feature-importance-rf) for feature selection in classifiers.
- [TF-IDF](/wiki/tf-idf) a metric for document retrieval and similarity.