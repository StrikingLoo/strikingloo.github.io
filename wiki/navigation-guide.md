---
layout: post
date: 2022-06-15
title: "Contents"
tags: meta, navigation, index, navigation guide, contents, table of contents
description: "A guide to navigate this personal wiki, linking the articles by type or category."
language: English
importance: 11
---

I maintain this [personal wiki](/wiki) for me and you. 

It is a place where I collect notes, clippings and thoughts about what I read, be it papers or books.

Unlike a blog, I don't usually write my opinions or present new information here. Rather, I use this site to organize what I learn and want to link to other ideas, maintaining evergreen notes in the way of Andy Matuschak and others.

If you wish to browse this wiki, you could also click any random article in the base page, or use the search bar (tag-based search is implemented, but it also _greps_ titles). 

You are encouraged to message me if any doubts arose about anything in this site, if further discussion is desired or if you have reflected on the topics presented here before.

The notes in the Garden are divided into certain kinds, and the following are the ones I think a reader may enjoy the most.

## Book Reviews

I store every quote I found especially interesting in each book on a separate page of this wiki. Here are presented the books where the notes were abundant enough to be interesting. \[articles under tag : *book*. See also [books category page](/tagged?q=books).]

- **["A Discovery of France", by Graham Robb](/wiki/a-discovery-of-france)**: A book about France's rural or non-Parisian population, its history and culture. It goes from the medieval age through the early modernity up to the 19th century. This article contains my favorite quotes and the ones I found most surprising, of which there were quite a few.
- **[“The Restless Republic”, by Anna Keay](/wiki/the-restless-republic)**: About Britain's Interregnum period and Oliver Cromwell, a beautiful book of history and biographies.
- **[“Soonish”, by Zach and Kelly Weinersmith](/wiki/soonish)**: About technology in the frontier of knowledge.
- **[“A Short History of Nearly Everything”, by Bill Bryson](/wiki/a-short-history-of-nearly-everything)**
- **["The Machinery of Life", by David S. Goodsell](/wiki/the-machinery-of-life)**: The author depicts with vivid illustrations and detailed descriptions what the inside of a cell (either human or bacterial) looks like, and various mechanisms underpinning life. This was one of the few books on biology I've read so far.

## Big Notes (MOOCs)

Big Notes encompass multiples sources, but usually form around a MOOC and then get updated as I go through the recommended reading.

- **[Deep Learning for Natural Language Processing, Stanford MOOC](/wiki/deep-learning-NLP)**: Covers RNNs, LSTMs, Word2Vec, BERT, Transformers.
- **[Unsupervised Learning, Berkeley MOOC](/wiki/unsupervised-learning-berkeley)**: An amazing course covering different techniques of Unsupervised Deep Learning, generative models, GANs, VAEs, etc.
- **[Recommender Systems](/wiki/recommender-systems)**: A summary of the Google course on the subject (under TensorFlow documentation), plus a few other articles covering Matrix Factorization and colaborative filtering.
- **[Reinforcement Learning, an Introduction by Richard Sutton](/wiki/reinforcement-learning-sutton)**: My notes and excerpts from the book, covering parts I and II (part III is examples and related topics). I summarize Dynamic Programming, Monte Carlo, Temporal Difference, Function Approximation and n-step methods, along with all their combinations.

## Papers

If I read a paper, find it interesting, and think I will want to think about it again in the future (especially if I plan on reading related papers later), I will write a summary of it and save the most important bits here. These are the papers I've read so far (mostly in the Machine Learning/Deep Learning space). \[under tag: [paper](/tagged?q=paper) ]

- **[GAN Survey, Goodfellow 2016](/wiki/GAN)**: A survey on Generative Adversarial Networks by Ian Goodfellow. That article also works as a hub for GAN related articles.
- **[CLIP: Learning Transferable Visual Models From Natural Language Supervision](/wiki/clip)**
- **[Denoising Diffusion Implicit Models](/wiki/ddim)
- **[GLIDE: Towards Photorealistic Image Generation and Editing with Text-Guided Diffusion Models](/wiki/glide)**: OpenAI's GLIDE combines a diffusion model with CLIP embedding conditioning to generate photorealistic images, conditioned on text prompts, that compare favorably to DALL-E when judged by humans.
- **[Glow: Generative Flow with Invertible 1×1 Convolutions](/wiki/flow-based-models-glow)**: An OpenAI flow model for image generation.  
- **[Natural Image Manipulation with Fisher Score](/wiki/natural-image-manipulation-fisher-score)**: A somewhat dated way of interpolating between images semantically, with an arbitrary generator.
- **[BERT Interpretability, Frankle and Carbin 2019](/wiki/bert-interpretability)**.
- **[TransGAN](/wiki/transGAN)**: A GAN purely based on transformers, trained using an adversarial objective.
- **[ViT: Transformers for Image Recognition](/wiki/visual-transformer)**: A pure transformer is used for image recognition tasks without any sort of convolutional layers and reaches state-of-the-art performance on multiple image recognition benchmarks.
- **[Vision Transformers See Like Convolutional Neural Networks](/wiki/visual-transformer) where activation distribution over different layers is observed and compared with ResNet and other CNNs. Correlations are measured, finding similar semantic extraction in the first layers of a CNN and ViT, and higher-order features that also shared a big mutual information in later layers, although ViT ultimately outperformed ResNet.
- **[Evolution through Large Models](/wiki/evolution-through-large-models)**: A new approach where a LLM is trained on synthetic data generated through an evolutionary process (MAP-Elites), to produce programs that solve an out-of-distribution task -Sodaracing-. RL is then used to create a generator of programs conditioned on terrains (so each problem gets a custom solution).
- **[Socratic Models: Composing Zero-Shot Multimodal Reasoning with Language](/wiki/socratic-models)**: An attempt at a more general agent by using multiples LLMs and making them interact in a zero-shot context to improve egocentric perception, video summarization, storytelling and question-answering. Not AGI, but not as far as it may be expected.
- **[Distilling the Knowledge in a Neural Network](/wiki/distilling-knowledge-nn)**: It is possible to compress the knowledge in an ensemble into a single model which is much easier to deploy.
- **[Proximal Policy Optimization](/wiki/proximal-policy-optimization)**: My description of the SotA RL Algorithm proposed by OpenAI and a summary of the ideas proposed in its paper.
- **[Fast String Searching](/wiki/fast-string-searching)**: Describes the string search algorithm underpinning grep and others. Not ML, but very interesting and a fun little algorithm.
- **[Diffusion Language Models](/wiki/diffusion-LM)**: A Stanford paper describing a new architecture and training method to make language models that are diffusion based instead of autoregressive. They allow for more controlled text synthesis albeit sacrificing perplexity (so far).
