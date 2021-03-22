---
layout: post
title: "Fundamentals of Computer Graphics"
date: 2021-03-22
tags: algo3, data structures, UBA, spanish, español, cs, algorithms
description: "Based on Fundamentals of Computer Graphics 4th edition, by Marschner and Shirley. Taken while going through the corresponding elective."
---

## Computer Graphics Areas

- **Modeling**: representing **shape and appearance** of objects and storing them in the computer.
- **Rendering**: creation of **shaded images** from 3D computer models.
- **Animation**: adds the issue of **movement over time**.

Just an awesome quote from the book:
"Modern architecture suggests that keeping memory use down and maintaining coherent memory access are the keys to efficiency. This suggests using single precision data. However, avoiding numerical problems suggests using doubleprecision arithmetic. The tradeoffs depend on the program, but it is nice to have a default in your class definitions."

> "I advocate doing all computations with floats until you find evidence that double precision is needed in a particular part of the code. —S.M."

### Debugging Computer Graphics Programs

**The Scientific Method** : Try an image output, see what's wrong about it. Make a hypothesis as to the reason, change the program accordingly. Repeat until you find the error. According to the book "Typically only a few trials are needed to track things down, and this type of debugging is enjoyable."

**Images as Coded Debugging Output**:  If you want to know the value of some variable for part of a computation that runs for every pixel, you can just modify your program temporarily to copy that value directly to the output image and skip the rest of the calculations that would normally be done. Like painting any pixel that leaves its legal range a bright (255,0,0).

