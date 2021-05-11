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

---

### Debugging Computer Graphics Programs

**The Scientific Method** : Try an image output, see what's wrong about it. Make a hypothesis as to the reason, change the program accordingly. Repeat until you find the error. According to the book "Typically only a few trials are needed to track things down, and this type of debugging is enjoyable."

**Images as Coded Debugging Output**:  If you want to know the value of some variable for part of a computation that runs for every pixel, you can just modify your program temporarily to copy that value directly to the output image and skip the rest of the calculations that would normally be done. Like painting any pixel that leaves its legal range a bright (255,0,0).

---
## Raster vs Vectorial

**Raster**: We represent an image as a matrix of pixels.

**Vectorial**: We represent the image as a set of geommetric shapes. They are described in HTML or any static language. They are mostly used for simple images, as complex images with shading and such would be hard to represent in a non-rasterized format, and since most displays use a rasterized format, vectorized images necessarily go through a conversion before display.

### Color Representations

RGB is the classic format. 

### Pixel Storage Order

- Sequential -most common one-
- Separate Channels -save all R values, then all G, then all B.
- Z-format -swizzling-: super fun! Make a Z: first four pixels. Then a Z to the right, then down, then diag. Repeat recursively until you cover all of the image.

### Image formats
Few colors: Better use .png or .bmp
Many colors, or real pictures from a camera: Better use JPEG. It compresses with loss, but it's not very noticeable.

formats:
- .bmp and .ppc: compressionless
- .png: has a color dictionary optionally for compression, and has lossless compression
- .jpg and gif: have a very aggressive compressive algorithm, you can choose how much to compress and it uses 8-bits per pixel. 

Error Dithering: uses one of a list of colors for each pixel upon compression, but also takes neighbors into account, and maintains an "average intensity" for each grid of 9.

### Alpha Compositing

Consists of superposing to images, keeping a piece of each as per opacity values.

![](image/alpha-compositing.png)

## Bezier Curves

Bezier curves allow us to model curves in three dimensional or bidimensional space, and parameterize them with a single real number between 0 and 1 (or a bigger range for more ganularity).

They take this form:

![](image/bezier.png)

To evaluate what a curve's value is for a certain input t, we could evaluate it directly, or we can iteratively take the interpolation that's `t%` between every two points (in a convex hull's perimeter), this gives us n-1 points. We repeat again and again until keeping only one point, which is our desired value.

