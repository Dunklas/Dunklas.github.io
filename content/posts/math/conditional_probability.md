---
title: "Independent events and conditional probability"
date: 2021-03-15T22:00:00Z
draft: false 
---
In [Introduction to probability]({{< ref "posts/math/probability" >}}) it was described how to calculate the probability of some event. However, the post only considered the probability of a single event. What if we want to know the probability of two events?

## Independent events
Imagine (again) that you're to randomly pick a studio album by Black Sabbath, where it's equally likely that you pick any of the studio albums. But this time, consider a scenario where you're to pick **two** studio albums. Although, after you pick the first studio album you put it back in the pile, so it's possible two pick the same studio album twice - What's the probability that both of the albums you pick include Ronnie James Dio as vocalist?

There are a total of 19 studio albums by Black Sabbath, and Ronnie James Dio was the vocalist on 3 of them. Let $R_1$ be the event that the first album picked includes Ronnie James Dio as vocalist, and let $R_2$ be the event that the second album picked includes Ronnie James Dio as vocalist. Since the first picked album is put back in the pile, $R_1$ and $R_2$ has the same probability.
$$P(R_1) = P(R_2) = \frac{3}{19}$$

To find out the probability of that both $R_1$ and $R_2$ happen ($P(R_1 \cap R_2)$) we can see the two selections as a 2-step process and consider the multiplication rule. There are $3^2 = 9$ ways to pick a studio album by Ronnie James Dio twice (desired outcomes), and there are $19^2 = 361$ ways to pick a studio album by Black Sabbath twice (total outcomes).
$$P(R_1 \cap R_2) = \frac{3^2}{19^2} = \frac{3 \cdot 3}{19 \cdot 19} = \frac{3}{19} \cdot \frac{3}{19} = P(R_1) \cdot P(R_2)$$

The fact that the first picked studio album is put back in the pile before the second selection result in that $R_1$ and $R_2$ are **independent** events. This means that the first event does not affect the outcome of the second event. The definition of independent events is as follows.

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

## Bayes' theorem
A famous theorem built on conditional probability is Bayes' theorem. It's defined as follows. Suppose that a sample space $S$ is a union of mutually disjoint events $B_1$,$B_2$, $\ldots$, $B_n$, and suppose that $A$ is an event in $S$ with $P(A) \ne 0$. If k is an integer with $1 \le k \le n$, then:
$$P(B_k|A) = \frac{P(A|B_k) \cdot P(B_k)}{P(A|B_1) \cdot P(B_1) + P(A|B_2) \cdot P(B_2) + \cdots + P(A|B_n) \cdot P(B_n)}$$

The theorem can actually be directly derived from the definition of conditional probability.
$$\begin{align*}P(B_k|A) &= \frac{P(B_k \cap A)}{P(A)} && \text{By definition of conditional probability} \\\\[10pt\] &= \frac{P(A|B_k) \cdot P(B_k)}{P(A)} && \text{Since $P(A \cap B) = P(B|A) \cdot P(A)$} \\\\[10pt\] &= \frac{P(A|B_k) \cdot P(B_k)}{P((A \cap B_1) \cup (A \cap B_2) \cup \ldots \cup (A \cap B_n))} && \text{Because A is the distinct union of $A \cap B_1$, $A \cap B_2$, $\ldots$, $A \cap B_n$} \\\\[10pt\] &= \frac{P(A|B_k) \cdot P(B_k)}{P(A \cap B_1) + P(A \cap B_2) + \ldots + P(A \cap B_n)} && \text{By the third probability axiom} \\\\[10pt\] &= \frac{P(A|B_k) \cdot P(B_k)}{P(A|B_1) \cdot P(B_1) + P(A|B_2) \cdot P(B_2) + \cdots + P(A|B_n) \cdot P(B_n)} && \text{Since $P(A \cap B) = P(B|A) \cdot P(A)$} \end{align*}$$

A common and quite interesting example for Bayes' theorem is to consider a medical test that screens for some disease. Let's say the disease is found in 1 out of 1000 people. Additionally, the test has a false positive rate of 2% (a person test positive, but does not actually have the disease), and a false negative rate of 0.5% (a person test negative, but actually has the disease) - What's the probability that a randomly selected person who tests positive for the disease actually has the disease?

Let $A$ be the event that a person test positive for the disease, let $B_1$ be the event that a person actually has the disease, and let $B_2$ be the event that a person does not actually have the disease.
 - $P(A|B_1) = 0.98$ (derived from false positive rate)
 - $P(A|B_2) = 0.02$ (derived from false positive rate)
 - $P(A^{\complement}|B_1) = 0.005$ (derived from false negative rate)
 - $P(A^{\complement}|B_2) = 0.995$ (derived from false negative rate)
 - $P(B_1) = 0.001$ (derived from occurrence of disease)
 - $P(B_2) = 0.999$ (derived from occurrence of disease)

What we need to find out is, given that a person tests positive, what's the probability that the person has the disease. The question can be phrased as $P(B_1|A)$, and we can use Bayes' theorem to find the answer. 
$$\begin{align*}P(B_1|A) &= \frac{P(A|B_1) \cdot P(B_1)}{P(A|B_1) \cdot P(B_1) + P(A|B_2) \cdot P(B_2)} \\\\[10pt\] &= \frac{0.98 \cdot 0.001}{0.98 \cdot 0.001 + 0.02 \cdot 0.999} \\\\[10pt\] &= \frac{0.00098}{0.02096} \\\\[10pt\] &= 0.04675572519 \approx 4.7\\% \end{align*}$$

These figures might seem strange. Why isn't the probability of having the disease 98%? Since that's the true positive rate of the test. Let's break it down! Consider a group of 1000 people who take the test. How many of these people will test positive? (i.e. $P(A)$) The group that test positive is a union of two groups, people who test positive that actually has the disease, and people who test positive that does not have the disease.

The probability of testing positive and actually having the disease is:
$$\begin{align*}P(A \cap B_1) &= P(A|B_1) \cdot P(B_1) \\\\[10pt\] &= 0.98 \cdot 0.001 \\\\[10pt\] &= 0.00098\end{align*}$$

The probability of testing positive and not actually having the disease is:
$$\begin{align*} P(A \cap B_2) &= P(A|B_2) \cdot P(B_2) \\\\[10pt\] &= 0.02 \cdot 0.999 \\\\[10pt\] &= 0.01998\end{align*}$$

Thus, the probability of testing positive is:
$$\begin{align*}P(A) &= P(A \cap B_1) \cup P(A \cap B_2) \\\\[10pt\] &= P(A \cap B_1) + P(A \cap B_2) \\\\[10pt\] &= 0.00098 + 0.01998 \\\\[10pt\] &= 0.02096 \approx 2.1\\% \end{align*}$$

So, in a group of 1000 people, roughly $1000 * 0.02096 = 20.96 \approx 21$ people will test positive. This means that if you test positive and actually have the disease, you are the only one in a group of 21 people who tested positive ($\frac{1}{21} \approx 4,76\\%$). It's common to think that the probability of having the disease (given a positive test) is 98.%. This is actually an instance of [base rate neglect](https://en.wikipedia.org/wiki/Base_rate_fallacy), which means that people tend to value specific information (such as test accuracy) over base rate information (rate of disease).

To sum up, prior to taking the test, the probability of having the disease was 0.1%. After providing more data (by testing positive) the probability of having the disease is approximately 4.7%. Actually Bayes' theorem can be used multiple times to update the probability of some hypothesis as more data is gathered. This is widely used (and also similar to how the human mind works, constantly refining our understanding based on new experiences) and is refered to as [bayesian inference](https://en.wikipedia.org/wiki/Bayesian_inference).

