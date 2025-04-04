---
layout: post
date: 2022-09-12
importance: 4
title: Brain Activity to Speech
tags: deep learning, neural network, paper, audio, brain, science
description: "Notes from a paper by Facebook Research where an embedding model is trained using a contrastive loss to align audio and brain (MEG and EEG) recordings, achieving lossy brain to audio reading. They use non-invasive brain scanning methods."
abstract: "Notes from a paper by Facebook Research where an embedding model is trained using a contrastive loss to align audio and brain (MEG and EEG) recordings, achieving lossy brain to audio reading. <br/>They use non-invasive brain scanning methods."
language: English
---

Source: <https://ai.facebook.com/blog/ai-speech-brain-activity/>

> From three seconds of brain activity, our results show that our model can decode the corresponding speech segments with up to 73 percent top-10 accuracy from a vocabulary of 793 words, i.e., a large portion of the words we typically use on a day-to-day basis. <br>(...)<br>
Other, more invasive devices provide clearer signals than noninvasive methods but require neurosurgical interventions. While results from that work suggest that decoding speech from recordings of brain activity is feasible, decoding speech with noninvasive approaches would provide a safer, more scalable solution that could ultimately benefit many more people.<br>(...)<br>
In our work, we address these challenges by creating a deep learning model trained with contrastive learning and then use it to maximally align noninvasive brain recordings and speech sounds. To do this, we use wave2vec 2.0, an open source, self-supervised learning model developed by our FAIR team in 2020. We then use this model to identify the complex representations of speech in the brains of volunteers listening to audiobooks.

**Dataset**: They used four open source EEG and MEG (1000 samples/second) datasets from academic institutions, capitalizing on more than 150 hours of recordings of 169 healthy volunteers listening to audiobooks and isolated sentences in English and Dutch.

**Model**: They then input those EEG and MEG recordings into a “brain” model, which consists of a standard deep convolutional network with residual connections. EEG and MEG recordings are known to vary extensively across individuals because of individual brain anatomy, differences in the location and timing of neural functions across brain regions, and the position of the sensors during a recording session.

They basically train a [CLIP-like contrastive loss embedding model](/wiki/clip) which aligns the audio space (in this case starting from wave2vec 2.0) and the EEG/MEG space.

They designed a new subject-embedding layer, which is trained end-to-end to align all brain recordings in a common space.

Finally, the architecture learns to align the output of this brain model to the deep representations of the speech sounds that were presented to the participants.

Something interesting is that the approach seems to scale well to new data, even if it is small per user samples combining heterogeneous patterns. This would allow to record a user for a small time and align their brain waves to the dataset, without requiring tedious hour-long interventions. The current dataset is also pretty small scale so far and it could be improved upon further if more words and hours were recorded.

I can also think of applications if this were combined with a model like AudioLM (DeepMind 2022), which can be conditioned on only a few audios (on the order of 10 sentences) from a speaker and generate hyper realistic voice recordings conditioned on arbitrary English text. This could potentially make people who keep brain activity but lost speech recover it (think Stephen Hawkins recovering his original voice). 

In easier situations, this could automate WhatsApp audio recordings, or integrate to a text-to-art model like [Stable-Diffusion](/stable-diffusion-vs-dalle-2) and make for real time rendering of art as you think of it --imagine the applications for role playing games, gaming in general, or adult content. Real-time horror movies where you think of your own worst fears and they appear in real time.

### Further Reading

- [MindVis by Stanford - Seeing Beyond the Brain: Conditional Diffusion Model with Sparse Masked Modeling for Vision Decoding](https://mind-vis.github.io/)
- [A streaming brain-to-voice neuroprosthesis to restore naturalistic communication](https://www.nature.com/articles/s41593-025-01905-6?utm_source=substack&utm_medium=email) - 2025 April update: Researchers from Berkeley got to convert thoughts to speech at a pace of 90 WPM -beating previous records of 30-.

> We designed and used deep learning recurrent neural network transducer models to achieve online large-vocabulary intelligible fluent speech synthesis personalized to the participant’s preinjury voice with neural decoding in 80-ms increments. 



