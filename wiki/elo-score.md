---
layout: post
title: "Elo Score"
date: 2023-09-16
tags: math, programming, algorithms, metrics, statistics
description: "How does Elo Score work?"
language: English
importance: 5
---

In Elo ratings, a player's expected score is defined as their probability of winning plus half their probability of drawing. That is, if the payoff for winning were 1 and for drawing .5, the expected utility of playing.

If players A and B have ratings R<sub>A</sub>, R<sub>B</sub>, the expected score of player A vs B is E<sub>A</sub> = 1/(1 + 10\^(R<sub>A</sub> - R<sub>B</sub>)/400). That 400 makes it so that a 200 points difference predicts a score of .75 for player A.

Another way of expressing this would be E<sub>A</sub> = Q<sub>A</sub>/(Q<sub>A</sub> + Q<sub>B</sub>). Where Q<sub>A</sub> = 10\^(R<sub>A</sub>/400). This way we can see the sum of the expected scores is always 1.

It then follows that for each 400 rating points of advantage over the opponent, the expected score is magnified ten times in comparison to the opponent's expected score. (e.g. both at 1500 => 50\%. 1900 vs 1500 => 10/11 odds for the stronger one).

After a game, a player A's rating is updated as 

R'<sub>A</sub> = R<sub>A</sub> + K \* (S<sub>A</sub> - E<sub>A</sub>)

Where S is the actual score the player got, and E the expected one, while K is some constant bound for maximum update.

In effect, the Elo rating is training a sigmoid that predicts probability of winning given the two ratings, assuming prob\{A wins} = sigmoid(R<sub>A,B</sub>) = 1/(1 + 10\^(R<sub>A</sub> - R<sub>B</sub>)/s) for some s (typically 400). 

Then the update step is 
R<sub>A</sub> \<- R<sub>A</sub> + K \* (S<sub>A</sub> - <sub>A</sub>)

for K = η\* log (10/s)

This is so because log(10/s) \* (S<sub>A</sub> - <sub>A</sub>) is the gradient of the loss of the sigmoid (a cross entropy for the prob of winning). 