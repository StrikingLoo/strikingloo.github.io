---
layout: post
date: 2022-09-18
title: "The Alberta Plan for AI Research"
tags: deep learning, papers,reinforcement learning,machine learning,AGI,artificial intelligence
description: "Notes on the Alberta Plan paper by Richard Sutton, describing the next steps for AI research in the Reinforcement Learning field, for the next 5 to 10 years."
abstract: "Notes on the Alberta Plan paper by Richard Sutton, describing the next steps for AI research in the Reinforcement Learning field, for the next 5 to 10 years."
language: English
importance: 3
---

The [Alberta Plan Paper in Arxiv](https://arxiv.org/pdf/2208.11173.pdf).

> The Alberta Plan is a long-term plan oriented toward basic understanding of computational intelligence. It is a plan for the next 5–10 years. It is not concerned with immediate applications of what we currently know how to do, but rather with filling in the gaps in our current understanding.

This plan lays out a possible foundation for the next years of research in the [Reinforcement Learning](/wiki/reinforcement-learning-base) paradigm. See my notes on [Introduction to Reinforcement Learning](/wiki/reinforcement-learning-sutton) for a very in-depth explanation of the field.

> Following the Alberta Plan, we seek to understand and create long-lived computational agents that interact with a vastly more complex world and come to predict and control their sensory input signals. The agents are complex only because they interact with a complex world over a long period of time; their initial design is as simple, general, and scalable as possible. To control their input signals, the agents must take action. To adapt to changes and to the complexity of the world, they must continually learn. To adapt rapidly, they must plan with a learned model the world.

> We seek to understand and **create long-lived computational agents that interact with a vastly more complex world and come to predict and control their sensory input signals, particularly a distinguished scalar signal called reward**. The overall setting we consider is familiar from the field of reinforcement learning.

> The larger sensory signal, the observation, is explicitly not expected to provide
complete information about the state of the environment. The second sensory signal, the
reward, is scalar and defines the ultimate goal of the agent—to maximize the total reward
summed over time

> The first distinguishing feature of the Alberta Plan’s research vision is its emphasis on **ordinary experience**, as described above, as opposed to special training sets, human assistance, or access to the internal structure of the world.

> The second distinguishing feature of the Alberta Plan’s research vision can be summarized in the phrase temporal uniformity. Temporal uniformity means that all times are the same with respect to the algorithms running on the agent. There are no special training periods when training information is available or when rewards are counted more or less than others. If training information is provided, as it is via the reward signal, then it is provided on every time step. If the agent learns or plans, then it learns or plans on every time step.

> If the agent can reduce its speed of learning about parts of the environment when they appear stable, then it can also increase its speed of learning when they start to change.

> Third feature: **We must heed the bitter lesson of AI’s past and prioritize methods, such as learning and search, that scale extensively with computer power**, while de-emphasizing methods that do not, such as human insight into a problem domain and human-labeled training sets.

> "A better action might be available from planning, but planning, and even learning, takes time; **sometimes it is better to act fast than to act well.**"

> Giving priority to reactive action in this way does not preclude an important role for planning. The reactive policy may recommend a temporizing action until planning has improved the policy before a more committal action is taken, just as a chess player may wait until she is sure of her move before making it.

> The fourth distinguishing feature of the Alberta Plan research vision is that **it includes a focus on the special case in which the environment includes other intelligent agents.** In this case the primary agent may learn to communicate, cooperate, and compete with the environment and **should be cognizant that the environment may behave differently in response to its action.** AI research into game playing must often deal with these issues. The case of two or more cooperating agents also includes cognitive assistants and prostheses. This case is studied as Intelligence Amplification (IA), a subfield of human-machine interaction.

---
> The Alberta Plan characterizes the **problem of AI as the online maximization of reward via continual sensing and acting, with limited computation, and potentially in the presence of other agents.** This characterization might seem natural, even obvious, but it is also contrary to current practice, which is often focused on offline learning, prepared training sets, human assistance, and unlimited computation. The Alberta Plan research vision is both classical and contrarian, and radical in the sense of going to the root.

## Base Agent Model

The Base Agent model, similar to how it is described in the Introduction to Reinforcement Learning book, consists of four modules: **Perception** which models the state -features, senses, etc.-, **Reactive Policies** which can be multiple policies for deciding action, each with a **Value Function**, with a designated primary policy. The fourth component would be the **Transition Model**, which predicts the reward and next state given the current state and an action, and runs in the background to do planning -it could also predict the final reward for an episode, or other more temporally distant things-.

Planning is an ongoing process that operates asynchronously, in the background, whenever it
can be done without interfering with the first three components, all of which must operate on every time step and are said to run in the foreground.

All four components
are updated by learning processes operating in the foreground using the most recent events
together with short-term credit-assignment memories such as eligibility traces.

## Roadmap for AI Research

They propose a 12 step roadmap that should not be taken too rigidly.

> The steps progress from the development of novel algorithms for core abilities (for representation, prediction, planning, and control) toward the combination of those algorithms to produce complete prototype systems for continual, model-based AI. 

> An eternal dilemma in AI is that of “the parts and the whole.” A complete AI system cannot be built until effective algorithms for the core abilities exist, but exactly which core abilities are required cannot be known until a complete system has been assembled. To solve this chicken-and-egg problem, we must work on both chickens and eggs, systems and component algorithms, parts and wholes, in parallel. The result is imperfect, with wasted effort, but probably unavoidably so.

### Step 1: Continual supervised learning with given features

> The overall idea of Step 1 is to design as powerful an algorithm as possible given a fixed feature representation. It should include all the most important issues of nonstationarity in the problem (for a fixed set of linear features), including the tracking of changes in feature relevance. It should include the meta-learning of feature relevance, a challenging issue in representation learning—arguably the most challenging issue—but it does not include actually changing the set of features under consideration; that is explored in Step 2.

### Step 2. Representation II: Supervised feature finding

> This step is focused on creating and introducing new features (made by combining existing features) in the context of continual supervised learning as in Step 1. <br>Solution methods would presumably be, broadly speaking, some form of smart generation of promising features and then smart testing to rank and replace them. <br>You can represent and gather data on a limited number of features. When should you discard an old feature so that you can
collect data on a new one? How is the new feature constructed? How is the discarded
feature selected?

### Step 3. Prediction I: Continual GVF prediction learning

> Repeat the above two steps for sequential, real-time settings where the data is not i.i.d., but rather is from a process with state and the task is generalized value function (GVF) prediction. Extend to non-stationarity.

### Step 4. Control I: Continual actor-critic control

> Repeat the above three steps for control. First in a conventional k-arm bandit setting, then in a contextual bandit setting with discrete softmax actions, then in a sequential setting with given features, and finally in a sequential setting with feature finding. In the last two sub-steps we are looking for an actor-critic algorithm. The critic would presumably be that resulting from Steps 1-3.

*Steps 5 and 6 are about extending to average-reward GVF learning and continuing control problems.*

### Step 7. Planning I: Planning with average reward

Develop incremental planning methods based on asynchronous dynamic programming for the average-reward criteria.

Steps 8 through 12 involve more advanced kinds of planning or are more vague and speculative, however exciting.

