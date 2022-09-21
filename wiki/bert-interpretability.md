---
layout: post
date: 2021-01-07
title: "BERT Interpretability"
tags: deep learning, neural network, NLP, BERT, paper, thegradient, transformers, LLM, machine learning
description: "A paper on BERT interpretability from thegradient.pub, and my reflections on the lottery hypothesis and model distilling."
language: English
importance: 6
---

What follows are my notes from a [paper on BERT interpretability](https://thegradient.pub/when-bert-plays-the-lottery-all-tickets-are-winning) from thegradient.pub.

It tests the lottery ticket hypothesis on BERT by iteratively pruning its 'least important' parts, either structurally (head by head) or on a weight level (by removing those weights closer to 0, irrespective of their position). The pruning continues while the reduced model performs at least 90% as well as the original without extra fine-tuning.

The result is these smaller models can be fine-tuned to perform as well as the original while being a fraction of the size, for almost all tasks (8 out of 9 in their benchmarks).

I am not aware of similar studies run on, for instance, GPT-3 but it would be very interesting to see how much understanding of human language (plus all the reasoning, inference and creative tasks in which GPT achieves excellent zero-shot performance) a large language model retains after iterative pruning, and what the trade off between compression and natural language understanding becomes for a model in that, much bigger regime.

The lottery hypothesis could also help train [diffusion models](/wiki/glide) that reach a similar performance to [DALL-E 2](/DALL-E-2-prompt-guide) or Stable Diffusion while consuming a smaller amount of VRAM, potentially opening up the gates for mass user adoption (imagine a desktop app that runs DALL-E 2 locally).

## On BERT interpretability:

>  The **Lottery Ticket Hypothesis** proposes that randomly initialized neural networks contain **subnetworks** that could be re-trained alone to **reach (or exceed) the performance of the full model** ([Frankle and Carbin 2019](https://thegradient.pub/when-bert-plays-the-lottery-all-tickets-are-winning/));

"Given all that: if BERT is so overparameterized, could we make it more **interpretable by pruning it down to its most essential components**? If they are indeed crucial for the model's performance, then their functions should tell us something about how the whole thing actually works. Under this approach, we would use **pruning as a technique for model analysis rather than model compression**."

"The classical Lottery Ticket Hypothesis was mostly tested with **unstructured pruning**, specifically **magnitude pruning (m-pruning)** where the **weights with the lowest magnitude are pruned irrespective of their position in the model**. We iteratively prune 10% of the least magnitude weights across the entire fine-tuned model (except the embeddings) and evaluate on dev set, for as long as the performance of the pruned subnetwork is above 90% of the full model."

"We also experiment with **structured pruning (s-pruning)** of entire components of BERT architecture based on their importance scores: specifically, we **'remove' the least important self-attention heads and MLPs** by applying a mask. In each iteration, we prune 10% of BERT heads and 1 MLP, for as long as the performance of the pruned subnetwork is above 90% of the full model. To determine which heads/MLPs to prune, we use a loss-based approximation: the importance scores proposed by Michel, Levy and Neubig (2019) for self-attention heads, which we extend to MLPs. Please see our paper and the original formulation for more details."

### Results

"For most GLUE tasks, the **'good' subnetworks can be retrained to reach performance close to that of the full model, but so can randomly sampled subnetworks of the same size.** This is good news for BERT compression (it's a lottery you can't lose), but bad news for interpretability."

"For m-pruning, pruned and re-fine-tuned "good" subnetworks reach the full model performance in 8 out of 9 GLUE tasks (except for WNLI, where the model generally fails to learn). These results are consistent with concurrent work on magnitude-pruned BERT ([Chen et al. 2020](https://thegradient.pub/when-bert-plays-the-lottery-all-tickets-are-winning/)). "

The "random" and "bad" subnetworks also generally perform better when re-fine-tuned, but the "bad" subnetworks are consistently worse than "random".

"All this means that **we still have more questions than answers about how BERT achieves its remarkable performance.** If so many of the important self-attention heads are not even potentially interpretable, should we give up on the idea that some knowledge is encoded in specific architecture components, rather than spread across the whole network? How can we study such distributed representations?"

[*Source*](https://thegradient.pub/when-bert-plays-the-lottery-all-tickets-are-winning)

### See Also

- [Deep Learning for NLP: Transformers](/wiki/deep-learning-NLP#transformers).
- [Semi-supervised learning](/wiki/unsupervised-learning-berkeley#semi-supervised-learning).
- [Distilling the Knowledge in a Neural Network](/wiki/distilling-knowledge-nn).
