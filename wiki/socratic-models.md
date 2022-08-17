---
layout: post
date: 2022-04-27
title: "Socratic Models: Composing Zero-Shot Multimodal Reasoning with Language"
tags: LMs,GPT-3,zero-shot,paper
description: "Notes on paper on Socratic models"
language: English
importance: 6
---

<https://arxiv.org/pdf/2204.00598.pdf>

In this work, different kinds of pretrained models are composed to solve complex tasks, while each one is only used in a zero-shot regime without extra task-specific fine-tuning.

Models used include LMs (GPT-3, RoBERTa), VLMs (like CLIP), and ALMs (like Wav2CLIP).

The problem of _egocentric perception_ is solved with composed Socratic dialogues, beginning with constructing a **language-based world-state history** and then running Q&A over that text representation of the video.

The way they generate the world-history is quite clever:

They ask three questions over a set of key frames in the video: "Where am I?", "What do I see?", "What am I doing?".

- For the place, they use a VLM to rank Places365 scene categories against the image, with the top n candidates (out of 365) inserted into a prefix: _“Places: {place1}, {place2}, {place3}.”_
- For the objects, they rank the 600 OpenImages object categories in the same fashion, keeping k.
- For the action, they use a prompt that looks like: _"Places: {place1}, {place2}, {place3}. Objects: {object1}, {object2}, {object3}. Activities: **activity a, activity b, activity c.**_. Then they rearrange the activities ranking them with the VLM.

Sometimes they iteratively add objects and places through more prompts, using the activity information, and thus expand the whole semantic field, whereupon they run the LM again asking for the activities. This way they can compose the whole world-history.

Since this world-history is too large (too many frames) they find ways to summarize it.

One is uniform sampling, where they just sample frames uniformly and condense them with language summarization. The other is video search, where a model is used to extract the entities in a question, and only those frames which portray the entities are taken into account and summarized. Depending on the application, one approach or the other may be better: the first one fails for spontaneous small moment tasks, and the second one fails if the question does not mention relevant entities.

Open-ended text prompts from a user, conditioned on an egocentric video, can yields three types of responses: a text-based response, a visual result, and/or an audio clip. These latter two provide examples that open up the capabilities of the system to respond not only with text-based responses, but also respond with video snippets themselves, which may be a higher-bandwidth way to respond to user requests.

### Provided tasks

The demonstrated tasks include **(i) summarization, (ii) openended Q&A, (iii) forecasting, (iv) corrections, and (v) video
search** for either visual or audio cues.

- **Summarization**: through the prompt  “{world-state history} Summary of my day:”.
- **Open-ended Q&A**: through the prompt  “{world-state history} Q: {question} A:”.
- **Recall Questions**: SMs can perform simple retrieval of events: Did I drink coffee? Did I climb that tree?
- **Forecasting**: asked to complete the log.
- **Video search**: Through ER + CLIP matching through the video.
