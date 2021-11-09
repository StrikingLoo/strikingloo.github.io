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
- [Glow](https://openai.com/blog/glow/) [🌱](/wiki-articles/machine-learning/flow-based-models-glow)
- [FFJORD](https://arxiv.org/abs/1810.01367) 🌱


## Latent Variable Models

In a latent variable model, you have a distribution of data X, and you assume it has an underlying cause distribution Z such that you can estimate P(X\|Z) and Z is easy to sample from. 

In a way this is similar to flow models, but here we make no strong constraints on the relationship between X and Z, we may not know the intermediate values for Z and the mapping needs not be invertible. 

![](unsupervised-learning-images/exact-likelihood-objective.png)

### Variational AutoEncoders
**Principle of Variational Approach**: We can't directly use the *p* we want, so instead we propose a parameterized distribution *q* we know we can work with (sample from, estimate likelihood) easily, and try to find a parameter setting that makes it as good as possible.

This works because we're doing importance sampling: we could be sampling from our random latent space and doing maximum likelihood of X given Z (without fitting Z, we only fit P(X\|Z)), but then for Z st P(X\|Z) is ~0, we're doing the work pointlessly (because the gradient is 0 and there's no information to propagate). Whereas if we make sure to only sample from points where X given Z is likely, we get more bang for our buck. However if we already had P(Z\|X) to calculate this we wouldn't be going through this in the first place (because Bayes) and this is usually intractable (if Z is gaussian or generally not enumerable), so instead we try to get this to be "as good as possible" and that's that.

![](unsupervised-learning-images/variational-equation.png)

![](unsupervised-learning-images/VLB-derivation.png)
![](unsupervised-learning-images/VLB-consequences.png)


![](unsupervised-learning-images/vae-1-loss.png)
![](unsupervised-learning-images/vae-2-loss.png)

## GANs
The course introduces GANs, following Goodfellow et al. closely, so I won't reproduce what they say as it overlaps with [GANs](/wiki-articles/machine-learning/GAN).

It then discusses the difficulties in measuring GAN performance, as human judgement over samples is not enough (though it is the original propeller of GANs in a way).

### Inception Score
We pick a pretrained classifier on imagenet 1k classes and:
- Entropy of labels should be high (the generator should generate a diverse set of classes)
- But entropy of certainty of classifier should be low: the classifier must be quite certain which class each image belongs to.

The Inception score ends up being the DKL between p(y\|x) and p(y), where p(y) is the marginal probability over a sample set for each class, and p(y\|x) is the probability for that label for that specific sample. The p(y) marginal should be a uniform distribution, whereas the p(y\|x) should peak around a class. You want KLD to be *high*.

Equivalent to entropy of labels for generated samples - entropy of labels for each sample.

FID is a more complicated metric based on inception score that uses an embedding space from some classifier, and compares the embedding for generated image vs average embedding.

### Discriminator Saturation
The bayes ideal discriminator is always right (assigns prob 0 to fake and prob 1 to true). However if our discriminator is too good too fast, since the gradient tends to be very close to zero for high confidence predictions (the landscape is flat around the edges, think of a sigmoid), the generator gets little information to work with.

**Ways to address Discriminator Saturation**: Use a different, non-zero-sum objective where you switch the log(1 - D(G(z))) with a -log(D(G(z))). This changes the regime of the game so it stops being zero sum, and also makes it so that the gradient goes to 0 when the generator is already winning, which is far less terrible. Otherwise a generator may get stuck on a bad initialization. The other way to prevent this is alternating updates between generator and discriminator.
