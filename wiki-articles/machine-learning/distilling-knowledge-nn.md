---
layout: post
date: 2021-12-22
title: "Distilling the Knowledge in a Neural Network"
tags: deep learning, neural network, supervised learning, convolutional neural networks, paper, ensemble, ensamble
description: "Notes from a paper by Geoffrey Hinton (Google Deep Mind) on training an ensemble of models for a task and then fitting a smaller single model to the emsemble's aggregated, softened (through softmax temperature) output, reaching a similar performance with a deployable model."
language: English
---


<https://arxiv.org/pdf/1503.02531.pdf>

A very simple way to improve the performance of almost any machine learning
algorithm is to train many different models on the same data and then to average
their predictions. Unfortunately, making predictions using a whole ensemble
of models is cumbersome and may be too computationally expensive.

It is possible to
compress the knowledge in an ensemble into a single model which is much easier to deploy and they develop this approach further using a different compression
technique.

An obvious way to transfer the generalization ability of the cumbersome model to a small model is
to use the class probabilities produced by the cumbersome model as “soft targets” for training the
small model. For this transfer stage, we could use the same training set or a separate “transfer” set.
When the cumbersome model is a large ensemble of simpler models, we can use an arithmetic or geometric mean of their individual predictive distributions as the soft targets. When the soft targets have high entropy, they provide much more information per training case than hard targets and much less variance in the gradient between training cases, so the small model can often be trained on much less data than the original cumbersome model and using a much higher learning rate.

Important information is contained in the ratios of the logits (i.e., a car is 10x more likely to be a truck than a kangaroo). They train a model with a high-temperature softmax to exacerbate this information.

The transfer set that is used to train the small model could consist entirely of unlabeled data or we could use the original training set. They have found that using the original training set works well, especially if adding a small term to the objective function that encourages the small model to predict the true targets as well as matching the soft targets provided by the cumbersome model.

Here the temperature T is just a number that divides the logits before feeding them to a softmax.

When the correct labels are known for all or some of the transfer set, this method can be significantly improved by also training the distilled model to produce the correct labels. One way to do this is to use the correct labels to modify the soft targets, but they found that a better way is to simply use a weighted average of two different objective functions. The first objective function is the cross entropy with the soft targets and this cross entropy is computed using the same high temperature in the softmax of the distilled model as was used for generating the soft targets from the cumbersome model. The second objective function is the cross entropy with the correct labels. This is computed using exactly the same logits in softmax of the distilled model but at a temperature of 1. They found that the best results were generally obtained by using a condiderably lower weight on the second objective function.
