---
layout: post
date: 2022-12-03
title: "Training Compute-Optimal Large Language Models"
tags: computer science, LLMs, language models, NLP, transformers, scale
description: "The DeepMind paper that proposed the Chinchilla scaling laws. Researchers train multiple models of different sizes with different amounts of training tokens, then interpolate to estimate the optimal model size for a given compute budget."
language: English
importance: 6
abstract: "The DeepMind paper that proposed the Chinchilla scaling laws.<br>Researchers train multiple models of different sizes with different amounts of training tokens, then interpolate to estimate the optimal model size for a given compute budget.<br>They then extrapolate these numbers to train a model with a similar compute budget than Gopher, but achieve a much better test loss for a fourth of the model size by quadrupling the training set size. Interestingly, Rae et al. and other previous papers which had looked at scaling laws hat predicted increasing model size with fixed number of tokens to be best.<br>The coefficients they arrive at dictate that the number of training tokens should roughly match 47x the amount of model parameters.<br>Recent work has beaten Chinchilla scaling laws by improving dataset quality, significantly reducing the optimal amount of training tokens for a given model size."
---

<https://arxiv.org/pdf/2203.15556.pdf>

> "We investigate the optimal model size and number of tokens for training a transformer language model under a given compute budget. We find that current large language models are significantly undertrained, a consequence of the recent focus on scaling language models whilst keeping the amount of training data constant. By training over 400 language models ranging from 70 million to over 16 billion parameters on 5 to 500 billion tokens, we find that for compute-optimal training, the model size and the number of training tokens should be scaled equally: for every doubling of model size the number of training tokens should also be doubled. We test this hypothesis by training a predicted computeoptimal model, Chinchilla, that uses the same compute budget as Gopher but with 70B parameters and 4× more more data. Chinchilla uniformly and significantly outperforms Gopher (280B), GPT-3 (175B), Jurassic-1 (178B), and Megatron-Turing NLG (530B) on a large range of downstream evaluation tasks. This also means that Chinchilla uses substantially less compute for fine-tuning and inference, greatly facilitating downstream usage. As a highlight, Chinchilla reaches a state-of-the-art average accuracy of 67.5% on the MMLU benchmark, greater than a 7% improvement over Gopher."

> One notable conclusion in Kaplan et al. (2020) is that large models should not be trained to their lowest possible loss to be compute optimal. Whilst we reach the same conclusion, we estimate that large models should be trained for many more training tokens than recommended by the authors. Specifically, given a 10× increase computational budget, they suggests that the size of the model should increase 5.5× while the number of training tokens should only increase 1.8×. Instead, we find that model size and the number of training tokens should be scaled in equal proportions.

## Estimating the optimal parameter/training tokens allocation

> We present three different approaches to answer the question driving our research: Given a fixed FLOPs budget, how should one trade-off model size and the number of training tokens? 

> The resulting predictions (...) suggest that
parameter count and number of training tokens should be increased equally with more compute3—
with proportions reported in Table 2. This is in clear contrast to previous work on this topic and
warrants further investigation.

### Approach 1: Fix model sizes and vary number of training tokens

For each model size they use 4 different numbers of tokens. They interpolate the results of the best train losses for each model size using a power law fit, then assuming compute is proportional to model size and number of tokens find the optimum coefficients a and b such that C proportional to N\*D. They find a=b=.5 to be optimal (thus model size roughly scales proportional to dataset size). They extrapolate this and compare the resulting model with the one posited by Kaplan et al. (2020).

### Approach 2: Fix FLOPs and vary model size and dataset size

In this case, they choose a set of FLOPs values, and make it so token count \* model parameters = FLOPs. They find an optimal point for each FLOPs value and then fit those points. The coefficients are again close to .5 (.49 vs .51)

> All three approaches suggest that as compute budget increases, model size and the amount of training data should be increased in approximately equal proportions.

Basically, parameters/tokens \~= 47.

## Further Reading

- [Lessons Learned, Rae et al. (2021)](https://arxiv.org/pdf/2112.11446.pdf) \[🌱]
- [MMLU SotA -currently flan-PaLM as of 2022 Dec-](https://paperswithcode.com/sota/multi-task-language-understanding-on-mmlu)\[🌱]
- [Chinchilla's Wild Implications (LessWrong)](https://www.lesswrong.com/posts/6Fpvch8RR29qLEWNH/chinchilla-s-wild-implications)

> "To put this in context: until this paper, it was conventional to train all large LMs on roughly 300B tokens of data. (GPT-3 did it, and everyone else followed.) Insofar as we trust our equation, this entire line of research -- which includes GPT-3, LaMDA, Gopher, Jurassic, and MT-NLG -- could never have beaten Chinchilla, no matter how big the models got."
[_Source: Chinchilla's Wild Implications (LessWrong)_](https://www.lesswrong.com/posts/6Fpvch8RR29qLEWNH/chinchilla-s-wild-implications)
