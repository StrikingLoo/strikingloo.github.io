---
layout: post
date: 2021-10-25
title: "CLIP: Learning Transferable Visual Models From Natural Language Supervision"
tags: deep learning,CNN,NLP,transformers,resnet,unsupervised learning,paper,generative models,generative
description: "Notes on the CLIP paper, a very clever contrastive training regime that maps both textual and image inputs into a shared latent universe, to then apply semantically meaningful distance notions and generate images or text."
---

State-of-the-art computer vision systems are
trained to predict a fixed set of predetermined
object categories. This restricted form of supervision limits their generality and usability since
additional labeled data is needed to specify any
other visual concept. Learning directly from raw
text about images is a promising alternative which
leverages a much broader source of supervision.

We demonstrate that the simple pre-training task
of predicting which caption goes with which image is an efficient and scalable way to learn SOTA
image representations from scratch on a dataset
of 400 million (image, text) pairs collected from
the internet.

we match the accuracy of the original ResNet-50 on ImageNet
zero-shot without needing to use any of the 1.28
million training examples it was trained on.

- Model available on [GitHub](https://github.com/OpenAI/CLIP)
- A nice client I've been using: [here](https://github.com/nerdyrodent/VQGAN-CLIP).

The line of work of semi-supervised learning using images with a hashtag related to a imagenet label, or pretraining on a very big dataset noisily labelled (JFT-300M) represents the current pragmatic middle ground between learning from a limited amount of supervised “gold-labels” and learning from practically unlimited amounts of raw text. 

Both works limit their supervision to 1000 and 18291 classes respectively.
Natural language is able to express, and therefore supervise, a much wider set of visual concepts through its generality. Both approaches also use static softmax classifiers to
perform prediction and lack a mechanism for dynamic outputs. This severely curtails their flexibility and limits their “zero-shot” capabilities.

We create a new dataset of 400 million (image, text) pairs and demonstrate that a simplified version of
ConVIRT trained from scratch, which we call CLIP, for Contrastive Language-Image Pre-training, is an efficient method
of learning from natural language supervision.

CLIP grows capable of competitive zero-shot transfer performance in a battery of benchmarks.

- We also confirm these findings with linear-probe representation learning analysis and show that CLIP outperforms the best publicly available ImageNet model while also being more computationally efficient. 
- We additionally find that zero-shot CLIP models are much more robust than equivalent accuracy supervised ImageNet models which suggests that zero-shot evaluation of task-agnostic models is much more representative of a model’s capability.

 we constructed a new dataset of 400 million (image,
text) pairs collected form a variety of publicly available
sources on the Internet. To attempt to cover as broad a set
of visual concepts as possible, we search for (image, text)
pairs as part of the construction process whose text includes
one of a set of 500,000 queries (words occurring at least 100 times in
the English version of Wikipedia) and take up to 20k images per query. The resulting dataset has a similar total
word count as the WebText dataset used to train GPT-2. 

> Recent work in contrastive representation learning for images has found that contrastive objectives can learn better representations than their equivalent predictive objective (predicting the embedding instead of the discrete word is better).

 Noting these findings, we explored training
a system to solve the potentially easier proxy task of predicting only which text as a whole is paired with which
image and not the exact words of that text. Starting with
the same bag-of-words encoding baseline, we swapped the
predictive objective for a contrastive objective in Figure 2
and observed a further 4x efficiency improvement in the rate
of zero-shot transfer to ImageNet.

Given a batch of N (image, text) pairs, CLIP is trained to
predict which of the N × N possible (image, text) pairings
across a batch actually occurred. To do this, CLIP learns a
multi-modal embedding space by jointly training an image
encoder and text encoder to maximize the cosine similarity of the image and text embeddings of the N real pairs
in the batch while minimizing the cosine similarity of the
embeddings of the N2 − N incorrect pairings.

We optimize a symmetric cross entropy loss over these similarity
scores.

## Architecture

Two versions for image encoder:
- **ResNet-50**[🌱](https://arxiv.org/pdf/1512.03385.pdf) with a few modifications.
- **ViT**: closely following [previous implementation](/wiki-articles/machine-learning/visual-transformer).

The text encoder is a Transformer with input capped at 76 characters. The text sequence is bracketed with [SOS] and [EOS] tokens and the activations of the highest layer of the transformer at the [EOS] token are treated as the feature representation of the text which is layer normalized and then linearly projected into the multi-modal embedding space.

> "To save additional memory, gradient checkpointing (Griewank & Walther, 2000;
Chen et al., 2016), half-precision Adam statistics (Dhariwal
et al., 2020), and half-precision stochastically rounded text
encoder weights were used." (gotta look all of these up).

Every step of CLIP pre-training can
be viewed as optimizing the performance of a randomly
created proxy to a computer vision dataset which contains 1
example per class and has 32,768 total classes defined via
natural language descriptions. For zero-shot evaluation, we
cache the zero-shot classifier once it has been computed by
the text encoder and reuse it for all subsequent predictions.

Another issue we encountered is that it’s relatively rare in
our pre-training dataset for the text paired with the image
to be just a single word. Usually the text is a full sentence
describing the image in some way. To help bridge this
distribution gap, we found that using the prompt template
**“A photo of a {label}.”** to be a good default that
helps specify the text is about the content of the image.
This
often improves performance over the baseline of using only
the label text. For instance, just using this prompt improves
accuracy on ImageNet by 1.3%.

We’ve observed ensembling -by averaging embedding representations over many different textual prompts and caching them, which quickly gets amortized- across many generated zero-shot classifiers to reliably improve performance.

For fine-grained classification, it works to add, "a photo of a X, a type of Y".

Using a linear probe, CLIP beats other models in a few-shot context (up to 16 instances), and interestingly its 0-shot approach beats few shots up to 4.
Zero-shot CLIP performs competitively against fully supervised Linear Probe on ResNet50 on a wide array of tasks (wins in 16/27 datasets).

However, models trained with CLIP scale very well
and the largest model we trained (ResNet-50x64) slightly
outperforms the best performing existing model (a Noisy
Student EfficientNet-L2) on both overall score and compute
efficiency -on linear probe accuracy over 27 datasets, a standard benchmark-. We also find that CLIP vision transformers are
about 3x more compute efficient than CLIP ResNets, which
allows us to reach higher overall performance within our
compute budget
and use it for the majority of datasets.

Note that by this point, a CLIP ViT has a transformer for textual representation, a transformer for image representation, and just does dot product between them, so it's transformers all the way down. Linear probe CLIP ViT beats other models in 21/27 tasks.
