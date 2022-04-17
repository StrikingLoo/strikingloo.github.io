
<https://arxiv.org/pdf/2010.02502.pdf>
A critical drawback of these models is that they require many iterations to produce a high quality
sample. For DDPMs, this is because that the generative process (from noise to data) approximates
the reverse of the forward diffusion process (from data to noise), which could have thousands of
steps; iterating over all the steps is required to produce a single sample, which is much slower
compared to GANs, which only needs one pass through a network. For example, it takes around 20
hours to sample 50k images of size 32 × 32 from a DDPM, but less than a minute to do so from
a GAN on a Nvidia 2080 Ti GPU. This becomes more problematic for larger images as sampling
50k images of size 256 × 256 could take nearly 1000 hours on the same GPU.
To close this efficiency gap between DDPMs and GANs, we present denoising diffusion implicit
models (DDIMs). DDIMs are implicit probabilistic models (Mohamed & Lakshminarayanan, 2016)
and are closely related to DDPMs, in the sense that they are trained with the same objective function.

We show that the resulting variational training objectives have a shared surrogate objective,
which is exactly the objective used to train DDPM. Therefore, we can freely choose from a large
family of generative models using the same neural network simply by choosing a different, nonMarkovian diffusion process (Section 4.1) and the corresponding reverse generative Markov Chain.

### Properties of DDIM vs DDPM
- DDIM samples have the following “consistency” property, which does not hold for DDPMs: if we start with the same initial latent variable and generate
several samples with Markov chains of various lengths, these samples would have similar high-level
features. 
- Because of “consistency” in DDIMs, we can perform semantically meaningful image
interpolation by manipulating the initial latent variable in DDIMs, unlike DDPMs which interpolates


From a trained model, x0 is sampled by first sampling xT from the prior pθ(xT ), and then sampling
xt−1 from the generative processes iteratively.
The length T of the forward process is an important hyperparameter in DDPMs. From a variational
perspective, a large T allows the reverse process to be close to a Gaussian (Sohl-Dickstein et al.,
2015), so that the generative process modeled with Gaussian conditional distributions becomes a
good approximation; this motivates the choice of large T values, such as T = 1000 in Ho et al.
(2020). However, as all T iterations have to be performed sequentially, instead of in parallel, to obtain a sample x0, sampling from DDPMs is much slower than sampling from other deep generative
models, which makes them impractical for tasks where compute is limited and latency is critical.
near the image space due to the stochastic generative process.
