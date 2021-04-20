---
title: "Properties of functions"
tags: ['math', 'functions']
date: 2021-04-18T14:00:00Z
draft: false 
---
In a [previous post]({{< ref "posts/math/functions_terminology" >}}) I covered some basic terminology of functions in a mathematical context. In this post, I will continue and explain some properties that a function may or may not fulfill.
## One-to-one
Consider a function $f: \mathbb{R} \rightarrow \mathbb{R}$ defined as $f(x) = x^2$. Note that $f$ can have an output value which has two different inverse images, e.g. $f(-3) = f(3) = 9$, but $-3 \ne 3$. This fact means that $f$ does **not** satisfy the property of being *one-to-one*, or *injective*.
For a function to be one-to-one, the image of every element in the domain must be unique (no two input values produces the same output value). Symbolically the property can be stated as:
$$f: \mathbb{R} \rightarrow \mathbb{R} \text{ is one-to-one} \iff \forall{r_1,r_2} \in \mathbb{R}, f(r_1) = f(r_2) \rightarrow r_1 = r_2 $$

To prove that a function is one-to-one you may take a positive approach. Suppose that you have two values $r_1$ and $r_2$ such that $f(r_1) = f(r_2)$, and then use direct proof to show that $r_1$ and $r_2$ are equal. For the above mentioned function $f$, you my start as:
$$\begin{align*} f(r_1) = f(r_2) &\rightarrow (r_1)^2 = (r_2)^2 \\\\[8pt] &\rightarrow \sqrt{(r_1)^2} = \sqrt{(r_2)^2} \end{align*}$$
Here we encounter a problem, since the square root can be positive or negative, the two values aren't necessarily equal. So we can deduce that this function is not one-to-one.

A special case where it's very easy to determine that a function is not one-to-one is when the domain has more elements than the co-domain. This is made clear by the [pigeonhole principle](https://en.wikipedia.org/wiki/Pigeonhole_principle) which states that if $n$ items are put into $m$ containers and $n > m$, then at least one container must contain more than one item.

## Onto
In the [previous post]({{< ref "posts/math/functions_terminology" >}}) I explained that the range of a function and its co-domain is not the same thing. The co-domain may include elements which are not part of a functions range. However, for functions where the co-domain equals the range, we say that the function is *onto*, or *surjective*. In other words, a function $f: X \rightarrow Y$ is onto if for every $y \in Y$, there exist an element $x \in X$ such that $f(x) = y$. Symbolically the property can be stated as:
$$f: X \rightarrow Y \text{ is onto} \iff \forall{y} \in Y, \exists x \in X \text{ such that } f(x) = y$$

To prove that a function is onto, we can suppose that we have any given element $y$ in the co-domain, and then show that there exist an element $x$ in the domain such that $f(x) = y$.

For example, consider $g: \mathbb{R} \rightarrow \mathbb{R}$ defined as $g(x) = 2x + 1$. Suppose that $y$ is any real number. We must show that there exist a real number $x$ such that $g(x) = y$. Next, suppose that there is a real number $m$ such that $y = 2m + 1$. Then:
$$\begin{align*} y = 2m + 1 &\rightarrow y - 1 = 2m \\\\[8pt] &\rightarrow \frac{y - 1}{2} = m\end{align*}$$

Now suppose that $x = m = \frac{y - 1}{2}$. Then:
$$\begin{align*} g(x) &= 2x + 1 \\\\[8pt] &= 2 \cdot \frac{y-1}{2} + 1 \\\\[8pt] &= \frac{2 \cdot (y-1)}{2} + 1 \\\\[8pt] &= y - 1 + 1 \\\\[8pt] &= y \end{align*}$$

## One-to-one correspondence
If a function $f: X \rightarrow Y$ fulfills both the property of being *one-to-one* and of being *onto*, we can draw some conclusions. First, since $f$ is a function we know that for any element $x$ in $X$, there is an element $y$ in $Y$ such that $f(x) = y$. Second, since $f$ is onto we know that for any element $y$ in $Y$, there exist an element $x$ in $X$ such that $y = f(x)$. Also, since $f$ is one-to-one we know that there is only one such $x$ in $X$.

Under these circumstance there is a pairing between elements of $X$ and elements of $Y$. Each element of $X$ is paired with exactly one element of $Y$. This property is called that $f$ is a *one-to-one correspondence*, or that $f$ is a *bijection*.

Further, if $f$ is a one-to-one correspondence, it also means that there exist another function that reverses the action of $f$. This function is called the inverse function for $f$ and is denoted $f^{-1}$.

In the previous section we found an inverse function while proving that $g$ is onto.
$$g(x) = 2x + 1$$
$$g(y)^{-1} = \frac{y - 1}{2}$$

The image of the $3$ under $g$ is: 
$$\begin{align*} g(3) &= 2 \cdot 3 + 1 \\\\[8pt] &= 7 \end{align*}$$

Further, the image of $7$ under $g^{-1}$ is: 
$$\begin{align*} g(7)^{-1} &= \frac{7 - 1}{2} \\\\[8pt] &= \frac{6}{2} \\\\[8pt] &= 3 \end{align*}$$