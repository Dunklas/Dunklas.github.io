---
title: "Terminology of functions"
date: 2021-04-17T13:00:00Z
draft: false 
---
In my job as a software developer I work with functions everyday, however I don't really have much experience with functions in a mathematical context. My aim with this post is to cover some terminology of functions in a mathematical context.

---

A function is a process that relates a value in some set to a **single** value in some set. For example, suppose that $S$ is the set of all strings. We can define a function $len: S \rightarrow \mathbb{Z}$ as $len(s) = \text{length of s}$. This function relates the value of $s \in S$ to the value of $\text{length of s} \in \mathbb{Z}$.

A similar function in Java would be defined as below. Note that the functions are not equal, due to two reasons: (1) since $\mathbb{Z}$ is the set of all integers, while the data type `int` is a 32-bit signed integer; (2) $S$ is the set of all strings, while the data type `String` has a limit of how long the string may be.
```java
int len(String s) {
    return s.length();
}
```
First, as stated above, a function relates an input value from some set, to an output value from some set. The set containing input values is refered as the *domain* ($S$ in above example), while the set containing output values is refered to as the *co-domain* ($\mathbb{Z}$ in above example).

When speaking about the relation between a concrete input value and its output value, we could in a programming context say that `len` returns `13` when given `Black Sabbath` as argument. In a mathematical context the same might be expressed as:
 - $13$ *is related to* $\text{Black Sabbath}$ by \$len\$
 - \$len\$ *sends* $\text{Black Sabbath}$ to $13$
 - $\text{Black Sabbath}\xrightarrow{len}13$ 
 - $len: \text{Black Sabbath} \rightarrow 13$

Similarly, there are several ways to refer to an actual output value.
$$\begin{align*}13 &= len(\text{Black Sabbath}) \\\\[8pt\] &= len \text{ of Black Sabbath} \\\\[8pt\] &= \text{the image of Black Sabbath under } len \\\\[8pt\] &= \text{the value of len at Black Sabbath}\end{align*}$$

The set of all possible output values is referred to as the range of \$len\$ or the image of $S$ under \$len\$. Note that this is not the same as the co-domain since the co-domain may contain elements that cannot be produced by the function. In above example the co-domain is $\mathbb{Z}$ which includes negative integers. However, there is no $s \in S$ with a negative length.
$$\text{range of len} = \text{image of S under len} = \\\{z \in \mathbb{Z} \mid z = len(s) \text{, for some s in S} \\\}$$

To refer to a input value relative to some output value, we can say that $\text{Black Sabbath}$ (input value) is a pre-image, or an inverse image of $13$ (output value) under \$len\$. Note that there may be more than one pre-image of a certain output value (**Black Sabbath** is not the only string consisting of 13 characters). The set of all inverse images of an output value $13$ is also referred to as the *inverse image of 13*.
$$\text{inverse image of 13} = \\\{s \in S \mid len(s) = 13\\\}$$

---

One thing which first confused me when reading about functions in a more mathematical context is that a function is a strict relation between two values, an input value and an output value. In contrast, while programming it's very common to have functions with multiple parameters, and in some languages it's also possible to have multiple output values. However, any set of $n$ input/output values can also be seen as an ordered $n$-tuple, which makes it a single value.
