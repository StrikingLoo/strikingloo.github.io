---
layout: post
title: "Synthesis of General Reactive(1) Designs"
date: 2021-10-11
tags: UBA, cs, algorithms, LTS, DCS, paper, GR(1), LTL
description: "Notes taken from the paper on Synthesis of Reactive(1) designs, introducing GR(1) and an algorithm for automatic controller synthesis for such LTL specifications"
language: English
---

One of the most ambitious and challenging problems in computer science is the automatic synthesis of programs and
(digital) designs from logical specifications. A solution to this problem would lift programming from the current level, which
is mostly imperative, to a declarative, logical style. There is some evidence that this level is preferable, in particular when
concurrency plays an important role.

The high complexity established in [8,11] [of constructing a Büchi automaton to solve a LTL-constrained problem] caused the synthesis process to be identified as hopelessly intractable and
discouraged many practitioners from ever attempting to use it for any sizeable system development. Yet there exist several
interesting cases where the synthesis problem can be solved in polynomial time, by using simpler automata or partial
fragments of ltl.

This paper can be viewed as a generalization of the results of [16] and [13] into the wider class of Generalized Reactivity(1)
formulas (gr(1)), i.e., formulas of the form
(1 E p1 ∧···∧ 1 E pm) → (1 Eq1 ∧···∧ 1 Eqn). (1)
Here, we assume that the specification is an implication between a set of assumptions and a set of guarantees.
1 Following
the results of [18], we show how any synthesis problem whose specification is a gr(1) formula can be solved with effort
O(mnN2), where N is the size of the state space of the design and effort is measured in symbolic steps, i.e., in the number
of preimage computations [19]. Furthermore, we present a symbolic algorithm for extracting a design (program) which
implements the specification.

Second, we show that each of the assumptions and
guarantees can be a deterministic “Just Discrete System” (Büchi automaton). Thus, our method does not incur the exponential blow-ups incurred in ltl synthesis for the translation of the formula to an automaton and for the determinization of the
automaton because the user provides the specification as a set of deterministic automata. (But note that the state space of
the system is the product of the sizes of the automata, which may cause an exponential blowup.)

> Intuitively, many specifications can naturally be split into assumptions on the environment and guarantees on the system.

We define a **run** to be a sequence of states s0,s1,... such that it satisfies:
- **initiality**: s0 \|= θ
- **consecution** : para todo j >= 0, (sj, sj+1) \|= ρ

A run is maximal if it is infinite or terminal (sk last element s.t. there is no sk+1 s.t. (sk, sk+1) \|= ρ).

A run is a **computation** if it also satisfies:
- **it is infinite**
- **Justice** : the computation contains infinitely many J-positions for every J constraint of justice.
- **Compassion** : for every (P, Q) in C:  if σ contains infinitely many P -positions, it must also contain infinitely many Q -positions.

An FDS D implements ϕ iff every run of D is infinite, and every run of D satisfies ϕ.

> Compassion is only needed in cases, in which the system uses built-in synchronization constructs such as semaphores or synchronous communication. Therefore most systems can be specified as compassion-free (Just-discrete systems).

We are interested in open systems. That is, systems that interact with their environment: that receive some inputs
and react to them. For such systems specifications are usually partitioned into assumptions and guarantees. The intended
meaning is that if all assumptions hold then all guarantees should hold as well.

A play σ = s0, s1,... is winning for the system if either (i) σ is finite and there is no assignment sX ∈ ΣX such that
(sn, sX ) \|= ρe , where sn is the last state in σ , or (ii) σ is infinite and it satisfies ϕ.

Given an ltl formula over sets of input and output variables X and Y, respectively, its realizability problem [whether a fairness-free controller D FDS for it exists] can be reduced to the decision of winner in a game. Formally: Gϕ = \<X ∪ Y,X ,Y,true,true,true,true,ϕ\> is the game where the
initial conditions and the transition relations are true and the winning condition is ϕ. If the environment is winning in Gϕ,
then ϕ is unrealizable.  If the system is winning in Gϕ, then ϕ is realizable.

In this paper we are interested in a subset of ltl for which we solve realizability and synthesis in time exponential in the size of the ltl formula and polynomial in the resulting controller.

The system wins in a game G iff ϕG is realizable

It follows that we can solve realizability of ltl formulas in the form that interests us in polynomial (quadratic) time.

> Implication between strict realizability and realizability is only one way: Podes cumplir todas las Je -> cumplir todas las Js (realizability) o strict realizability: cumplir toda Je y toda Js. 

Notar que strict implica non-strict, pero non-strict te abre el camino a que el sistema rompa su safety si eso viola la liveness del environment.

Automatic synthesis is first and foremost applicable to control circuitry. We are looking into methods to beneficially
combine manually coded data paths with automatically synthesized control circuitry.

- No entendi bien en GR(1) la nocion de 'D is complete with respect to X'.
- No me cierran mu y nu, y no me cierra qué funcion cumple el environment.
- Por lo anterior, no entiendo el algoritmo de fixpoint que usan. Entiendo que logra resolver el problema y mayormente el problema lo entiendo tambien, pero no la forma de formularlo usando mu y nu y fixpoints whatever that means.

- ρ2 en fig2 : `mY[j][r]∧¬mY[j][<r]`. Que es?
- ρ3 esta bien? Dice Je y despues Js.
