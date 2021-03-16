---
title: "Permutations"
date: 2021-03-11
draft: false 
---
In the area of combinatorics both combinations and permutations are central concepts. Both combinations and permutations relates to the selection of a number of elements from a set. What differentiates the concepts is whether the selection is ordered or not.
In this post, I cover some fundamentals of what permutations are and how to count the number of permutations of sets.

## Definition
In contrast to combinations, **permutations** are *ordered* selections of elements from a set. Consider the set $X = \\{a, b, c\\}$. The set has three elements and it's possible to order them in six different ways. These are the permutations of $X$.
$$(a, b, c), (a, c, b), (b, a, c), (b, c, a), (c, a, b), (c, b, a)$$

What if we only want a selection of 2 elements from $X$? Then it's also possible to order the two elements in six different ways.
$$(a, b), (a, c), (b, a), (b, c), (c, a), (c, b)$$
This is usually refered to an $r$-permutation, and means an *ordered* selection of $r$ elements from a set. Above are the $2$-permutations of $X$.

A variation of $r$-permutations is to allow repetition. With repetition allowed there are nine $2$-permutations of $X$.
$$(a, a), (a, b), (a, c), (b, a), (b, b), (b, c), (c, a), (c, b), (c, c)$$

## Counting the number of permutations
To calculate the number of $r$-permutations of a set $X$ with $n$ elements, the process of selecting $r$ elements from $X$ can be seen as a $r$-step process.
- Select first element from $X$
- Select second element from $X$
- $\ldots$
- Select $r$'th element from $X$

### With repetition allowed
If repetition is allowed there are $n$ elements to chose from in each step. By the multiplication principle, the number of distinct $r$-permutations are:

$$n \times n \times \cdots \times n = n^r$$

This is for example useful in probability theory to calculate the number of possible outcomes of some process. Consider a PIN code consisting of four digits with allowed repetition. The selection of a PIN code may be seen as a 4-step process where there are 10 different choices (0-9) for each step. Thus there are $10^4$ possible PIN codes.

### Without repetition
If repetition is not allowed, there are $n$ elements to chose from in the first step, $n -1$ elements to chose from in the second step, and $n - r + 1$ elements to chose from in the last step.

Given that $n$ and $r$ are integers with $1 \le r \le n$, the number of $r$-permutations (without repetition) are denoted $P(n,r)$ and is given by the below formula.

$$P(n,r) = \frac{n!}{(n-r)!} = \frac{n(n-1)(n-2)\cdots(n-r+1)\cancel{(n-r)\cdots3\cdot2\cdot1}}{\cancel{(n-r)(n-r-1)\cdots3\cdot2\cdot1}}$$

Note that for the number of *permutations* ($r = n$) there are $n - r + 1 = 1$ elements to chose from in the last step. Therefore the number of permutations may be simplified to $n \times (n-1) \times (n-2) \times \cdots \times 2 \times 1 = n!$.

The number of permutations without repetition is also useful in probability theory. For example, consider the birthdays of each person in a group of five people. Pretend that it's equally likely to have ones birthday in any of the 365 days of the year. What's the probability that no two people in the group share birthday?

The set of possible birthdays contain $365$ elements. The total sample space has the same size as the number of $5$-permutations from a set of $365$ elements, with repetition allowed. The number of events where no two people share birthdays is the same as the number of $5$-permutations from a set of $365$ elements, without repetition.

$$\frac{P(365, 5)}{365^5} \approx 0,97286 \approx 97,3\%$$
