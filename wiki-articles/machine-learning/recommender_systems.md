---
layout: post
date: 2020-11-05
title: "Recommender Systems"
description: "My notes from Andrew Ng's Lectures on Recommendation Systems, plus some papers and other sources."
---

# Recommender Systems

## Problem Statement

We have a matrix with rows for movies, columns for users. We have some ratings for a pair of coordinates u, m, and some tuples have no corresponding rating. 

We'd like to fill the unknown ratings with "coherent" ratings, for some definition of coherent.

For instance, we could cluster or categorize the movies, then give to a movie of category A the rating X for user U, where X is the mean rating for movies in that category for that user.

## Content Based Recommendation 

![](recommender_systems_img/reco1.png){: style="height:70%; width:70%"}

For each user, we train a small linear regression from a set of precomputed features for each movie they rated, and use that to predict ratings for new movies. This shouldn't work for a user with no previous ratings, and is only as good as the features we use. 

You can train all the linear regressions at once using a matrix, and you can avoid the closed optimization using gradient descent.

## Collaborative Filtering

Collaborative Filtering does feature learning.

Imagine we don't have feature vectors for each movie, because they're intractable, expensive or hard to get.

Instead, we could ask the users to tell us which genres of movies they like, by rating K of them from 0 to 5. We could then make "user vectors", and try to fit a linear regression with K components for each movie, for each user that rated it, to predict said ratings. 

The coefficients in those linear regressions (one vector for each movie, with as many parameters as genres we chose for the users to rate) would make the feature vectors for each movie.

We are making one vector for each movie, so we end up running one linear regression over the M users that rated each movie.


Now let's take it one step further: we could start off with random user vectors for each user, and use them to make some half-baked movie vectors by fitting a linear regression. We then generate user vectors by fitting linear regressions from the movie vectors we just made. We repeat this for the movies, and so on, until convergence.

This actually works pretty well, though there are available improvements (especially in terms of time).

A way to improve this: You only have the ratings, and don't ask anything from the users or hand make any features. Instead you just make a set of x vectors (for users) and theta vectors (for movies) such that for each movie, user pair that actually has a rating, the inner product of both corresponding vectors yields the correct rating.

Note that this is equivalent to factoring the ratings matrix into two smaller matrices (one of user vectors, one of movie vectors) and that each have a dimension in common of arbitrary size (let's call it K), which is the "latent" dimension.

![]((recommender_systems_img/reco1.png){: style="height:70%; width:70%"}

Things you can add to improve this:
If a user is watching movie i, you can do k-NN over the latent space for movie i to get the k closest movies and recommend them as "similar" movies.

If a user has never rated any movies, we can use mean normalization:  
- Compute the mean (ground truth, not predicted) rating for each movie.
- Subtract it from the ground-truth ratings for each movie (so each movie now has a mean-rating of 0).
- Retrain the model (recomputing the factor matrices) with the new normalized ratings. New prediction is: prediction of new model, plus mu_i (the mean ground-truth rating for that movie).
- Now for a user with no ratings, we're predicting the mean ground truth rating for each movie as a default, which is a lot better than nothing. We recommend the most popular movies to blank slate users until we know more about them. We could also ask them about what they like to improve the algorithm.
