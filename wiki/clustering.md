---
layout: post
date: 2021-07-01
title: "Clustering"
tags: clustering,unsupervised learning,k-means,dbscan,machine learning
description: "My notes from O'Reilly's Hands-on Machine Learning's Clustering chapter, plus other sources (like Bishop)."
language: English
importance: 7
---
> Notes from the Hands-on Machine Learning O'Reilly book on the Clustering section (Unsupervised Learning chapter).

### Uses of clustering algorithms
- As a dimensionality reduction technique
Once a dataset has been clustered, it is usually possible to measure each instance’s
affinity with each cluster (affinity is any measure of how well an instance fits into
a cluster). Each instance’s feature vector x can then be replaced with the vector of
its cluster affinities. If there are k clusters, then this vector is k-dimensional. This
vector is typically much lower-dimensional than the original feature vector, but it
can preserve enough information for further processing.
- For anomaly detection (also called outlier detection)
Any instance that has a low affinity to all the clusters is likely to be an anomaly
- For search engines or recommender systems
Suggest content that falls in the same cluster, or that other users in the same cluster enjoyed.
- For semi-supervised learning

Instead of assigning each instance to a single cluster, which is called *hard clustering*, it can be useful to give each instance a score per cluster, which is called *soft clustering*. 

The score can be the distance between the instance and the centroid; conversely, it can be a similarity score (or affinity), such as the Gaussian Radial Basis Function (e^(-r^2)).

> A Voronoi Diagram partitions a 2d plane into regions by how close they are (given some measure) to particular points. For instance, the regions that lie closest to each cluster in a plane.

### Clustering performance metrics
We define a clustering's inertia as the aggregated distance from each instance to its assigned centroid (within-cluster sum-of-squares criterion). Some algorithms (like skl's) try N initializations and keep the one that yields the lowest inertia.

Inertia makes the assumption that clusters are convex and isotropic, which is not always the case. It responds poorly to elongated clusters, or manifolds with irregular shapes.

Inertia is not a normalized metric: we just know that lower values are better and zero is optimal. But in very high-dimensional spaces, Euclidean distances tend to become inflated (this is an instance of the so-called “curse of dimensionality”). Running a dimensionality reduction algorithm such as Principal component analysis (PCA) prior to k-means clustering can alleviate this problem and speed up the computations.

Inertia itself is not a good metric for choosing k (though it is god for choosing the best clustering out of many with the same k). 
However if we plot inertia as a function of k, and see a sudden elbow, that's a coarse rough way of deciding on a k-value. It can fail often, but is better than nothing.

A more sensitive measure, though harder to compute, is using the silhouette coefficient.
This calculates the silhouette coefficient (a - b)/max(a,b) for a point x, where a is the "intra cluster mean distance" (mean distance between x and every single point in the cluster it was assigned to) and b is the mean nearest-cluster distance (mean distance to points in the second closest cluster -centroid is second closest-). This goes between -1 and 1. 1 means everything is good. 0 means this is a boundary item, and -1 means this item may have been misclustered.

### Smarter initialization
Proposed by David Arthur and Sergei Vassilvitskii, “k-Means++: The Advantages of Careful Seeding,” 2007.
Selects initial centroids that are distant to each other.

- Take the first centroid chosen sampled randomly from dataset.
- Take the c\_i-th centroid sampling an instance such that P(x\_i) = D(x\_i)^2 / sum( D(X\_j)^2 )  Where D(x) is distance from x to closest centroid already chosen.

Equivalently: take f(x) = D(x)^2. Sample with probability proportional to f(x), normalized, where D takes a point and returns the shortest distance from it to any already chosen centroid.

There are mini-batch implementations in case the whole dataset doesn't fit into memory.

Some of the limitations of k-means are it works better with spherical clusters (and breaks more if clusters are elliptical, or other elongated shapes). To do semi-supervised learning, you can fit a clustering algorithm to your labeled data, then predict clusters for part of the unlabeled one and assign a "propagated label" to each instance, where the propagated label belongs to the "representative class" for that cluster. To get the representative class yo utake the labeled instance with the minimum distance to the centroid for that cluster.

Interestingly, you could only propagate labels for the top 80% "most certain" instances. This means the top 20% instances with the biggest distance to their respective cluster (grouped by each cluster, not globally as some clusters may be bigger than others). In practice this may yield better results, as instances in the boundaries are a less certain bet.

## DBSCAN
This algorithm defines clusters as continuous regions of high density. 
It goes as follows:
- Define an epsilon and a min\_samples parameter. For each instance, see its surrounding epsilon-radius area. Count how many instances it has. If it's >= min\_samples, then it's a core instance. Otherwise it is not.
- For each core instance, all instances in its neighborhood are assigned the same cluster. This includes other core instances, so clusters keep merging until all core instances are transitively joined.
- Points that weren't core instances or in the vicinity of one, are considered anomalies (typically cluster\_id = -1).

This generates an a priori unknown number of clusters, with different thresholds for epsilon yielding less bigger clusters, and smaller values making a more fractioned division.

The algorithm works better when most clusters are comparatively dense. For bigger and smaller clusters of different density it may break.
To assign a cluster to a new instance, you may take the closest k-neighbors to it, and do k-NN using the cluster indices as labels.

## See also

- [Deep Unsupervised Learning](/wiki/unsupervised-learning-berkeley)