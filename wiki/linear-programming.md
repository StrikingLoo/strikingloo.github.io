---
layout: post
date: 2022-10-18
title: "Linear Programming for Optimization"
tags: computer science, algorithms, linear programming, linear algebra 
description: "A definition of the Linear Programming problem and explanation of the Simplex Algorithm, together with some theoretical considerations."
language: English
importance: 7
---

Notes from [*Linear Programming for Optimization*](https://www.researchgate.net/publication/2420905_Linear_Programming_for_Optimization), Mark Schulze, 2000.

### Definition

> Linear programming is the name of a branch of applied mathematics that deals with solving optimization problems of a particular form. Linear programming problems consist of a linear cost function (consisting of a certain number of variables) which is to be minimized or maximized subject to a certain number of constraints. The constraints are linear inequalities of the variables used in the cost function. The cost function is also sometimes called the objective function. Linear programming is closely related to linear algebra; the most noticeable difference is that linear programming often uses inequalities in the problem statement rather than equalities.

A problem can be defined as maximizing a linear function *f(x<sub>1</sub>...x<sub>n</sub>)*, the reward function, while meeting a set of constraints _A**x** <= b_ such that A is a matrix and **x** is the variables vector. Additionally all variables are constrained to be ≥0.

> Note that for some problems, non-integer values of the variables may not be desired. Solving a linear programming problem for integer values of the variables only is called integer programming and is a significantly more difficult problem. <br>The solution to an integer programming problem is not necessarily close to the solution of the same problem solved without the integer constraint. 

A problem can be **unbounded, infeasible or have an optimal solution**.

The basic algorithm most often used to solve linear programming problems is called the
**simplex method**. Over the past 50 years, it has been developed to the point that good computer programs using the simplex method and its relatives (the revised simplex method
and the network simplex method) can solve virtually any bounded, feasible linear
programming problem of reasonable size in a reasonable amount of time. 

### The Simplex Algorithm

The simplex algorithm has two phases:
- Find a feasible solution (often 0 works), and then
- Iteratively improve it by raising one variable at a time, often reducing a different variable to allow for the increase.

The simplex method works by finding a feasible solution, and then moving from that point
to any vertex of the feasible set that improves the cost function. Eventually a corner is
reached from which any movement does not improve the cost function. This is the optimal
solution.

A geometric solution can be found by rotating along the edges of the feasible polygon until finding the optimal one -which will overlap with the cost function slope-.

An algebraic solution is found through the simplex method. We add slack variables to each constraint, and constrain them to be >=0. We set *k* variables to a value of 0 and make the constraints all depend on them, to make the problem square. Any set of variables that is feasible is alright for this step. Then we iteratively choose one of the variables that have a **positive coefficient in the reward function** and raise it as much as the constraints allow. This should increase total reward. If no variable is paired to a possitive coefficient, then the algorithm has converged, as the problem is convex. After changing the value of the variable, we have set the one variable whose constraint we fit exactly to 0. We take that other variable out of the basis and restate all equations by adding the variable just set as a constraint. Repeat until convergence. 

Normally choosing any variable with a positive coefficient in the reward function as an entering variable and any feasible variable as a leaving one is enough, provided convergence is dealt with.

A **degenerate step** occurs when the reward function doesn't change value, even though one variable entered the basis and a different one left. Virtually all practical linear programming problems are degenerate.

### Termination

> The simplex method terminates by finding that the problem is infeasible or unbounded, or by finding the optimal solution. The only other possibility is that the simplex method cycles; that is, it goes through an endless, repeating sequence of non-optimal solutions (which must all have the same cost function value). Note that cycling can only occur in the presence of degeneracy, since each iteration of a cycle must be degenerate. There are several strategies for selecting either the entering or leaving variable (or both) that ensure that cycling does not occur. The simplest of these is the “smallest-subscript” rule, which
states that ties in the choice of entering and leaving variables are always broken in favor of the variable with the smallest subscript.

### Complexity and Speed

> Studies on practical linear programming problems of various sizes have shown that the simplex method typically terminates after between 1.5*m* and 3*m* iterations, where *m* is the number of constraints in the problem. The general consensus is that the number of iterations increases linearly with the number of constraints but only logarithmically with the number of variables. Theoretical studies of the efficiency of the simplex method are much less satisfactory, however. The worst case of the simplex method requires 2<sup>n</sup> -1 iterations, where n is the number of variables.

> Although the revised simplex method is not theoretically satisfactory from a computational point of view, it is by far the most widely used method to solve linear programming problems and only rarely are its limitations encountered in practical applications. **The biggest advantage of linear programming as an optimization method is that it always achieves the optimal solution if one exists.**

## Further Reading

- [Tutorial on Integer Programming](https://www.math.clemson.edu/\~mjs/courses/mthsc.440/integer.pdf) 🌱