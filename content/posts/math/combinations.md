---
title: "Combinations"
tags: ['math', 'combinatorics']
date: 2021-03-11
draft: false 
---
In the area of combinatorics both combinations and permutations are central concepts. Both combinations and permutations relates to the selection of a number of elements from a set. What differentiates the concepts is whether the selection is ordered or not.
In this post, I cover some fundamentals of what combinations are and how to count the number of combinations of sets.

## Definition
**Combinations** are *unordered* selections of elements from a set. Consider the set $X = \\{a, b, c\\}$. If we want to select a combination of three elements from $X$, there is only one distinct selection that can be made. $$(a, b, c)$$
If the elements are selected in a different order, it'd be the same combination, $(a, b, c) = (b, c, a)$.

If we instead select a combination 2 elements from $X$ there are three distinct selections that can be made.
$$(a, b), (a, c), (b, c)$$
Each selection is in general refered to as an $r$-combination, and means an *unordered* selection of $r$ elements from a set. In essence, an $r$-combination is a subset of size $r$. Above are all $2$-combinations of $X$.

A variation of $r$-combinations is to allow repetition of values. With repetition allowed there are six $2$-combinations of $X$.
$$(a, a), (a, b), (a, c), (b, b), (b, c), (c, c)$$

## Counting the number of combinations
Note! In this section the concept of *permutations* is used to explain how to count number of combinations. For a better understanding, please read [Introduction to permutations]({{< ref "posts/math/permutations" >}} "Introduction to permutations") first.

### Without repetition
To calculate the number of $r$-combinations of a set $X$ with $n$ elements, it's useful to first think of how the number of $r$-permutations are calculated. The process of constructing an $r$-permutation can be seen as a 2-step process:

- Select a subset of size $r$
- Select an ordering of the subset

The first step is the same as selecting an $r$-combination. For the second step, the number of possible ways to order the elements in the subset is the same as the number of permutations of the subset, $r!$. In other words, the number of $r$-permutations of $X$ equals the number of $r$-combinations, multiplied by $r!$. Therefore we can calculate the number of $r$-combinations in the following way.
$$\frac{P(n, r)}{r!} = \frac{\frac{n!}{(n-r)!}}{r!} = \frac{n!\times1}{(n-r)!\times r!} = \frac{n!}{r!\,(n-r)!}$$
Given that $n$ and $r$ are non-negative integers with $r \le n$, the number of $r$-combinations of a set with $n$ elements is denoted ${n \choose r}$ or $C(n, r)$, and is read "chose $r$ over $n$".

The number of $r$-combinations can be used to solve problems like - There are 19 studio albums by Black Sabbath. For the rest of your life, you can only listen to 3 of them. How many combinations of studio albums do you have to consider? Since the set of studio albums by Black Sabbath has 19 elements, and we need to make a selection of 3 elements, the answer is:
$${19 \choose 3} = \frac{P(19, 3)}{3!} = \frac{19!}{3!\,(19-3)!} = \frac{19!}{3!\,16!} = \frac{19 \times 18 \times 17 \times \cancel{16!}}{3\times 2 \times 1 \times \cancel{16!}} = \frac{5814}{6} = 969$$

### With repetition allowed
To calculate the number of $r$-combinations with repetition allowed from a set $X$ with $n$ elements, it's useful to imagine $X$ as a set of categories. The objective is to select $r$ elements, where each element belong to a category of $X$, and we are allowed to include multiple elements of the same category. One way to model such a selection is as a string with **x**'s representing selected elements and **vertical bars** separating each category.

Let's say that $n = 4$, and $r = 5$ (i.e. we're to select 5 elements from a set of 4 elements).

 - **xx | x | x | x** - Two elements from category 1, one element from category 2, one element from category 3, and one element from category 4
 - **xxxxx | | |** - Five elements from category 1, no elements from any of the other categories.

By this reasoning, an $r$-combination with repetition allowed is modeled as a string of $r$ x's and $n-1$ vertical bars. So, in total the string has $r + n - 1$ symbols. The construction of such a string can be seen as a $r$-step process, where a position for an **x** is selected in each step. The remaining $n -1$ positions can simply be filled with vertical bars. Therefore, the number of $r$-combinations with repetition allowed is given by the number of $r$-combinations from a set of $r + n - 1$ elements.

$${r + n - 1 \choose r}$$

An example of a problem that can be solved with $r$-combinations with repetition - A record store is about to stock up with 20 new studio albums by Black Sabbath. They know that *Paranoid* sells more than other records, so they want *at least* 10 of those. How many ways can the 20 records be distibuted among the 19 different Black Sabbath studio albums, if the selection must include at least 10 copies of *Paranoid*?

Begin by selecting 10 copies of *Paranoid*. There are now $r = 20 - 10 = 10$ selections left to make from the set of studio albums with $n = 19$ elements. The selection may or may not include more copies of *Paranoid*.

$${10 + 19 -1 \choose 10} = {28 \choose 10} = 13123110$$


