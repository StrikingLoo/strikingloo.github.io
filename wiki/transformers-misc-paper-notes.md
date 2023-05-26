---
layout: post
date: 2023-02-22
title: "Transformers and LLMs: Miscellanea and Paper Notes"
tags: LLMs, NLP, deep learning, transformers
description: "Links and notes for the Transformers and Scale papers that didn't justify an entire separate article."
language: English
importance: 3
---

For the papers that didn't justify an entire separate article.

[Optical Transformers](https://arxiv.org/abs/2302.10360)

> The rapidly increasing size of deep-learning models has caused renewed and growing interest in alternatives to digital computers to dramatically reduce the energy cost of running state-of-the-art neural networks. Optical matrix-vector multipliers are best suited to performing computations with very large operands, which suggests that large Transformer models could be a good target for optical computing. To test this idea, we performed small-scale optical experiments with a prototype accelerator to demonstrate that Transformer operations can run on optical hardware despite noise and errors. Using simulations, validated by our experiments, we then explored the energy efficiency of optical implementations of Transformers and identified scaling laws for model performance with respect to optical energy usage. We found that the optical energy per multiply-accumulate (MAC) scales as 1d where d is the Transformer width, an asymptotic advantage over digital systems. We conclude that with well-engineered, large-scale optical hardware, it may be possible to achieve a 100× energy-efficiency advantage for running some of the largest current Transformer models, and that if both the models and the optical hardware are scaled to the quadrillion-parameter regime, optical computers could have a >8,000× energy-efficiency advantage over state-of-the-art digital-electronic processors that achieve 300 fJ/MAC.

[RWKV: Reinventing RNNs for the Transformer Era](https://arxiv.org/abs/2305.13048)

> Transformers have revolutionized almost all natural language processing (NLP) tasks but suffer from memory and computational complexity that scales quadratically with sequence length. In contrast, recurrent neural networks (RNNs) exhibit linear scaling in memory and computational requirements but struggle to match the same performance as Transformers due to limitations in parallelization and scalability. We propose a novel model architecture, Receptance Weighted Key Value (RWKV), that combines the efficient parallelizable training of Transformers with the efficient inference of RNNs. Our approach leverages a linear attention mechanism and allows us to formulate the model as either a Transformer or an RNN, which parallelizes computations during training and maintains constant computational and memory complexity during inference, leading to the first non-transformer architecture to be scaled to tens of billions of parameters. Our experiments reveal that RWKV performs on par with similarly sized Transformers, suggesting that future work can leverage this architecture to create more efficient models.

[Sophia: A Scalable Stochastic Second-order Optimizer for
Language Model Pre-training](https://arxiv.org/pdf/2305.14342.pdf)

> This paper introduces Sophia, Second-order Clipped Stochastic Optimization, a light-weight secondorder optimizer that uses an inexpensive stochastic estimate of the diagonal of the Hessian as a pre-conditioner and a clipping mechanism to control the worst-case update size. 

> On pre-training language models such as GPT-2, Sophia achieves the same validation pre-training loss with 50% fewer number of steps than Adam. Because Sophia maintains almost the memory and average time per step, the speedup also translates to 50% less total compute and 50% less wall-clock time.

They use two conditioners: one is the Hessian of the loss, computed over a mini batch, scaled by a vector of Gaussian variables. The second one is the elementwise square of the inverse of the 'auto-loss' (my term): for each input, sample from a softmax using the logits and assume that is your label. Take the loss of the model given that label, invert it, take the gradient. In a way this is like an unlearning phase / parameter.

Rationale:
> Sophia has a more aggressive pre-conditioner than Adam—Sophia applies a stronger penalization to updates in sharp dimensions (where the Hessian is large) than the flat dimensions (where the Hessian is small), ensuring a uniform loss decrease across all parameter dimensions. 