---
layout: post
title: "GPT Reading List 2023: Articles about ChatGPT, GPT-3, GPT-4 and LLMs"
date: 2023-03-31
tags: LLMs, GPT, transformers, scale
description: "A collection of links for articles in the GPT space I found interesting."
language: English
importance: 5
---

[Llama.cpp GitHub Repo](https://github.com/ggerganov/llama.cpp)

[Discussion about mmap advantages](https://github.com/ggerganov/llama.cpp/discussions/638). I think it's amazing what a few well-chosen mmaps can accomplish. Lazy loading of memory, and using disk memory instead of RAM when possible. I think I had never understood the importance of mmap until today.

[LLM int8 and Emergent Features](https://timdettmers.com/2022/08/17/llm-int8-and-emergent-features).

> Once you go above 7B parameters, a "phase shift" occurs, where these outlier features become even greater in number, and present across all transformer layers. <br>Once you go above 7B parameters, a "phase shift" occurs, where these outlier features become even greater in number, and present across all transformer layers<br>However, they start to coordinate through only a small number of hidden dimensions. <br>
Feed-forward layers become highly dense, HOWEVER, the attention layers become extremely sparse, almost binary in nature

[Could you train a ChatGPT-beating model for $85,000 and run it in a browser?](https://simonwillison.net/2023/Mar/17/beat-chatgpt-in-a-browser/)

[React-LM](https://react-lm.github.io/)

[The surprising ease and effectiveness of AI in a loop - Interconnected](https://interconnected.org/home/2023/03/16/singularity)

[A simple Python implementation of the ReAct pattern for LLMs](https://til.simonwillison.net/llms/python-react-pattern)

[AI-Enhanced Development](https://simonwillison.net/2023/Mar/27/ai-enhanced-development/) I love this one about how lowering the activation energy for new software projects incentivizes us to create more. I've also experienced the same to a much smaller degree.

For older articles or links, [search LLM on the wiki](/tagged?q=LLM).