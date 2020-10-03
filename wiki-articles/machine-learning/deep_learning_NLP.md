# Deep Learning for NLP
Deep Learning + NLP
_Based on the Stanford MOOC_
[http://web.stanford.edu/class/cs224n/index.html](http://web.stanford.edu/class/cs224n/index.html#schedule) # Syllabus
## Word2Vec

Word2Vec optimizes for dot product between similar words (softmax(UWi)).

But you can also make it sigmoid(WiUj) for each word, for each context embedding Uj in a window, and then that + sigmoid(-WiUk) for k chosen randomly. Similar to a Boltzmann Machine’s unlearning, in a way.

Hyperparam magics: performance plateaus at d=300 (but doesn’t fall apart, even at 10k!! -nips, 2018-). Seems to have something to do with PCA.

Then another thing: data quality matters like crazy. Model with "small" Wikipedia dataset outperforms model with BIG news scraped dataset.

Evaluating Word Embeddings: You can evaluate analogies (with accuracy over premade datasets, using semantic or syntactic analogy), or cosine distance/similarity vs psych-undergrad-driven mechanical turk similarity.

##Language Modeling:
Train a model to predict the t+1th word based on the previous n words.

Fixed-window:
predict using the previous fixed k words. E.g., use a Markov chain or a co-occurrence matrix. You can train a fully connected MLP using one-hot encoding of the words (super sparse vectors as inputs -actually passed as indices in any sane implementation-).

**Insight:**
Semantically similar words should produce similar "next word" distributions, but normal window models don’t leverage that! Let’s add some embeddings into the mix.

**Arbitrary length window:** 

Train an RNN. This means divide your dataset into sequences (usually sentences, paragraphs, or whole texts from your corpus).
For every sequence, you initialize a hidden state h with zeroes (or a reasonable prior). You take each i-th word in order, get its embedding, concat that with h, make that go through an affine layer, plus bias, and use that to predict the i+1-th word (through your typical affine + softmax layer). After doing this for every word in your batch, you backpropagate the binary cross entropy loss of the generated probabilities, for every word, and thus get a better W matrix for both the hidden state and the embeddings (you can train h0 too. You could also train the embeddings if your corpus was large enough).

**Perplexity:**

Defined as the inverse of the probability of the corpus, normalized by ^1/N. Another way to look at it: take the geometric average of the inverse probability your model gives to each t+1-th word, given the previous t of them.
GPT-3 gets about 20 as a perplexity value (so mean probability is about .05. Not bad).

**Vanishing vs Exploding Gradient:**

The gradient for the t-th word is the productorial of the gradients of the previous t-1 words, which means if the norm of the Jacobian is <1 then it will be exponentially small on the amount of words, and the opposite will happen for a Jacobian >1.
This means a word a few spaces in the future, won’t make a big enough impact in decisions in the past.
We solve exploding gradients with clipping gradient: if gradient norm > e, then scale it down to norm e, for e a hyperparameter.

To solve vanishing gradients, two architectures were invented: LSTM and GRU, which is just a streamlined LSTM (a few less gates, converges faster and has less parameters). They usually perform similarly, or LSTM a bit better since it has more parameters.

**LSTM**
LSTMs have Cell States aside from hidden states, and they save information in the cell state and decide which parts to pass along with hidden states.
They have forget, input and output gates, each a sigmoid of an affine transformation of the concatenation of the inputs (for word t) and the hidden state (t-1).
You make your cell state^ be tanh(another affine transform from input and hidden state t-1).
Then your actual cell state is input gate * that cell state + forget gate * last cell state.
Finally, you update your hidden state as output_gate * tanh( cell).

![](deep_learning_NLP_images/Screen%20Shot%202020-09-26%20at%2019.12.09.png){: style="height:70%; width:70%"}

**GRU**
They work similarly, but have less gates. Instead of output gate and tanh of cell, you just make a convex sum between update gate times previous hidden state, and 1- update gate times tanh of affine of inputs + hidden state t-1 (times a reset_gate that’s kinda like a forget gate).

![](deep_learning_NLP_images/Screen%20Shot%202020-09-26%20at%2019.13.48.png){: style="height:70%; width:70%"}

**Seq2Seq for Neural Machine Translation**

![](deep_learning_NLP_images/Screen%20Shot%202020-10-03%20at%2016.22.46.png){: style="height:70%; width:70%"}

![](deep_learning_NLP_images/Screen%20Shot%202020-10-03%20at%2016.24.31.png){: style="height:70%; width:70%"}

![](deep_learning_NLP_images/Screen%20Shot%202020-10-03%20at%2016.25.00.png){: style="height:70%; width:70%"}

![](deep_learning_NLP_images/Screen%20Shot%202020-10-03%20at%2016.25.41.png){: style="height:70%; width:70%"}

You train an encoder RNN (With the usual chirimbolos: Word Embeddings, usually you could use an LSTM or GRU etc.) on the source language, and then train a different decoder RNN that has as its starting hidden state not a random or 0s vector, but the hidden state for the last word in the source sentence.
It then has to generate all the words in the target sentence. You backpropagate the error in each word using cross entropy on softmax (with the same tricks you used for, say, word embeddings for the big vocab size).

![](deep_learning_NLP_images/Screen%20Shot%202020-10-03%20at%2016.26.00.png){: style="height:70%; width:70%"}

On the feedforward/test phase, you can sample the most likely word every time (greedy approach) or sample the top k most likely words, then keep expanding the top k most likely sequences of words, always stopping whenever you reach an end of sentence token.

Since log likelihood necessarily decreases as more words are added, and the most likely sentence ever is just empty sentence, you normalize sentences by 1/N for N size of sentence in words, to get a normalized score and not penalize long sentences.

![](deep_learning_NLP_images/Screen%20Shot%202020-10-03%20at%2016.27.10.png){: style="height:70%; width:70%"}

But how do we solve for the fact that the last hidden state may not contain all the information, especially from words far away in the beginning of the sentence?

![](deep_learning_NLP_images/Screen%20Shot%202020-10-03%20at%2016.28.05.png){: style="height:70%; width:70%"}

We add attention! Here’s how it works:
* You take the hidden state for your i-th word on the target sentence.
* Take dot product with each hidden state on the source sentence.
* Take vector of inner products (they’re each a scalar) and do softmax on it. You now have a probability (attention) distribution.
* Take the convex sum of encoder hidden states weighted by the attention each one gets. Concatenate that with the decoder hidden state and use that for the affine layer before softmax.
It can also get more general: instead of convex sum of dot products, you could do dot product between the states and a matrix in the middle, or do crazy things with tanh and a different vector for attention allocation.

![](deep_learning_NLP_images/Screen%20Shot%202020-10-03%20at%2016.28.14.png){: style="height:70%; width:70%"}

![](deep_learning_NLP_images/Screen%20Shot%202020-10-03%20at%2016.28.26.png){: style="height:70%; width:70%"}

