---
layout: post
title: "Permutation Importance"
date: 2021-09-10
tags: metrics, ml, xgboost, feature importance
description: "A metric for feature importance that doesn't require multiple trainings, preprocessing and is model independent."
language: English
---

<https://explained.ai/rf-importance/index.html>

Permutation importance is a common, reasonably efficient, and very reliable technique. It directly measures variable importance by observing the effect on model accuracy of randomly shuffling each predictor variable. This technique is broadly-applicable because it doesn't rely on internal model parameters, such as linear regression coefficients (which are really just poor proxies for feature importance). Thus this metric is **model independent**.

The most common mechanism to compute feature importances, and the one used in scikit-learn's RandomForestClassifier and RandomForestRegressor, is the mean decrease in impurity (or gini importance) mechanism (check out the Stack Overflow conversation). The mean decrease in impurity importance of a feature is computed by measuring how effective the feature is at reducing uncertainty (classifiers) or variance (regressors) when creating decision trees within RFs. The problem is that this mechanism, while fast, does not always give an accurate picture of importance. Breiman and Cutler, the inventors of RFs, indicate that this method of “adding up the gini decreases for each individual variable over all trees in the forest gives a fast variable importance that is often very consistent with the permutation importance measure.” (Emphasis ours and we'll get to permutation importance shortly.)

We've known for years that this common mechanism for computing feature importance is biased; i.e. it tends to inflate the importance of continuous or high-cardinality categorical variables For example, in 2007 Strobl et al pointed out in Bias in random forest variable importance measures: Illustrations, sources and a solution that “the variable importance measures of Breiman's original Random Forest method ... are not reliable in situations where potential predictor variables vary in their scale of measurement or their number of categories.” That's unfortunate because not having to normalize or otherwise futz with predictor variables for Random Forests is very convenient.

Record a baseline accuracy (classifier) or R2 score (regressor) by passing a validation set or the out-of-bag (OOB) samples through the Random Forest. Permute the column values of a single predictor feature and then pass all test samples back through the Random Forest and recompute the accuracy or R2. The importance of that feature is the difference between the baseline and the drop in overall accuracy or R2 caused by permuting the column. The permutation mechanism is much more computationally expensive than the mean decrease in impurity mechanism, but the results are more reliable. The permutation importance strategy does not require retraining the model after permuting each column; we just have to re-run the perturbed test samples through the already-trained model.

### Summary
The takeaway from this article is that the most popular RF implementation in Python (scikit) and R's RF default importance strategy do not give reliable feature importances when “... potential predictor variables vary in their scale of measurement or their number of categories.” (Strobl et al). Rather than figuring out whether your data set conforms to one that gets accurate results, simply use permutation importance. You can either use our Python implementation (rfpimp via pip) or, if using R, make sure to use importance=T in the Random Forest constructor then type=1 in R's importance() function.

There is rfpimp or also eli5 implements [permutation importance](https://eli5.readthedocs.io/en/latest/blackbox/permutation_importance.html).
