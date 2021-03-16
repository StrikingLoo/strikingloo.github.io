---
layout: post
date: 2021-03-15
title: "transGAN"
tags: deep learning, transformers, NLP, computer vision
description: "Notes on a the paper proposing TransGAN, a GAN rchitecture without convolutions, purely based on transformers."
---

<https://arxiv.org/pdf/2102.07074.pdf> 
## Notes on transGAN

"We have proposed TransGAN, a new GAN paradigm based on pure transformers. We have carefully crafted the architectures and thoughtfully designed training techniques. As a result, TransGAN has achieved comparable performance to some state-of-the-art CNN-based GAN methods across multiple popular datasets. We show that **the traditional reliance on CNN backbones and many specialized modules may not be necessary for GANs, and pure transformers can be sufficiently capable for image generation.**"

They reach sota on STL-10 which is bigger, but not on cifar 10. They come to the conclusion that TransGANs are very data-hungry.
They try mixing CNN based discriminator with transformer based generators and vice versa, and these are the results:

![](deep_learning_NLP_images/Screen%20Shot%202021-03-15%20at%2023.15.53.png){: style="height:70%; width:70%"}

![](deep_learning_NLP_images/Screen%20Shot%202021-03-15%20at%2023.16.05.png){: style="height:70%; width:70%"}

"the discriminator takes the patches of an image as inputs. we split the input images into 8 × 8 patches where each patch can
be regarded as a “word” The 8 × 8 patches are then converted to the 1D sequence of token embeddings through a
linear flatten layer, with token number N = 8 × 8 = 64 and embedding dimension equal to C. After that, the learnable positional encoding is added and a [cls] token isappended at the beginning of the 1D sequence. After passing through the transformer encoders, only [cls] token is taken by the classification head to output the real/fake prediction."


