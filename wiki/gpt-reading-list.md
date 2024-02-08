---
layout: post
title: "LLM Reading List 2023: Articles about ChatGPT, GPT-3, GPT-4 and LLMs"
date: 2023-03-31
tags: LLMs, GPT, transformers, scale
description: "A collection of links for articles in the GPT/LLM space I found interesting."
language: English
importance: 5
---

[Llama.cpp GitHub Repo](https://github.com/ggerganov/llama.cpp)

[Discussion about mmap advantages](https://github.com/ggerganov/llama.cpp/discussions/638). I think it's amazing what a few well-chosen mmaps can accomplish. Lazy loading of memory, and using disk memory instead of RAM when possible. I think I had never understood the importance of mmap until today.

[LLM int8 and Emergent Features](https://timdettmers.com/2022/08/17/llm-int8-and-emergent-features).

> Once you go above 7B parameters, a "phase shift" occurs, where these outlier features become even greater in number, and present across all transformer layers<br>However, they start to coordinate through only a small number of hidden dimensions. <br>
Feed-forward layers become highly dense, HOWEVER, the attention layers become extremely sparse, almost binary in nature

[Could you train a ChatGPT-beating model for $85,000 and run it in a browser?](https://simonwillison.net/2023/Mar/17/beat-chatgpt-in-a-browser/)

[React-LM](https://react-lm.github.io/)

[The surprising ease and effectiveness of AI in a loop - Interconnected](https://interconnected.org/home/2023/03/16/singularity)

[A simple Python implementation of the ReAct pattern for LLMs](https://til.simonwillison.net/llms/python-react-pattern)

[AI-Enhanced Development](https://simonwillison.net/2023/Mar/27/ai-enhanced-development/) I love this one about how lowering the activation energy for new software projects incentivizes us to create more. I've also experienced the same to a much smaller degree.

[Nougat: Neural Optical Understanding for Academic Documents](https://arxiv.org/abs/2308.13418): Amazing paper by Meta, not so much by the technical but because they open source the models and code and because of what that may imply for the future. They train a visual transformer as an encoder from images of Paper PDFs (+ augmentations like Gaussian noise and rotations, as the initial dataset is very clean) and a transformer decoder that turns latent representations of images into sequences of characters (in a markup language like LaTeX). The result is an OCR that greatly improves at reconstructing math (previous SotA was non-existent for math -couldn't handle superscripts or matrices-, this one is close to ~70% accuracy). Will be interesting to see where this leads. Next generation 'Galactica'?

[LocalLLM](https://cloud.google.com/blog/products/application-development/new-localllm-lets-you-develop-gen-ai-apps-locally-without-gpus)

### Discussion 

[Against LLM Maximalism](https://explosion.ai/blog/against-llm-maximalism)

For older articles or links, [search LLM on the wiki](/tagged?q=LLM).

