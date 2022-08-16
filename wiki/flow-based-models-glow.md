---
layout: post
date: 2021-10-15
title: "Glow: Generative Flow with Invertible 1×1 Convolutions"
tags: deep learning,convolutional neural networks,cnn,flow,unsupervised learning,paper,generative models,generative
description: "Notes on the Glow paper by OpenAI, a Flow model that synthesizes realistic images efficiently and has a meaningful latent space while efficiently allowing computation of likelihood"
language: English
---

<https://openai.com/blog/glow/>

Some of the merits of flow-based generative models include:

- Exact latent-variable inference and log-likelihood evaluation. In VAEs, one is able to infer only approximately the value of the latent variables that correspond to a datapoint. GAN’s have no encoder at all to infer the latents. In reversible generative models, this can be done exactly without approximation. Not only does this lead to accurate inference, it also enables optimization of the exact log-likelihood of the data, instead of a lower bound of it.
- Efficient inference and efficient synthesis. Autoregressive models, such the PixelCNN, are also reversible, however synthesis from such models is difficult to parallelize, and typically inefficient on parallel hardware. Flow-based generative models like Glow (and RealNVP) are efficient to parallelize for both inference and synthesis.
- Useful latent space for downstream tasks.

Like previous work, we found
that sampling from a reduced-temperature model often results in higher-quality samples. The samples above were obtained by scaling the standard deviation of the latents by a temperature of 0.7.

### Contribution

Our main contribution and also our departure from the earlier RealNVP work is the addition of a reversible 1x1 convolution, as well as removing other components, simplifying the architecture overall.

The RealNVP architecture consists of sequences of two types of layers: layers with checkboard masking, and layers with channel-wise masking. We remove the layers with checkerboard masking, simplifying the architecture. The layers with channel-wise masking perform the equivalent of a repetition of the following steps:

- Permute the inputs by reversing their ordering across the channel dimension.
- Split the input into two parts, A and B, down the middle of the feature dimension.
- Feed A into a shallow convolutional neural network. Linearly transform B according to the output of the neural network.
- Concatenate A and B.

By chaining these layers, A updates B, then B updates A, then A updates B, etc. This bipartite flow of information is clearly quite rigid. We found that model performance improves by changing the reverse permutation of step (1) to a (fixed) shuffling permutation.

Taking this a step further, we can also learn the optimal permutation. Learning a permutation matrix is a discrete optimization that is not amendable to gradient ascent. But because the permutation operation is just a special case of a linear transformation with a square matrix, we can make this work with convolutional neural networks, as permuting the channels is equivalent to a 1x1 convolution operation with an equal number of input and output channels. So we replace the fixed permutation with learned 1x1 convolution operations. The weights of the 1x1 convolution are initialized as a random rotation matrix. As we show in the figure below, this operation leads to significant modeling improvements. 

---

<https://arxiv.org/pdf/1807.03039.pdf>

Flow-based generative models, first described in NICE (Dinh et al., 2014) and extended in
RealNVP (Dinh et al., 2016).

### Types of Layers used in Glow

The function NN() is a nonlinear mapping, such as a (shallow) convolutional neural network like in ResNets.

- Affine : Y = s X + b
- Invertible 1 × 1 convolution: Yij = W \* xij st W is a [c x c] convolution
- Affine coupling layer: 

```
xa, xb = split(x)
(log s, t) = NN(xb)
s = exp(log s)
ya = s · xa + t
yb = xb
y = concat(ya, yb)
```

> Each step of flow consists of actnorm followed by an invertible 1 × 1 convolution, followed by a coupling layer.

**Actnorm**:  These parameters are initialized such that the post-actnorm activations per-channel have zero mean and unit variance given an initial minibatch of data. This is a form of data dependent initialization (Salimans and Kingma, 2016). After initialization, the scale and bias are treated as regular trainable parameters that are independent of the data.

**Invertible 1 × 1 convolution**: For every pixel, we multiply the c vector (which has all the channels) by a shared matrix W called a convolution. W is initialized as a rotation matrix (taking the Q from a QR decomposition).

```
# Shape
h,w,c = z.shape[1:]
# Sample a random orthogonal matrix to initialise weights
w_init = np.linalg.qr(np.random.randn(c,c))[0]
w = tf.get_variable("W", initializer=w_init)
```

**Affine Coupling Layers**: Described above. Initialized with the NN a convnet with 0 in the last convolution so starts as identity and moves forward from there. Notice ya = xa * s + t so if log(s) == 0 then s==1 and we also make t be 0. 

Each step of flow above should be preceded by some kind of permutation of the
variables that ensures that after sufficient steps of flow, each dimensions can affect every other
dimension. The type of permutation specifically done in (Dinh et al., 2014, 2016) is equivalent to
simply reversing the ordering of the channels (features) before performing an additive coupling
layer. An alternative is to perform a (fixed) random permutation. Our invertible 1x1 convolution is a
generalization of such permutations. It gets the best results in experiments.

In our experiments, we
let each NN() have three convolutional layers, where the two hidden layers have ReLU activation
functions and 512 channels. The first and last convolutions are 3 × 3, while the center convolution is
1 × 1, since both its input and output have a large number of channels, in contrast with the first and
last convolution.

When training on CelebA (256x256), to improve visual quality at the cost of slight decrease in color fidelity, we train our models on 5-bit images.



