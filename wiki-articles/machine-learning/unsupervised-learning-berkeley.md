---
layout: post
date: 2021-10-14
title: "Unsupervised Deep Learning -- Berkeley course"
tags: pixelcnn, wavenet, autoregressive, flow models
description: "My notes from Berkeley's Unsupervised Deep Learning course, plus any papers from the recommended reading I went through -may be linked-."
---

## Autoregressive models

On a general, generic case you may approach this problem with an autoregressive RNN. This can for instance generate plausible samples for MNIST, and improves drastically if you also provide it with metadata on pixel position (so you pass it the RNN state, and the X and Y coordinates).

**PixelCNN**: User a 2d-filter over pixels above, and a different 1d one over pixels to the left, condition on both and do softmax.

**WaveNet**: We actually read the paper, but dillated causal convolutions + tanh\*sigmoid activation+ residual connections. It's interesting that it generalizes to images, but it *needs* the pixel coordinates as metadata to work.

## Flow models
En una dimension, mappear distribuciones arbitrarias a otras mas conocidas usando una funcion aprendida, que maximice log likelihood y sea inversible. E.g., tomo una distribucion cualquiera, le tomo la CDF y la mappeo a la CDF de una gaussiana. 
### autoregressive flow vs inverse autoregressive flow
Autoregressive flow: train fast, sample slow (linearly on pixel quantity).
Inverse: train slow (depends on sampled pixels), but sample very fast (just sample N variables from your prior and then run the f(z...) autoregressively.

![](unsupervised-learning-images/flow-1d-1.png)
![](unsupervised-learning-images/flow-1d-2.png)
![](unsupervised-learning-images/flow-1d-3.png)
![](unsupervised-learning-images/flow-1d-4.png)
![](unsupervised-learning-images/flow-1d-5.png)
![](unsupervised-learning-images/flow-1d-5.png)
![](unsupervised-learning-images/flow-nd.png)
![](unsupervised-learning-images/flow-nd-0.png)
![](unsupervised-learning-images/flow-nd-1.png)

### (Uniform) Dequantization
We add a random number uniformly sampled from -.5 to .5 to our discrete data every time, so that flow doesn't learn to use discrete data and overfit by asigning too much mass to too few points.

### RealNVP / NICE
Mappeo de x -> Z tq X0:n/2 quedan iguales en z, y Xn/2:n = Xn/2:n * s(x0:d/2) + t(x0:d/2).
Osea que la mitad de los x los dejo iguales, la otra mitad los transformo con una transformacion afin donde los pesos lineales son funcion de la primera mitad.
Tipicamente partis alternando pixeles (el famoso checkerboard) pero tambien se probo imagen partida vertical u horizontalmente. Esto ultimo empeora resultados.
 Las funciones s y t son arbitrarias con que fitteen, no necesitas reversibilidad porque ya conocias x0...n/2.

![](unsupervised-learning-images/real-nvp.png)

Otros modelos que funcionan pero no se cubren en detalle:
- [Glow](https://openai.com/blog/glow/) 🌱
- [FFJORD](https://arxiv.org/abs/1810.01367) 🌱
