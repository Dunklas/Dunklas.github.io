---
title: "Properties of functions"
date: 2021-04-17T09:00:00Z
draft: false 
---
In my job as a software developer I work with functions everyday, however I don't really have much experience with functions in a mathematical context. My aim with this post is to cover some terminology of functions in a mathematical context, and also introduce some properties that functions may fulfill.

A function is a process that relates a value in some set to a **single** value in some set. For example, suppose that $S$ is the set of all strings. We can define a function $f: S \rightarrow \mathbb{Z}$ as $f(s) = \text{length of s}$. This function relates the value of $s \in S$ to the value of $\text{length of s} \in \mathbb{Z}$.

A similar function in Java would be defined as below. Note that the functions are not equal, due to two reasons: (1) since $\mathbb{Z}$ is the set of all integers, while the data type `int` is a 32-bit signed integer; (2) $S$ is the set of all strings, while the data type `String` has a limit of how long the string may be.
```java
int f(String s) {
    return s.length();
}
```
First, as stated above, a function relates an input value from some set, to an output value from some set. The set containing input values is refered as the *domain* ($S$ in above example), while the set containing output values is refered to as the *co-domain* ($\mathbb{Z}$ in above example).

When speaking about the relation between a concrete input value and its output value, we could in a programming context say that `f` returns `13` when given `Black Sabbath` as argument. In a mathematical context the same might be expressed as:
 - $13$ *is related to* $\text{Black Sabbath}$ by $f$
 - $f$ *sends* $\text{Black Sabbath}$ to $13$
 - $\text{Black Sabbath}\xrightarrow{f}13$ 
 - $f: \text{Black Sabbath} \rightarrow 13$

Similarly, there are several ways to refer to an actual output value.
$$\begin{align*}13 &= f(\text{Black Sabbath}) \\\\[8pt\] &= f \text{ of Black Sabbath} \\\\[8pt\] &= \text{the image of Black Sabbath under } f \\\\[8pt\] &= \text{the value of f at Black Sabbath}\end{align*}$$
The set of all possible output values may be referred to as the range of $f$ or the image of $S$ under $f$. Note that this is not the same as the co-domain, since the co-domain may contain elements that cannot be produced by the function. In above example the co-domain is $\mathbb{Z}$ which includes negative integers. However, there are no string $\in S$ with a negative length.
$$\text{range of f} = \text{image of S under f} = \\\{z \in \mathbb{Z} \mid z = f(s) \text{, for some s in S} \\\}$$

To refer to a input value relative to some output value, we can say that $\text{Black Sabbath}$ (input value) is a pre-image, or an inverse image of $13$ (output value) under $f$. Note that there may be more than one pre-image of a certain output value (**Black Sabbath** is not the only string consisting of 13 characters). The set of all inverse images of an output value $y$ is also referred to as the *inverse image of y*.
$$\text{inverse image of y} = \\\{s \in S \mid f(s) = y\\\}$$

## One-to-one

## Onto

## One-to-one correspondence