---
layout: post
date: 2022-06-22
title: "Evolution through Large Models, OpenAI"
tags: deep learning, papers, LLMs, EC, genetic algorithms,sodaracer,MAPElites,ELM,transformers,reinforcement learning,machine learning
description: "Notes on the ELM paper, which uses a three-step invention pipeline combining LLM mutators, MAPElites (a genetic algorithm) and RL to design racing robots."
language: English
importance: 7
---

<https://arxiv.org/pdf/2206.08896.pdf>

Evolution through Large Models by OpenAI

From Abstract:
"This paper pursues the insight that large language models (LLMs)
trained to generate code can vastly improve the effectiveness of mutation
operators applied to programs in genetic programming (GP). Because such
LLMs benefit from training data that includes sequential changes and
modifications, they can approximate likely changes that humans would
make. To highlight the breadth of implications of such evolution through
large models (ELM), in the main experiment ELM combined with MAPElites generates hundreds of thousands of functional examples of Python
programs that output working ambulating robots in the Sodarace domain,
which the original LLM had never seen in pre-training. **These examples then help to bootstrap training a new conditional language model that can output the right walker for a particular terrain**"

---

My notes and highlights from the ELM paper by OpenAI, which uses a three-step invention pipeline combining LLM mutators, MAPElites (a genetic algorithm) and RL to design racing robots.

The three stages are:
- **Data Generation through ELM**: They use MAPElites to generate a grid of niches, then start with a seed (expressed in functioning Python code) and mutate it with a diff-based LLM repeatedly, until reaching very good candidates that fill multiple niches (defined with width, height and mass).
- **Language Model Training**: After generating a big dataset of functioning Python code that codifies fit and diverse racers, a version of the diff-LLM is fit to generate more candidates, using a simple autoregressive loss. This way a language model is trained on a previously inexistent dataset for a specific kind of text.
- **Conditional RL**: A RL model is trained that generates conditioned racers, initializing weights from the stage two LLM and conditioning it on a terrain embedding (which is fit using a ResNet over an image of the terrain) as input. This way, using run length as a reward, a new autoregressive model is trained, this time conditional, which generates even fitter, diverse racers (with some emerging properties)

The authors discuss how this could be applied to other, open-ended tasks and spark innovation in multiple novel domains, and how innovation can bootstrap itself to develop more things (mentioning the concept of DCT).

---

*What follows is mostly excerpts and highlights.*

This work aims to find synergy between Genetic Programming and LLMs. 

"In this new Evolution through Large Models (ELM) approach, an **LLM trained on code** can suggest mutations that are intelligent, **thereby facilitating a dramatically more effective mutation operator** that sidesteps many of the challenges that previously existed for evolving programs"

"The set of
samples generated through the LLM can eventually constitute a new training
set in a novel domain that can then fine-tune the LLM to perform well in the
new domain, a novel data-generation procedure. Furthermore, this approach
ultimately opens up new opportunities in the pursuit of open-endedness by increasing the generative capabilities of the LLM solely through its own generated
data."

Similar to self-supervised LLMs, we have a model that generates its own future training data. An Ouroboros of Artificial Intelligence. I love it.

"While it might seem at first glance that
LLMs therefore might out-compete or subsume GP, in fact **GP does still offer
an advantage** in situations where the particular **class of programs targeted by
the search is far (or even completely lacking) from the training distribution of
the LLM.** In such cases, the LLM offers limited recourse (prompt engineering to
learn an entirely new domain would be prohibitive), while GP can in principle
evolve in any space (though in practice some spaces may be intractable due to
the amount of mutation necessary to get consistent signal on fitness)."

> The LLM in concert with evolution can steer each other towards the right region of the solution space even
though neither evolution with a conventional mutation operator nor the LLM
on its own could generate anything close.

"open-endedness is fundamentally about **searching
outside the distribution of previous experience**, which is exactly what ELM
helps the LLM to do."

Experiments that follow show that generated data is sufficiently rich that it can serve as training data for fine-tuning LLMs to generate
code for viable new Sodaracers consistently, and furthermore that reinforcement
learning (RL) can even fine-tune an augmented LLM to output Sodaracers conditionally, depending on the terrain.

One obstacle of making GP write code is that scaling GP to evolve increasingly complicated programs can be challenging, and that effectively applying GP to a new domain can require significant domain expertise. A researcher often must explicitly specify what functions, variables, and control structures are available to
evolution, which limits what ultimately can be evolved. In contrast,
a human programmer can open-endedly decide what libraries to import and
how to write many interdependent subroutines or classes.

A diff is an incremental change to a file that is committed to a version control system such as GitHub, accompanied by a commit
message describing the intent of the change. In this way, diff models are trained
how, given a piece of code and any potential commit message, to suggest an
informed change. Through the lens of evolutionary algorithms, such **diff models can be viewed as intelligent perturbation operators**, providing a way to walk
over the manifold of code (in a controllable way) through mimicking human programmers. An interesting further possibility is that **such models are amenable
to further training through gradient descent, implying a potentially-powerful
mechanism for self-adaptation** (e.g. through reinforcing successful diffs during
evolution). Both diff models and their capacity for self-adaptation are explored
in this work as a way to improve GP. 

> Within artificial life, the field of open-endedness seeks to create algorithmic systems that produce never-ending innovation.

This paper argues that **computer programs are a general and powerful encoding** for continually expanding the richness of an existing environment.

### Approach: Evolution through Large Models

Three distinct components facilitate ELM. 
- The novel mutation operator driven by an LLM. 
- An evolutionary outer loop that calls this mutation operator. 
- A method for updating the LLM to improve based on its preceding performance.

*Diff models* are trained by giving an LLM the code file and a commit message (concatenated as input, files are small) and they need to predict the whole diff, but nothing else (this makes it impractical for it to just memorize the initial file).

To achieve meaningful mutations, ELM can choose among a set of commit
messages, which convey to the LLM the details of the operation it should perform in lieu of mutation. 

The commit messages used are:
- Changed make walker function.
- Changed parameters in make walker function.
- Small change to make walker function.

"We do not yet know how to make an algorithm that exhibits
genuinely open-ended divergence. While there has been progress towards openendedness in recent years, the state of the art remains weak open-endedness,
wherein novel and interesting discovery continues only for a brief time, eventually ending in a plateau as the possibilities are exhausted."

In contrast, in strong open-endedness, the process would never plateau–if we
left and returned a year later, or even a million years later, its products would
continue to become more interesting over time. No algorithm comes close to
such an achievement, though it is possible in nature.

> The challenge of devising artificial environments with unbounded potential raises the intriguing question of what property our universe and planet possess that is lacking in current artificial environments.

They discuss DCTs (Detached Conditional Things), things that don't evolve organically but the agents can manipulate, create or move in multiple ways.

While any QD algorithm can work with ELM, the specific algorithm in the
experiment in this paper is MAP-Elites [🌱](https://arxiv.org/abs/1504.04909),[🌱](https://doi.org/10.1145/3321707.3321799).

The core of MAPElites is a uniformly-spaced grid of niches (called the map), that spans user-specified dimensions of solution diversity, called the behavior characterization.

Upon initialization, a single pre-existing (hand-designed in this paper) solution
is evaluated and placed into the map. In each iteration thereafter, an inhabited
niche is randomly chosen and the solution within that niche is perturbed by the
diff model and evaluated. The new candidate solution is assigned its niche from
its behavior characterization, and if that niche is unfilled or the new solution outperforms the niche’s current inhabitant, it becomes the champion of that niche;
otherwise, the candidate is discarded. In this way, over iterations of search, the
map gradually fills with increasingly diverse and high-quality solutions.

"In each iteration, an existing Python
solution is sampled from the map of solutions for each independent replica of
a diff model. Each replica generates a batch of diffs that are applied to the
sampled solution to generate modified candidate solutions. These candidates are
evaluated and are then inserted into the map if they either establish a new niche
or outperform the niche’s current champion."

### Fine-tuning the Diff Operator

The pre-trained diff model can be trained further with
accepted diffs (by MAP-Elites) from initial iterations or runs of ELM.

Fine-tuning the diff model on accepted diffs from an initial series of runs
greatly increased performance; while Sodarace-generating programs
are out-of-distribution for the pretrained diff model (applying a Python encoding
to this domain is a novel enterprise), fine-tuning effectively aligns the diff model
with the domain, an interesting result. 

The fine-tuned diff model produces a significantly higher percentage of diffs that are valid (i.e. able to be applied) and runnable (i.e. the patched program is executable). 

Because of their higher performance, the output of runs applying the fine-tuned diff model are the ones passed to later stages in the pipeline.

## Pipeline Stage One: Data Generation through ELM

"ELM shows that by combining an intelligent LLM-based mutation operator with a QD algorithm it is possible to generate **hundreds of thousands of working training examples** in a completely novel domain where no data was previously available."

In this step, a 12x12x12 grid of height, width and mass is initialized with a seed program, and the mutation operator is repeatedly applied to individuals in the grid, which are then evlauated to see which niche (grid space) they fill and whether they beat that niche's champion. If they do, they replace it.

The mutator LLM is optionally fine-tuned on diffs that generated valid outputs (physically viable, compiles and runs, etc.). This improves the model.

## Pipeline Stage Two: Language Model Training

The second stage of the invention pipeline fine-tunes an LLM on the products of stage one.

From each run all solutions ever admitted to the map are
included, subject to meeting a minimal bar for performance. Some parts of
the behavior space offer more stringent challenges (e.g., tall, thin, no mass), and yet those kinds of solutions may yet be
most effective in some terrains, despite their low level of absolute performance. Thus, for each niche, the maximum performance across all runs is calculated, and the minimal bar for inclusion is set as a percentage of that per-niche score. With a higher percentage threshold, less data is included, but the quality of that data will be higher.

## Pipeline Stage Three: Conditional RL

They convert the model to a conditional one, i.e. a
model that accepts terrains as inputs, and produces samples of Sodaracers in
response.

Given a distribution over terrains *p(t)*, an RL setting is constructed to train
the parameters of the *TEN (Terrain Encoding Network)* and further finetune the LLM parameters to the conditional setting.

In particular, an episode now consists of sampling *t ∼ p(t)*, and sampling a program from the conditional (autoregressive) distribution. The program is converted to a Sodaracer, evaluated in simulation with the terrain *t*, and the reward is defined as the absolute distance traversed by the Sodaracer in a given period of time.

The future vision is to lay the groundwork for the ability to
**deploy agents capable of conditional invention in rich, potentially multi-agent
environments** that support the development of open-ended processes.

A small set of terrains from which distributions that force conditionality can be constructed.

The embedding for the terrain (TEN) is **constructed using ResNet-50, which is trained as part of the RL task** (lots of parameters for small distribution, but may generalize better to new terrains).

Proximal policy optimization [PPO] is the RL algorithm, in conjunction with generalized advantage estimation [GAE], with default hyperparameters.

In short, the main result is the outputs of Stage 3, and thus the complete pipeline, are conditional inventors of the desired form.
Moreover, in most cases, the RL models are comparable to or better than the
best-performing Sodaracers sampled from the dataset or the pretrained LLM

### Discussion

The problem then is that arbitrary mutations to an already-formulated program are
very unlikely to be useful.

A few years ago, the idea that the mutation operator could “know” how to
perturb such programs in reasonable and promising ways would be fanciful, but,
as shown in this paper, the emergence of LLMs has now made such capabilities
a reality.

### Related Links
- [Code completion with GPT-3](https://news.ycombinator.com/item?id=32532875), a HackerNews thread with a nice example + template.
- [FunSearch: Making New Discoveries in Mathematical Sciences using LLMs - DeepMind](https://deepmind.google/discover/blog/funsearch-making-new-discoveries-in-mathematical-sciences-using-large-language-models/)
- [Advancements in machine learning for machine learning](https://blog.research.google/2023/12/advancements-in-machine-learning-for.html)

> We show how we use ML to improve efficiency of ML workloads! Prior works, both internal and external, have shown that we can use ML to improve performance of ML programs by selecting better ML compiler decisions. Although there exist a few datasets for program performance prediction, they target small sub-programs, such as basic blocks or kernels. We introduce “TpuGraphs: A Performance Prediction Dataset on Large Tensor Computational Graphs” (presented at NeurIPS 2023), which we recently released to fuel more research in ML for program optimization.

They train a model to predict computational cost based on compute graph. The model takes nodes as input, mapping them to an opcode_id that has a corresponding embedding, concatenated to a vector of node specific features. They aggregate these vectors for all nodes or a smart sample of them, then move this aggregated vector (concatted to a vector of graph-specific features) through a feed-forward layer. That gives them a numerical estimator of the cost.

In training, they only keep the intermediate states and backpropagate them for a sample of nodes, getting significant training-speed gains.

- Three years later: [AlphaEvolve: A Gemini-powered coding agent for designing advanced algorithms](https://deepmind.google/discover/blog/alphaevolve-a-gemini-powered-coding-agent-for-designing-advanced-algorithms/) also uses an evolutionary (diff based mutation) approach to code development, to amazing results in multiple optimization problems.