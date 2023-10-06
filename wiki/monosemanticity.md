---
layout: post
title: "Towards Monosemanticity"
date: 2023-10-05
tags: interpretability, mechanistic, neural networks, transformers, LLMs
description: ""
language: English
importance: 6
---

Notes on the [Amazing paper from Anthropic on Monosemantic Features](https://transformer-circuits.pub/2023/monosemantic-features/index.html)

> Mechanistic interpretability seeks to understand neural networks by breaking them into components that are more easily understood than the whole. By understanding the function of each component, and how they interact, we hope to be able to reason about the behavior of the entire network. The first step in that program is to identify the correct components to analyze.

> Unfortunately, the most natural computational unit of the neural network – the neuron itself – turns out not to be a natural unit for human understanding. This is because many neurons are polysemantic: they respond to mixtures of seemingly unrelated inputs. (...) <br>In a small language model we discuss in this paper, a single neuron responds to a mixture of academic citations, English dialogue, HTTP requests, and Korean text. Polysemanticity makes it difficult to reason about the behavior of the network in terms of the activity of individual neurons.

> In our previous paper on Toy Models of Superposition, we showed that superposition can arise naturally during the course of neural network training if the set of features useful to a model are sparse in the training data. As in compressed sensing, sparsity allows a model to disambiguate which combination of features produced any given activation vector. _\[So the features form an overcomplete linear basis for the activations of the neurons]_.

> In this paper, we use a weak dictionary learning algorithm called a sparse autoencoder to **generate learned features from a trained model that offer a more monosemantic unit of analysis than the model's neurons** themselves. 

> The goal of this paper is to provide a detailed demonstration of a sparse autoencoder compellingly succeeding at the goals of extracting interpretable features from superposition and enabling basic circuit analysis.

(OMG)

> We take a one-layer transformer with a 512-neuron MLP layer, and decompose the MLP activations into relatively interpretable features by training sparse autoencoders on MLP activations from 8 billion data points. \[They end up focusing on the 4096 neurons AE].

### Summary of Claims

This is all mostly copy paste

- Sparse Autoencoders extract relatively monosemantic features.
- Sparse autoencoders produce interpretable features that are effectively invisible in the neuron basis.
- Sparse autoencoder features can be used to intervene on and steer transformer generation.
- Sparse autoencoders produce relatively universal features. \[They hold accross models].

> In some sense, this is the simplest language model we *profoundly don't understand*. And so it makes a natural target for our paper.

The sparse autoencoder is 1 ReLU (up) and 1 Linear (down).

They decompose the MLP layer into linear matrix factorization.

![](resources/post_image/mechanistic-interpretability-1.png)

Where d<sub>i</sub> are directions in feature space and f<sub>i</sub> are (scalar) activations, given by the encoder (which is a relu expanding layer).

At this point, they address something I was wondering from the start (my words would have been 'is this *pareidolia*?').

> If such a sparse decomposition exists, it raises an important question: are models in some fundamental sense composed of features or are features just a convenient post-hoc description? In this paper, we take an agnostic position, though our results on feature universality suggest that features have some existence beyond individual models.

> At the heart of dictionary learning is an inner problem of computing the feature activations fi(x) for each datapoint x, given the feature directions di. On its surface, this problem may seem impossible: we're asking to determine a high-dimensional vector from a low-dimensional projection. Put another way, we're trying to invert a very rectangular matrix. The only thing which makes it possible is that we are looking for a high-dimensional vector that is sparse! This is the famous and well-studied problem of compressed sensing, which is NP-hard in its exact form. It is possible to store high-dimensional sparse structure in lower-dimensional spaces, but recovering it is hard.

### Training the Autoencoder

> We found that over the course of training some neurons cease to activate, even across a large number of datapoints. We found that “resampling” these dead neurons during training gave better results by allowing the model to represent more features for a given autoencoder hidden layer dimension. Our resampling procedure is detailed in Neuron Resampling, but in brief we periodically check for neurons which have not fired in a significant number of steps and reset the encoder weights on the dead neurons to match data points that the autoencoder does not currently represent well.

### Token Motifs

> Finally, it's worth noting that all the features we find in a one-layer model can be interpreted as "action features" in addition to their role as "input features". For example, a base64 feature can be understood both as activating in response to base64 strings, and also as acting to increase the probability of base64 strings. 

(They mention the striking pervasiveness of 'token in context' features).

