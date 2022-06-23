---
layout: post
date: 2022-06-15
title: "Navigation Guide"
tags: meta, navigation
description: "A helper to navigate this personal wiki, linking the articles by type."
---

This [personal wiki](/wiki) is first and foremost for my own personal use. A place where I collect notes, clippings and thoughts about what I read, be it papers or books.

Unlike a blog, I don't usually write my opinions or present new information here. Rather, I use this site to organize what I learn and want to link to other ideas (my private notes are more of a commonplace book, for quotes, extracts and small isolated paragraphs), maintaining evergreen notes in the way of Andy Matuschak and others.

Readers who wish to browse this wiki could click any random article in the base page, or use the search bar (tag-based search is implemented, but it also greps titles). 

The reader is encouraged to message me if any doubts arose about anything in this site, if further discussion is desired or if they came upon an interesting reflection on the same topics presented here.

### Book Reviews

I store every quote I found especially interesting in each book on a separate page of this wiki. Here are presented the books where the notes were abundant enough to be interesting. [articles under tag : *book*]

- [“A Short History of Nearly Everything”, by Bill Bryson](/wiki-articles/books/a-short-history-of-nearly-everything)
- [“Soonish”, by Zach and Kelly Weinersmith](/wiki-articles/books/soonish)
- [“The Restless Republic”, by Anna Keay](/wiki-articles/books/the-restless-republic)

### Papers

If I read a paper, find it interesting, and think I will want to think about it again in the future (especially if I plan on reading related papers later), I will write a summary of it and save the most important bits here. These are the papers I've read so far (mostly in the Machine Learning/Deep Learning space). [under tag: *paper*]

- [GAN Survey, Goodfellow 2016](/wiki-articles/machine-learning/GAN) : A survey on Generative Adversarial Networks by Ian Goodfellow. That article also works as a hub for GAN related articles.
- [BERT Interpretability, Frankle and Carbin 2019](/wiki-articles/machine-learning/bert-interpretability)
- [CLIP: Learning Transferable Visual Models From Natural Language Supervision](/wiki-articles/machine-learning/clip)
- [Denoising Diffusion Implicit Models](/wiki-articles/machine-learning/ddim)
- [Distilling the Knowledge in a Neural Network](/wiki-articles/machine-learning/distilling-knowledge-nn): It is possible to compress the knowledge in an ensemble into a single model which is much easier to deploy.
- [Glow: Generative Flow with Invertible 1×1 Convolutions](/wiki-articles/machine-learning/flow-based-models-glow): An OpenAI flow model for image generation. 
- [GLIDE: Towards Photorealistic Image Generation and Editing with Text-Guided Diffusion Models](/wiki-articles/machine-learning/glide): OpenAI's GLIDE combines a diffusion model with CLIP embedding conditioning to generate photorealistic images, conditioned on text prompts, that compare favorably to DALL-E when judged by humans. 
- [Natural Image Manipulation with Fisher Score](/wiki-articles/machine-learning/natural-image-manipulation-fisher-score): A somewhat dated way of interpolating between images semantically, with an arbitrary generator.
- [Evolution through Large Models](/wiki-articles/machine-learning/evolution-through-large-models): A new approach where a LLM is trained on synthetic data generated through an evolutionary process (MAP-Elites), to produce programs that solve an out-of-distribution task -Sodaracing-. RL is then used to create a generator of programs conditioned on terrains (so each problem gets a custom solution).

### Big Notes (MOOCs)

Big Notes encompass multiples sources, but usually form around a MOOC and then get updated as I go through the further readings.

- [Deep Learning for Natural Language Processing, Stanford MOOC](/wiki-articles/machine-learning/deep-learning-NLP): Covers RNNs, LSTMs, Word2Vec, BERT, Transformers.
- [Unsupervised Learning, Berkeley MOOC](/wiki-articles/machine-learning/unsupervised-learning-berkeley): An amazing course covering different techniques of Unsupervised Deep Learning, generative models, GANs, VAEs, etc.
- [Recommender Systems](/wiki-articles/machine-learning/recommender-systems) : A summary of the Google course on the subject (under TensorFlow documentation), plus a few other articles covering Matrix Factorization and colaborative filtering.
