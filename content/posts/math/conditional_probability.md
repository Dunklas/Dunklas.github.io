---
title: "Independent events and conditional probability"
date: 2021-03-14
draft: false 
---
In [Introduction to probability]({{< ref "posts/math/probability" >}}) it was described how to calculate the probability of some event. However, the post only considered the probability of a single event. What if we want to know the probability of two events?

## Independent events
Imagine (again) that you're to randomly pick a studio album by Black Sabbath, where it's equally likely that you pick any of the studio albums. But this time, consider a scenario where you're to pick **two** studio albums. Although, after you pick the first studio album you put it back in the pile, so it's possible two pick the same studio album twice - What's the probability that both of the albums you pick include Ronnie James Dio as vocalist?

There are a total of 19 studio albums by Black Sabbath, and Ronnie James Dio was the vocalist on 3 of them. Let $R_1$ be the event that the first album picked includes Ronnie James Dio as vocalist, and let $R_2$ be the event that the second album picked includes Ronnie James Dio as vocalist. Since the first picked album is put back in the pile, $R_1$ and $R_2$ has the same probability.
$$P(R_1) = P(R_2) = \frac{3}{19}$$

To find out the probability of that both $R_1$ and $R_2$ happen ($P(R_1 \cap R_2)$) we can see the two selections as a 2-step process and consider the multiplication rule. There are $3^2 = 9$ ways to pick a studio album by Ronnie James Dio twice (desired outcomes), and there are $19^2 = 361$ ways to pick a studio album by Black Sabbath twice (total outcomes).
$$P(R_1 \cap R_2) = \frac{3^2}{19^2} = \frac{3 \cdot 3}{19 \cdot 19} = \frac{3}{19} \cdot \frac{3}{19} = P(R_1) \cdot P(R_2)$$

The fact that the first picked studio album is put back in the pile before the second selection result in that $R_1$ and $R_2$ are **independent** events. This means that the first event has no relation to the second event. The definition of independent events is as follows.

If $A$ and $B$ are events in a sample space $S$, then $A$ and $B$ are **independent** if, and only if
$$P(A \cap B) = P(A) \cdot P(B)$$

## Dependent events
Consider the same example as above, but with the difference that after the first pick, the picked studio album is **not** put back in the pile. This fact makes the events $R_1$ and $R_2$ **dependent**. The result of the first pick impacts the result of the second pick. The probability of $R_1$ is unaffected, because whin doing the first pick there are still $19$ studio albums to choose from, and there are $3$ studio albums with Ronnie James Dio in the pile. However, when making the second pick, there are $19 - 1 = 18$ studio albums in the pile, and how many of them that includes Ronnie James Dio depend on what studio album that was first picked.
 - If first pick was a studio album with Ronnie James Dio: $19 - 1 = 18$ studio albums in the pile, of which $3 - 1 = 2$ includes Ronnie James Dio
 - If first pick as not a studio album with Ronnie James Dio: $19 - 1 = 18$ studio albums in the  pile, of which $3$ includes Ronnie James Dio

If we could be certain that the first picked album included Ronnie James Dio, we could say that the probability that the second picked album includes Ronnie James Dio is $\frac{2}{18}$. With the concept of conditional probability you can actually make such a statement (given some event, the probability of some other event is...). With conditional probability the above equality can be rephrased as:
$$P(R_1 \cap R_2) = P(R_1) \cdot P(R_2|R_1) = \frac{3}{19} \cdot \frac{2}{18}$$

Conditional probability is defined as follows. Let $A$ and $B$ be events in a sample space $S$. If $P(A) \ne 0$, then the conditional probability of $B$ given $A$, denoted $P(B|A)$ is:
$$P(B|A) = \frac{P(A \cap B)}{P(A)}$$

From the definition, it's possible to derive a few other useful equalities. By multiplying each side with $P(A)$ we get the following (this form was used in the above Black Sabbath-related example).
$$P(A \cap B) = P(B|A) \cdot P(A)$$

If we divide each side of above equality with $P(B|A)$, we get that:
$$P(A) = \frac{P(A \cap B)}{P(B|A)}$$
