---
title: Autoencoders: Deep Learning with TensorFlow’s Eager Execution
published: true
tags: DataScience, MachineLearning, Programming, tensorflow
canonical_url: https://www.datastuff.tech/machine-learning/autoencoder-deep-learning-tensorflow-eager-api-keras/
---

Deep Learning has revolutionized the Machine Learning scene in the last years. Can we apply it to image compression? How well can a Deep Learning algorithm reconstruct pictures of kittens? What’s an autoencoder?

Today we’ll find the answers to all of those questions.

## Image Compression: all about the patterns

I’ve talked about [Unsupervised Learning](http://www.datastuff.tech/machine-learning/k-means-clustering-unsupervised-learning-for-recommender-systems/) before: applying Machine Learning to discover **patterns** in **unlabelled data**.

In the case of Image Compression, it makes a lot of sense to assume most images are **not completely random**.

In more proper words, it is safe to assume most images are not completely made of **noise** (like the static when you turn on an old TV), but rather follow _some_ **underlying structure**.

It would be even better if we knew all the images will have things in common. One of the most rudimentary ways of doing image compression is finding repeating streams of pixels, assigning them a (lighter) label, and replacing them with that label.

Ideally, if two images are almost the same, a compressor could store both taking barely more space than either of them. That should apply to parts of the image as well. Finally, I would guess a pattern-finding machine like Unsupervised Learning should be good at this.

For the purposes of this work, we’ll be using a dataset of pictures of kittens I downloaded from [Kaggle](https://www.kaggle.com/c/dogs-vs-cats). That will guarantee there is some common structure to most pictures.

Here’s the [GitHub project](https://github.com/StrikingLoo/AutoEncatter) with the code and data for today, in case you want to follow along. As usual however, I’ll be adding the most important snippets here.

But before we get our hands dirty with code, it’s time to learn some Deep Learning!

## Autoencoders: Unsupervised-_ish_ Deep Learning

Even though we call Autoencoders “Unsupervised Learning”, they’re actually a Supervised Learning Algorithm in disguise. I know, I was shocked too!

They do however have a very peculiar property, which makes them stand out from normal classifiers: **their input and output are the same**.

### Training an Autoencoder

When we train an Autoencoder, we’ll actually be training an Artificial Neural Network that

- Takes an input vector _X_.
- Applies some math to it (I won’t get into the specifics of Deep Learning right now, but [this is the book](https://www.bookdepository.com/book/9780262035613/?a_aid=strikingloo&chan=ws) I used to learn these subjects).
- Returns another vector. In this particular case, we want it to be X again, or as close as possible.

However, there’s a trick: in the feed-forward process (going from input to output) the Neural Network will reduce the input’s dimensionality, and increase it again before returning the last layer.

### The curse of dimensionality

The Autoencoder takes a vector _X_ as input, with potentially a lot of components. For instance, for a 3 channels –_RGB_– picture with a 48×48 resolution, _X_ would have 6912 components. Even if each of them is just a float, that’s 27Kb of data for each (very small!) image. That adds up fast. The time it takes to do all the mathematical operations on so many elements is also very relevant.

We will thus have to map that vector to a smaller space. In this particular case, I tried reducing it to half of its original dimensions.   
We intend, however, to keep most of the data.

### Architecture of an Autoencoder

We call the layer of the Network that reduces the input vector’s dimensions the _encoder_, because it _encodes_ the data into a smaller vector.

We then operate on that smaller vector, in our case reducing its dimensions by a factor of 2 again. This would be the version of the input that we would store if we were designing an actual image compressor, saving 75% space. However during training, that is just an intermediate step before _decoding_ it.

Finally, using that reduced vector, the Autoencoder will have to reconstruct the original image as well as it can.

In order to do this, it will first make it go through a _decoder_ layer, which again maps the reduced vector to one with half of the input vector’s dimensions. And then a final layer, where we obtain a vector of the same dimensions as the original image, hopefully very similar.

Here’s what an Autoencoder’s layer architecture looks like:

![](https://cdn-images-1.medium.com/max/800/1*iDcAplzGhttLcYI56MIMxQ.png)<figcaption>Source: <a href="https://towardsdatascience.com/deep-autoencoders-using-tensorflow-c68f075fd1a3">Medium</a></figcaption>

### Results of using an Autoencoder

Training an Autoencoder will have many effects:

- The reconstructed images won’t be exactly similar to the original ones.
- We’ll be able to save the much lighter reduced vector, and then use the reconstruction, provided it’s good enough (however we define that), instead of the original image.
- We’ll now have a Neural Network that has learned some of the underlying patterns in pictures of kittens. 

This last one is the most valuable result.

Some of the industry applications for Autoencoders are:

- Feature Engineering for Supervised Deep Learning models: instead of feeding them with data directly, we’ll feed them with the Autoencoder’s hidden layer.
- Anomaly Detection: The Autoencoder will be very bad at reconstructing pictures of dogs, landscapes or bugs. This gives us a way to check if a picture is effectively a kitten automatically.

Now that you know why we’re doing what we’re doing, let’s get our hands dirty with some actual code!

## Training an Autoencoder with Tensorflow

For this tutorial we’ll be using Tensorflow’s eager API. I have to say, it is a lot more intuitive than that old _Session_ thing, so much so that I wouldn’t mind if there had been a drop in performance (which I didn’t perceive).

Our dataset contains over 8000 images of kittens, of various sizes and colors, and in different positions. It is available for you to look at at the [GitHub project](https://github.com/StrikingLoo/AutoEncatter), along with the code that loads it.

Due to PyPlot’s way of handling numpy float arrays, and to accelerate convergence for the network, the images are loaded as an array of floats ranging from 0 to 1, instead of 0 to 255.

{% gist https://gist.github.com/strikingloo/aeb3548e84c0568fd492fc6baa6539d8.js %}

### Designing the Autoencoder

Before Tensorflow swallowed Keras and became eager, writing a Neural Network with it was quite cumbersome. Now, its API has become intuitive.

Here’s the first Autoencoder I designed using Tensorflow’s Keras API.

{% gist https://gist.github.com/strikingloo/e8400aa0ceff57c06b03c20aeb76641b.js %}

However, this model had some major flaws! First of all, it was converging too slowly, even with a very high learning rate (we’ll get there). Secondly, it was returning a vector with the right size… except some of the elements were higher than 1! That didn’t mesh well with PyPlot’s graphs, nor with our inputs’ priors -each pixel has three values between 0 and 1-.

![](http://www.datastuff.tech/wp-content/uploads/2019/04/04errorrate.png)<figcaption>This is what happens if we use ReLu instead of sigmoid. Notice the dead pixels, each of them with a value higher than 1.<br></figcaption>

I fixed that problem by replacing the ReLu on the last layer with a sigmoid activation function, so it always returned numbers between 0 and 1.

However, there was still the factor of convergence speed. What could I do to solve that? Luckily, I’ve read a few Deep Learning papers here and there, and there’s this thing I’ve used a few times called **Batch Normalization**. It deserves its own article, so I won’t be delving too deep on it.

#### Batch Normalization

The short version is, a batch normalization layer calculates the mean and standard deviation for the previous layer, for the current batch of training instances. It then subtracts the mean and divides by the standard deviation, thus normalizing the layer’s output (for the batch). In feed-forwards after the training, the layer will start normalizing using parameters estimated from the whole training dataset.

This makes the model converge a lot faster, since it becomes less sensitive to changes in the distribution of the inputs, or the hidden layers. It will also become more robust to natural distribution changes in the inputs, being more sustainable in the long term on a productive environment.

{% gist https://gist.github.com/strikingloo/a317384f4ee3163feab0cd0c774c2d1d.js %}

This way, the decoder just needs to learn how to decode centered variables with a variance of 1, and not just any random thing. The same thing applies to the encoder. This change alone made the model start converging in the first 5 or 6 epochs.

### Training the Autoencoder

It’s the moment we were all waiting for! Time to train our Autoencoder!

Tensorflow’s eager execution requires we first compile the model.   
This means we define an optimizer (I’m using Adam, it’s fast), a loss (in this case, mean squared error, which is a pretty standard way to measure reconstruction error), and monitoring metrics. Most importantly, here is where we will choose the model’s learning rate.

{% gist https://gist.github.com/strikingloo/b55e9068adea4f6d56f2a30cb36ec3ba.js %}

And finally, we start training the model.

{% gist https://gist.github.com/strikingloo/f1b1da853ae204ff586c1e6725052b31.js %}

This will begin the training (and make my laptop sound like a Victorian furnace) and print messages like this:

```
Epoch 2/2 7373/7373 [==============================] - 59s 8ms/sample - loss: 0.0183 - mean\_squared\_error: 0.0183 - val\_loss: 0.0350 - val\_mean\_squared\_error: 0.0350
```

We will know the model is learning if _val\_mean\_squared\_error_, the MSE on the validation dataset, keeps converging towards 0. If the train loss keeps dropping but the validation loss is stable or, worse, going up, then that means that the model is overfitting. What do we do then? We can

- add more data,
- make the compression smaller, or 
- increase the learning rate. 

This wasn’t a problem I had too often.

On the opposite side of the spectrum, the training loss may be bad.   
How bad? Well, the value we’d get if we sampled random numbers between 0 and 1 would be around 25%, since that’s the square of 1/2, which is the average random error.

For most configurations I tried, that was the training loss for a long while (for instance, without using batch normalization, or when I sampled less than half of the data).

If that happens, we should decrease the learning rate (to avoid converging to a local minimum), increase the training dataset size, or be less ambitious and compress the data less.

I first tried compressing to a ninth of the original weight instead of a fourth, and there was no way the network learned that.

## The results

And finally, here are some of the results!

![](http://www.datastuff.tech/wp-content/uploads/2019/04/final_kitten4.png)

![](http://www.datastuff.tech/wp-content/uploads/2019/04/final_kitten_3.png)

![](http://www.datastuff.tech/wp-content/uploads/2019/04/final_kitten.png)

![](http://www.datastuff.tech/wp-content/uploads/2019/04/final_kitten_2.png)<figcaption>Images generated using a middle layer 25% the size of the input vector. MSE = 0.011</figcaption>

The model was particularly good with black or white cats, probably because they had the most contrast, and most extreme colors.

This is what happened when I tried to compress the input to a ninth of its original size:

![](http://www.datastuff.tech/wp-content/uploads/2019/04/9kitten1.png)

![](http://www.datastuff.tech/wp-content/uploads/2019/04/9kitten2.png)

It basically only got the outlines right, and it only worked on black or dark-grey cats.

## Conclusions

I was surprised with the results: compressing the image to a fourth of its size with the cat still being recognizable, means a classifier could probably tell there was a cat in the picture.

Tensorflow’s current API is a lot more comfortable and intuitive than the old one, and I’m glad I can finally do deep learning without thinking of sessions and graphs.

I think batch-normalization proved to be quite effective at accelerating the training, and it’s a tool I should use more often.

Lastly, in the future I’d like to try different image compression algorithms. K-Means Clustering based ones, and maybe a Convolutional Autoencoder. However, that’s an idea for a different article.

What about you? Think you can train a better autoencoder for this dataset? What are some of the 1000 things I should’ve done better, or hyperparameters I forgot to tweak and could’ve improved the model’s performance greatly? Let me know in the comments, I’m still very much learning.

I hope you’ve found this article entertaining or helpful, and maybe that you’ve learned something along the way.

If you wish to learn more about Deep Learning and become a professional in it, you can’t go wrong with Goodfellow and Bengio’s [Deep Learning book](https://amzn.to/2J0WjZe).  
Its first chapters made Deep Learning finally click for me, and the one on Autoencoders is pure gold.

_If you liked reading this and it helped you learn something, please consider_ [_supporting my website_](http://www.buymeacoff.ee/strikingloo)_, and helping me pay for this year’s hosting._

_Follow me on_ [_Medium_](http://medium.com/@strikingloo)_,_ [_dev.to_](http://www.dev.to/strikingloo) _or_ [_Twitter_](http://twitter.com/strikingloo) _for more Machine Learning tutorials._

