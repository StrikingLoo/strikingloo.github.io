---
layout: post
importance: 3
title: "Introduction to Data Compression"
abstract: "Notes on 'Introduction to Data Compression' by Guy E. Blelloch, Computer Science Department, Carnegie Mellon University. Currently a work in progress."
description: "Notes on 'Introduction to Data Compression' by Guy E. Blelloch, Computer Science Department, Carnegie Mellon University. Currently a work in progress."
language: English
tags: algorithms, compression, statistics, programming
---


['Introduction to Data Compression' by Guy E. Blelloch.](https://www.cs.cmu.edu/~guyb/realworld/compression.pdf)

Compression algorithms map a message (for example, a file) to a reduced version. They are composed of a pair of encoding and decoding procedures, such that a message is compressed by the former and recovered by the latter. The process can be lossless, where the recovered message is exactly the same as before, or lossy, where a part of the message (hopefully one deemed less important) may be lost in the process.

Commonly, lossless compression is used on text, and lossy is saved for images, audio and other media forms where exact recovery is not as necessary.

"Because one can’t hope to compress everything \[since an isomorphism ould necessarily require the same amount of bits in the end], all compression algorithms must assume that
there is some bias on the input messages so that some inputs are more likely than others, i.e. that
there is some unbalanced probability distribution over the possible messages. Most compression
algorithms base this “bias” on the structure of the messages – i.e., an assumption that repeated
characters are more likely than random characters, or that large white patches occur in “typical”
images. **Compression is therefore all about probability**."

When describing compression algorithms, the paper proposes to distinguish between the *coder* and the *model*. The model refers to an estimation of the distribution for the compressed tokens or characters in the message. For instance when compressing an image, we may assume it is more likely for neighboring pixels to share similar colors. The coder is the procedure that encodes data, typically by assigning shorter codes to more likely tokens, and longer ones to the ones thought to be least likely.

It can be shown that the best compression rate possible would be using only as many bits per token as their entropy. As we chunk more characters into "tokens" we could get more compression per bit (for instance modeling the string AABBBAAAA as using the tokens AA, AB, BA, BB instead of just A and B).

There is also conditional entropy (H(s\|c)): the entropy of the distribution of p(s\|c), weighted by the distribution of c over all possible contexts and s over all possible messages.

![](image/compression1.png){: loading="lazy"}

It can be shown that H(s\|c) <= H(s) and the bound is only tight if context and messages are completely independent. An example of context could be the previous n pixels before the current one, or surrounding n words, etc. 

### Huffman Codes

Huffman codes are optimal prefix codes generated from a set of probabilities by a particular algorithm, the Huffman Coding Algorithm. 

"The Huffman algorithm is very simple and is most easily described in terms of how it generates
the prefix-code tree."

```
Start with a forest of trees, one for each message (=token). Each tree contains a single vertex with
weight wi = pi.

Repeat until only a single tree remains:
	1) Select two trees with the lowest weight roots (w1 and w2). 
	2) Combine them into a single tree by adding a new root with weight w1+w2,
	 and making the two trees its children. 
	 It does not matter which is the left or right child, 
	 but our convention will be to put the lower weight root on the left if w1 != w2.

```

If I'm seeing this correctly, the most likely codes will end up nearer to the final root, and the least likely ones closer to the leaves. The algorithm is greedy in a way, as it always links the two least likely contenders until there is a single tree.

"For a code of size *n* this algorithm will require *n−1* steps since every complete binary tree with
n leaves has *n−1* internal nodes, and each step creates one internal node. If we use a priority queue
with *O(log n)* time insertions and find-mins (e.g., a heap) the algorithm will run in *O(n log n)* time.
The key property of Huffman codes is that they generate optimal prefix codes."

Example: 

```
a .2, b .3, c .3, d .1, e .1

=>
t(d e) .2
a .2

=>
t(a , t(d, e)) .4
t(b, c) .6

=>
t( t(a , t(d, e)) , t(b, c) )
```

Even though all Huffman codes have the same average (minimum) length, it can be good if average message variance is also reduced (for buffering, speed guarantees, etc.). 

To ensure this, a simple modification is breaking ties when picking which trees to merge using the two earliest created nodes. All leaves are assumed to have been created first. So if 3 nodes tie in weight, we join the two that were created earlier first. This way, trees diverge less from the average length.

### Arithmetic Coding

![](image/compression2.png){: loading="lazy"}
![](image/compression3.png){: loading="lazy"}





