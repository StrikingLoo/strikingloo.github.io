---
layout: post
date: 2022-01-07
title: "GLIDE: Towards Photorealistic Image Generation and Editing with Text-Guided Diffusion Models"
tags: deep learning,unsupervised learning,paper,generative models,generative,diffusion,guided diffusion,glide,CLIP,clip
description: "Notes on the GLIDE paper, a generative model that outperforms DALL-E using similar compute by training a diffusion model using a CLIP-aware loss + CFG"
---

<https://arxiv.org/pdf/2112.10741.pdf>

GLIDE combines a diffusion model with CLIP embedding conditioning to generate photorealistic images, conditioned on text prompts, that compare favorably to DALL-E when judged by humans. Images can also be initialized as a rough sketch in a zero-shot regime, and iteratively improved through extra prompts and "inpainting", where a piece of the image is masked and only that is filled.

In a **diffusion model**, an image is iteratively added Gaussian noise ~N(0, (1 − αt)I), and then a model is trained to reconstruct mu and sigma for the step xt-1 given xt, iteratively (sharing weights) until x0 is the image. In practice, the model fits both mu and sigma, and the loss function takes the distance between predicted and actual noise for each step.

![](image/diffusion.png)
[Source](https://lilianweng.github.io/lil-log/2021/07/11/diffusion-models.html)

**Guided diffusion** additionally conditions reconstruction on a label y, using a classifier so that µθ(xt\|y) = µθ(xt\|y) + s · Σθ(xt\|y)∇xt \* log pφ(y\|xt). 

**Classifier free guidance** additionally masks out X% of the labels for a null label (in CLIP this is replaced with the embedding for empty sequence) and trains on the difference between the classifier predicting y vs empty.

eˆθ(xt\|c) = eθ(xt\|∅) + s · (eθ(xt\|c) − eθ(xt\|∅))

For **CLIP guidance**, they do the same as in guided diffusion but use the cosine similarity between image encoding and text encoding instead of a classifier's log odds.

They get very good results and beat DALL-E.

