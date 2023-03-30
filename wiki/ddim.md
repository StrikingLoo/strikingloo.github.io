---
layout: post
date: 2022-04-13
title: "Denoising Diffusion Implicit Models"
tags: deep learning, neural network, DDPM, DDIM, diffusion, unsupervised learning, paper, GLIDE, OpenAI, generative, machine learning
description: "Notes on the DDIM (Denoising Diffusion Implicit Models) paper. DDIM are an improvement over DDPM, allowing for faster generation."
language: English
importance: 6
---

These are my notes. [Original Paper on Arxiv](https://arxiv.org/pdf/2010.02502.pdf).

> A critical drawback of \[DDPM models] is that they require many iterations to produce a high quality sample. For DDPMs, this is because the generative process (from noise to data) approximates the reverse of the forward diffusion process (from data to noise), which could have thousands of steps; iterating over all the steps is required to produce a single sample, which is much slower compared to GANs, which only needs one pass through a network. <br> For example, it takes around 20 hours to sample 50k images of size 32 × 32 from a DDPM, but less than a minute to do so from a GAN on a Nvidia 2080 Ti GPU. This becomes more problematic for larger images as sampling 50k images of size 256 × 256 could take nearly 1000 hours on the same GPU. <br>To close this efficiency gap between DDPMs and GANs, we present denoising diffusion implicit models (DDIMs). DDIMs are implicit probabilistic models (Mohamed & Lakshminarayanan, 2016) and are closely related to DDPMs, in the sense that they are trained with the same objective function.

> We show that the resulting variational training objectives have a shared surrogate objective, which is exactly the objective used to train DDPM. Therefore, we can freely choose from a large family of generative models using the same neural network simply by choosing a different, non-Markovian diffusion process and the corresponding reverse generative Markov Chain.

To summarize the paper: DDIM allows for much faster sampling while keeping an equivalent training objective, so that generative models using this architecture are competitive to GANs at the same model size/sample quality. 

They do this by estimating the addition of multiple Markov chain steps and adding them all at once (since each Markov jump is a Gaussian, they use a higher-variance, same-mean Gaussian as an approximation of the multiple jumps. Note that the sum of two Gaussians remains Gaussian).

### Properties of DDIM vs DDPM
- DDIM samples have the following “consistency” property, which does not hold for DDPMs: if we start with the same initial latent variable and generate several samples with Markov chains of various lengths, these samples would have similar high-level features.
- Because of “consistency” in DDIMs, we can perform semantically meaningful image
interpolation by manipulating the initial latent variable in DDIMs, unlike DDPMs which interpolates poorly.


From a trained model, x<sub>0</sub> is sampled by first sampling x<sub>T</sub> from the prior p<sub>θ</sub>(x<sub>T</sub>), and then sampling x<sub>t−1</sub> from the generative processes iteratively.

> The length *T* of the forward process is an important hyperparameter in DDPMs. From a variational perspective, a large *T* allows the reverse process to be close to a Gaussian, so that the generative process modeled with Gaussian conditional distributions becomes a
good approximation; this motivates the choice of large *T* values, such as *T = 1000* in Ho et al. (2020). <br>However, as all *T* iterations have to be performed sequentially, instead of in parallel, to obtain a sample x<sub>0</sub>, sampling from DDPMs is much slower than sampling from other deep generative models, which makes them impractical for tasks where compute is limited and latency is critical near the image space due to the stochastic generative process.


> Our key observation is that the DDPM objective in the form of Lγ only depends on the marginals q(x<sub>t</sub>\|x<sub>0</sub>), but not directly on the joint q(x<sub>1:T</sub>\|x<sub>0</sub>). Since there are many inference distributions (joints) with the same marginals, we explore alternative inference processes that are non-Markovian, which leads to new generative processes. These non-Markovian inference processes lead to the same surrogate objective function as DDPM.

They change the forward process for something more general that depends both on x<sub>0</sub> and x<sub>t</sub> for x<sub>t-1</sub>, adding random noise that depends on a sigma for each step (where if the parameter for sigma were 0, the whole chain could be deterministic and determined by x<sub>0</sub> and any x<sub>t</sub>). This process is more general but has the same objective.

![](image/ddim-9.png)

The key insight: instead of approximating ϵ from x<sub>t</sub> to x<sub>t-1</sub>, they approximate the ϵ such that x<sub>0</sub> and ϵ are mixed to make x<sub>t</sub>. They then can use the same training objective and the same model as DDPM, but sample only S steps in the markov chain (no longer markovian as it now depends on x<sub>0</sub> directly) and reconstruct the image 10\~50x faster!

![](image/ddim-12.png)

They fix the sigmas and multiply by η so η==0 means DDIM, η==1 means DDPM no changes added, and it's possible to interpolate between both.
The X<sub>T</sub> parameter seems to encode the high level features of the image well, and interpolation works semantically. longer sample trajectories give better quality samples but
do not significantly affect the high-level features.

It's also possible to reconstruct an image given its X<sub>T</sub> encoding.

## Related Reading

- [GLIDE: Text-Guided Diffusion Models](/wiki/glide): A next step from DDIM where the text-to-image CLIP model is used to guide the diffusion process, allowing for text-conditioned image generation.
- [Unsupervised Deep Learning](/wiki/unsupervised-learning-berkeley#latent-variable-models): My general Unsupervised Deep Learning notes, based on the excellent Berkeley MOOC and enriched with several papers. Here you can learn about GANs and VAEs, and get links to some of the relevant literature.
- [Stable Diffusion: Prompt Guide and Examples](/stable-diffusion-vs-dalle-2): where I get into the practical side of using a diffusion model for image generation (and some advice for prompt-engineering).
