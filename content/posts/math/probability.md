---
title: "Foundations of probability, and expected value"
date: 2021-03-15T20:00:00Z
draft: false 
---
The idea of probability is to quantify how likely it is for some event to occur in some process or experiment. First, some definitions - The set of all possible outcomes in a process or experiment is refered to as a **sample space**, while an **event** is a subset of the sample space (i.e. one or more of the possible outcomes).

Given that $S$ is a finite sample space with *equally likely* outcomes, and that $E$ is an event in $S$, the probability of $E$, denoted $P(E)$ is defined as the number of desired outcomes divided by the total number of outcomes.
$$P(E) = \frac{|E|}{|S|}$$
Where $|E|$ indicates the number of elements in $E$, and $|S|$ indicates the number of elements in $S$.

Imagine that you're to randomly pick one of the studio albums by Black Sabbath, where it's equally likely that you pick any of the studio albums - What's the probability that you pick a studio album with Ronnie James Dio as vocalist?

Let $S$ be the set of all studio albums by Black Sabbath. There are nineteen different studio albums by Black Sabbath, so $|S| = 19$.
Let $E$ be the event that the randomly picked studio album includes Ronnie James Dio as vocalist. There are three studio albums with Ronnie James Dio as vocalist (*Heaven and Hell*, *Mob Rules* and *Dehumanizer*), so $|E| = 3$.
$$P(E) = \frac{|E|}{|S|} = \frac{3}{19} \approx 0.158 \approx 15,8\%$$

## Probability axioms
In 1933, the idea of probability was axiomatized by [Andrey Kolmogorov](https://en.wikipedia.org/wiki/Andrey_Kolmogorov). He published three probability axioms which are considered the foundations of probability theory. 

The first axiom states that the probability of an event is a non-negative real number. Given that $E$ is an event in some sample space.
$$P(E) \in \mathbb{R} \land P(E) \ge 0$$

The second axiom states that the probability of the entire sample space is 1. Given that $S$ is a sample space.
$$P(S) = 1$$

The third axiom states that the probability of a union of mutually disjoint events can be calculated by the same principles as the [addition rule]({{< ref "posts/math/counting_elements_sets#the-addition-rule" >}}). Given that $A$ and $B$ are mutually disjoint events (i.e. the events has no outcomes in common, $A \cap B = \emptyset$), then:
$$P(A \cup B) = P(A) + P(B)$$

---

Based on these three axioms, some other useful consequenses can be derived. First, the probability of the empty event (none of the outcomes in the sample space) is $0$.
$$P(\emptyset) = 0$$

Second, the range of the probability of an event can be further narrowed to that it's always between 0 and 1, inclusive. Given some event $E$.
$$0 \le P(E) \le 1$$

Third, the probability of the complement of an event (i.e. the probability that an event does not happen) can be calculated by subtracting the probability of an event from 1. Given a sample space $S$, and that $E$ is an event in $S$.
$$P(E^\complement) = 1 - P(E)$$

Fourth, the probability of a general union of two events. Note the third axiom can only be used for events that are mutually disjoint. For events that has outcomes in common, we can instead use the principles of [inclusion/exclusion]({{< ref "posts/math/counting_elements_sets#the-inclusionexclusion-rule" >}}) to determine the probability.
$$P(A \cup B) = P(A) + P(B) - P(A \cap B)$$

## Expected value
In probability theory the notion of *expected value* is a probability-weighted average value of some process. The idea is that the events are represented as some values, then the values are multiplied with their probabilities, and then the sum of them all gives an average value for the whole process, weighted by probability.

Suppose the possible outcomes of an experiment or a random process are real numbers $a_1, a_2, \ldots, a_n$, which occur with the probabilities $p_1,p_2, \ldots, p_n$. The expected value of the process is:
$$\sum\limits_{k=1}^{n} a_kp_k = a_1p_1 + a_2p_2 + \ldots + a_np_n$$

In the board game *Settlers of Catan* the players roll two dices each round. When rolling two dices there are $6^2 = 36$ possible outcomes (by the multiplication rule). If we sum the dice values for each outcome, we get the following values.

|*Face value*|  \| One  |  \| Two  | \| Three |  \| Four |  \| Five |  \| Six  |
|:----------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|
| One        | 2     | 3 | 4 | 5 | 6 | 7             |
| Two        | 3     | 4 | 5 | 6 | 7 | 8             |
| Three      | 4     | 5 | 6 | 7 | 8 | 9             |
| Four       | 5     | 6 | 7 | 8 | 9 | 10            |
| Five       | 6     | 7 | 8 | 9 | 10 | 11           |
| Six        | 7     | 8 | 9 | 10 | 11 | 12          |

The probablities for each sum are:
 - $P(2) = \frac{1}{36}$
 - $P(3) = \frac{2}{36}$
 - $P(4) = \frac{3}{36}$
 - $P(5) = \frac{4}{36}$
 - $P(6) = \frac{5}{36}$
 - $P(7) = \frac{6}{36}$
 - $P(8) = \frac{5}{36}$
 - $P(9) = \frac{4}{36}$
 - $P(10) = \frac{3}{36}$
 - $P(11) = \frac{2}{36}$
 - $P(12) = \frac{1}{36}$

Now, to calculate the expected value. Let each of the possible values when rolling two dices be $a_1 = 2, a_2 = 3, \ldots, a_{11} = 12$, and let the probability for each value be $p_1 = \frac{1}{36}, p_2 = \frac{2}{36}, \ldots, p_{11} = \frac{1}{36}$.

$$\begin{aligned}\sum\limits_{k=1}^{11} a_kp_k &= (2 \times \frac{1}{36}) + (3 \times \frac{2}{36}) + (4 \times \frac{3}{36}) + (5 \times \frac{4}{36}) + (6 \times \frac{5}{36}) + (7 \times \frac{6}{36}) + (8 \times \frac{5}{36}) + (9 \times \frac{4}{36}) + (10 \times \frac{3}{36}) + (11 \times \frac{2}{36}) + (12 \times \frac{1}{36}) \\\\[10pt\] &= \frac{2}{36} + \frac{6}{36} + \frac{12}{36} + \frac{20}{36} + \frac{30}{36} + \frac{42}{36} + \frac{40}{36} + \frac{36}{36} + \frac{30}{36} + \frac{22}{36} + \frac{12}{36} \\\\[10pt\] &= \frac{252}{36} \\\\[10pt\] &= 7\end{aligned}$$

The expected value when rolling two dices is **7**.