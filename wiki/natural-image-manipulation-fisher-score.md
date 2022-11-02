---
layout: post
date: 2021-10-03
title: "Natural Image Manipulation with Fisher Score"
tags: deep learning, neural network, PixelCNN, unsupervised learning, convolutional neural networks, paper, autoregressive
description: "Notes from a paper on using fisher scores to generate an embedding space given a generative model. Used to interpolate images semantically."
language: English
importance: 5
---

<https://arxiv.org/pdf/1912.05015.pdf>

Notes from a paper on using Fisher scores to generate an embedding space given a generative model. Used to interpolate images semantically, when combined with a decoder.

Latent variable models such as VAEs and normalizing flows allow meaningful semantic manipulations in latent space, which autoregressive models do
not have. In this paper, we propose using Fisher scores as a method to extract
embeddings from an autoregressive model to use for interpolation and show that
our method provides more meaningful sample manipulation compared to alternate
embeddings such as network activations.

We propose a method of image interpolation and manipulation in a latent space defined
by the Fisher score of both discrete and continuous autoregressive models. We use PixelCNNs
to model the natural image distribution and use them to compute Fisher scores. In order to map
back from Fisher score space to natural images, we train a decoder by minimizing reconstruction
error. We show that interpolations in Fisher score space provide higher-level semantic meaning
compared to baselines such as interpolations in PixelCNN activation space, which produce blurry
and incoherent intermediate interpolations similar in nature to interpolations using pixel values.

As such, we can see the collection of Fisher scores as a high dimensional embedding space in which
more meaningful information about the data distribution can be extracted compared to raw pixel
values. More complex deep generative models may learn parameters that encode information at
high-levels of abstraction which may be reflected as high-level features in Fisher scores.

### [Sparse Random Projections](#sparse-random-projections)
It would be cumbersome to work in the very high-dimensional parameter spaces of deep generative
models, so we use dimensionality reduction methods to make our methods more scalable. Sparse
random projections allow for memory-efficient and scalable projections of high dimensional vectors. The Johnson-Lindenstrauss Lemma (Dasgupta & Gupta, 1999) states that under a suitable
orthogonal projection, a set of n points in a d-dimensional space can be accurately embedded to
some k-dimensional vector space, where k depends only on log n. Therefore, for suitably large k,
we can preserve the norms and relative distances between projected points, even for very high dimensional data. Since sparse random matrices are nearly orthogonal in high-dimensional settings,
we can safely substantially reduce the dimensionality of our embedding spaces using this method.

### [Decoder](#decoder)
Regardless of whether we use Fisher scores or network activations as embedding spaces, doing any sort of image manipulation in a generated embedding space requires a mapping back from zi to xi. To solve this problem, we learn a mapping back from zi to xi by training a network to model the density p(xi |zi). We try both supervised and unsupervised learning approaches, either directly learning a decoding model to minimize reconstruction error, or implicitly learn reconstruction by
training a conditional generative model, such as another autoregressive model or a flow.

### [Semantic Manipulation](#semantic-manipulation)
For some attribute, let zpos be the average of all embedding
vectors with the attribute, and zneg be the average of all embedding vectors without the attribute. We
can then apply or remove the attribute by manipulating a given embedding vector in the direction
of δ = zpos − zneg or its negation. For our experiments, we found that scaling δ by a factor of 3
was enough to see visible change in our images. 

The method of using Fisher scores tends to encourage more natural semantic manipulations in adding a smile, or
adding eyeglasses compared to activation embeddings, which tend to ”paste” generic smiles and glasses on top of each face.

---

They measure the quality of interpolated images using FID (Frechet Inception Distance), a metric from GANs. They generate N sets of interpolated images varying alpha, and compute FID between the generated and original image sets. Good interpolations result in lower FID scores, and bad interpolations produce peaked FID scores at α = 0.5.

They then present results both quantitative (with FID scores) and qualitative (progression pics) that show that fisher scores capture semantic information, independent of the generative model's arquitecture and complexity (they try many different ones) and the decoder's size or complexity.

I love this approach and wonder whether it would work for other spaces (like audio). I personally don't like the name "Fisher **score**" as it is a vector.

### [See also](#see-also)

- [GLOW: Flow-Based Models](/wiki/flow-based-models-glow)
- [Unsupervised Learning](/wiki/unsupervised-learning-berkeley)