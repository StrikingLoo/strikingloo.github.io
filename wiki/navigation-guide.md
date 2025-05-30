---
layout: post
date: 2022-06-15
title: "Start Here - Entrance to the Garden"
tags: meta, navigation, index, navigation guide, contents, table of contents
description: "A guide to navigate this personal wiki, linking the articles by type or category."
language: English
importance: 11
---

Welcome to my [personal wiki](/wiki/).

This is a place where I collect notes, clippings and thoughts about what I read, be it papers or books. I tend to this wiki with love and care, and I am its main user, but I hope you will enjoy it too.

Unlike a blog, I don't usually write my opinions in the wiki. Rather, I use this part of the site to organize what I learn and want to link to other ideas, maintaining evergreen notes in the way of [Andy Matuschak](https://notes.andymatuschak.org/Evergreen_notes) and others.

You can browse this wiki by clicking any article that interests you, or use the search bar (tag-based search is implemented, but it also _greps_ titles) to find topics you like. Recommended tags: [paper](/tagged?q=paper), [programming](/tagged?q=programming), [book](/tagged?q=book).

You may also find the [Restaurant Guide](https://strikingloo.github.io/wiki/restaurant-guide) to be of some interest.

## Book Reviews

> I have sometimes dreamt, at least, that when the Day of Judgment dawns and the great conquerors and lawyers and statesmen come to receive their rewards — their crowns, their laurels, their names carved indelibly upon imperishable marble — the Almighty will turn to Peter and will say, not without a certain envy when He sees us coming with our books under our arms, "Look, these need no reward. We have nothing to give them here. They have loved reading." <br><i>- Virginia Woolf</i>

I save every quote I found especially interesting in each book on a separate page of this wiki. I also usually write a summary of the book and the impressions it left me. 

These are the books where the notes were abundant enough to be interesting. See also the [_books_ category page](/tagged?q=books) for more.

- **["A Discovery of France", by Graham Robb](/wiki/a-discovery-of-france)**: A book about France's rural or non-Parisian population, its history and culture. It goes from the medieval age through the early modernity up to the 19th century. This article contains my favorite quotes and the ones I found most surprising, of which there were quite a few.
- **[“The Restless Republic”, by Anna Keay](/wiki/the-restless-republic)**: About Britain's Interregnum period and Oliver Cromwell, a beautiful book of history and biographies.
- **[“Soonish”, by Zach and Kelly Weinersmith](/wiki/soonish)**: About technology in the frontier of knowledge.
- **[“A Short History of Nearly Everything”, by Bill Bryson](/wiki/a-short-history-of-nearly-everything)**
- **["The Machinery of Life", by David S. Goodsell](/wiki/the-machinery-of-life)**: The author depicts with vivid illustrations and detailed descriptions what the inside of a cell (either human or bacterial) looks like, and various mechanisms underpinning life. This was one of the few books on biology I've read so far.
- **[The Clock of the Long Now](https://strikingloo.github.io/wiki/clock-of-the-long-now)**: A book that supports and exposes the long term view. A foundational text for long-termism, and one of the texts that inspired Gwern to build his site. Also a very engaging and fast read, being a collection of short essays on diverse topics all playing around the idea of thinking of the very long term.
- **[The Ascent of Money, Niall Ferguson](/wiki/ascent-of-money)**: This book covers the history and importance of financial instruments: money, bonds, stock and insurance. It was a great resource after going through Marginal Revolution University's Macroeconomics course.
- **[Benjamin Franklin's Autobiography](/wiki/benjamin-franklin-autobiography)**: As a fan of 18th century history and political thought, especially of the revolutionary era and the Age of Enlightenment, I found this book fascinating, both because of Franklin's writing style and his portrayal of 18th century Pennsylvania.
- [Quotes and Passages from Pride and Prejudice](https://strikingloo.github.io/wiki/pride-and-prejudice)
- [Quotes from Building Microservices by Sam Newman - O'Reilly](https://strikingloo.github.io/wiki/oreilly-microservices)

## Online Courses

These notes encompass multiples sources, but usually form around a MOOC (_Massive Open Online Course_) and then get updates as I go through the recommended reading.

### Computer Science and Deep Learning

- [Deep Learning for Natural Language Processing, Stanford MOOC](/wiki/deep-learning-NLP)
- [Unsupervised Learning, Berkeley MOOC](/wiki/unsupervised-learning-berkeley)
- [Recommender Systems](/wiki/recommender-systems)
- [Reinforcement Learning, an Introduction by Richard Sutton](/wiki/reinforcement-learning-sutton)

### Economics

- [Macroeconomics - Marginal Revolution University](/macroeconomics-mru)
- [Economics of Money and Banking - Perry Mehrling](/money-and-banking)
- [The Ascent of Money - Book Notes](/ascent-of-money)

### History
- [Early Modern England - Yale History](/early-modern-england)

## Papers

If I read a paper, find it interesting, and think I will want to consider it again in the future (especially if I plan on reading related papers later), I will write a summary and save the most important discoveries or explanations. These are the papers I've read so far (mostly in the Machine Learning/Deep Learning space). \[Under tag: _[paper](/tagged?q=paper)_ ]

- **[GAN Survey, Goodfellow 2016](/wiki/GAN)**: A survey on Generative Adversarial Networks by Ian Goodfellow. That article also works as a hub for GAN related articles.
- **[CLIP: Learning Transferable Visual Models From Natural Language Supervision](/wiki/clip)**
- **[GLIDE: Towards Photorealistic Image Generation and Editing with Text-Guided Diffusion Models](/wiki/glide)**: OpenAI's GLIDE combines a diffusion model with CLIP embedding conditioning to generate photorealistic images, conditioned on text prompts, that compare favorably to DALL-E when judged by humans.
- **[Denoising Diffusion Implicit Models](/wiki/ddim)**
- **[Glow: Generative Flow with Invertible 1×1 Convolutions](/wiki/flow-based-models-glow)**: An OpenAI flow model for image generation.  
- **[Natural Image Manipulation with Fisher Score](/wiki/natural-image-manipulation-fisher-score)**: A somewhat dated way of interpolating between images semantically, with an arbitrary generator.
- **[BERT Interpretability, Frankle and Carbin 2019](/wiki/bert-interpretability)**.
- **[TransGAN](/wiki/transGAN)**: A GAN purely based on transformers, trained using an adversarial objective.
- **[Chinchilla: Training Compute-Optimal Large Language Models](/wiki/chinchilla)**: About Chincilla, scaling laws and their implications.
- **[ViT: Transformers for Image Recognition](/wiki/visual-transformer)**: A pure transformer is used for image recognition tasks without any sort of convolutional layers and reaches state-of-the-art performance on multiple image recognition benchmarks.
- **[Vision Transformers See Like Convolutional Neural Networks](/wiki/visual-transformer)** where activation distribution over different layers is observed and compared with ResNet and other CNNs. Correlations are measured, finding similar semantic extraction in the first layers of a CNN and ViT, and higher-order features that also shared a big mutual information in later layers, although ViT ultimately outperformed ResNet.
- **[Evolution through Large Models](/wiki/evolution-through-large-models)**: A new approach where a LLM is trained on synthetic data generated through an evolutionary process (MAP-Elites), to produce programs that solve an out-of-distribution task -Sodaracing-. Reinforcement Learning is then used to create a generator of programs conditioned on terrains (so each problem gets a custom solution).
- **[Socratic Models: Composing Zero-Shot Multimodal Reasoning with Language](/wiki/socratic-models)**: An attempt at a more general agent by using multiples LLMs and making them interact in a zero-shot context to improve egocentric perception, video summarization, storytelling and question-answering. Not AGI, but not as far as it may be expected.
- **[Distilling the Knowledge in a Neural Network](/wiki/distilling-knowledge-nn)**: It is possible to compress the knowledge in an ensemble into a single model which is much easier to deploy.
- **[Proximal Policy Optimization](/wiki/proximal-policy-optimization)**: My description of the State-of-the-Art Reinforcement Learning Algorithm proposed by OpenAI and a summary of the ideas proposed in its paper.
- **[Fast String Searching](/wiki/fast-string-searching)**: Describes the string search algorithm underpinning grep and others. Not ML, but very interesting and a fun little algorithm.
- **[Diffusion Language Models](/wiki/diffusion-LM)**: A Stanford paper describing a new architecture and training method to make language models that are diffusion based instead of autoregressive. They allow for more controlled text synthesis albeit sacrificing perplexity (so far).
- **[Brain Activity to Speech](/wiki/brain-activity-to-speech)**: a paper by Facebook Research where an embedding model is trained using a contrastive loss -like CLIP's- to align audio and brain (MEG and EEG) recordings, achieving lossy brain reading to audio conversion. They use non-invasive brain scanning methods.

If you have anything to say about one of the articles, you find an error in one of them or just like something you read and want to chat, don't be afraid to tweet at me or send me an email. I will reply kindly, and be happy if you reach out! I also answer DMs on Reddit.

## Size of the Site

In case someone may find it interesting, as we digital garden / personal knowledge management types like comparing sizes, here's how big the whole site is. I will update this every few months, as it doesn't grow that quickly anyways. _Last updated: Dec 19th, 2024._

```
Wiki
----
    Markdown files: 
        116
    lines: 
        14300
    word count: 
        181140

Blog 
----
    Markdown files: 
        19
    lines: 
        2842 total
    word count: 
        31934 total
```