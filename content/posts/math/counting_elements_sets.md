---
title: "Counting number of elements in sets"
date: 2021-03-11
draft: false 
---
Some counting problems can be solved by counting the number of elements in the result of a set operation, such as a union, difference or intersection. In below notes, the notation of $|A|$ is used for the number of elements (i.e. the cardinality ) of a set $A$.

## The addition rule
The addition rule can be used for counting the number of elements in a union of mutually disjoint sets (mutually disjoint means that the sets have no elements in common).
Suppose a finite set $A$ equals the union of $k$ distinct mutually disjoint subsets $A_1,A_2,\ldots,A_n$, then
$$|A| = |A_1| + |A_2| + \ldots + |A_n|$$

Consider how many studio albums there are by Black Sabbath that includes either Ozzy Osbourne or Ronnie James Dio (a union of two mutually disjoint sets). Let $B$ be the set of all studio albums by Black Sabbath, let $O$ be the set of all studio albums by Black Sabbath including Ozzy Osbourne (note that $O \subseteq B$), and let $D$ be the set of all studio albums by Black Sabbath including Ronnie James Dio (note that $D \subseteq B$).
 - $|O| = 9$, since Ozzy Osbourne participated on nine studio albums by Black Sabbath
 - $|D| = 3$, since Ronnie James Dio participated on three studio albums by Black Sabbath

$O \cap D = \emptyset$, since no studio album by Black Sabbath includes both Ronnie James Dio and Ozzy Osbourne (i.e. $O$ and $D$ are mutually disjoint)

$$|O \cup D| = |O| + |D| = 3 + 9 = 12$$ 

## The difference rule
The difference rule can be derived from the addition rule, and can be used to compute the number of elements in the difference of two sets, where one of the sets is a subset of the other. Suppose $A$ is a finite set and that $B \subseteq A$ (i.e. that $B$ is a subset of $A$), then
$$|A -B| = |A| - |B|$$

The way this rule can be derived from the addition rule is by noting that since $B$ is a subset of $A$, the two sets $B$ and $A -B$ are mutually disjoint and $A = B \cup (A-B)$. Now by applying the addition rule
$$|B| + |A-B| = |A|$$
And by subtracting $|B|$ from each side:
$$|A-B| = |A| - |B|$$

Consider now many studio albums there are by Black Sabbath which does not include Ozzy Osbourne (the difference of two sets, where one of the sets is a subset of the other). Let $B$ be the set of all studio albums by Black Sabbath, and let $O$ be the set of all studio albums by Black Sabbath including Ozzy Osbourne (note that $O \subseteq B$).

 - $|B| = 19$, since Black Sabbath in total has released 19 studio albums
 - $|O| = 9$, since Ozzy Osbourne has participated on nine studio albums by Black Sabbath
 - $|B - O| = |B| - |O| = 19 - 9 = 10$

## The inclusion/exclusion rule
Like stated above we can use the addition rule for counting the number of elements in a union of mutually disjoint sets. What about a union of sets which overlap? If we try to use the addition rule, some elements would be counted more than once. For these cases we can instead use the inclusion/exclusion rule. Suppose $A$, $B$, and $C$ are any finite sets, then
$$|A \cup B| = |A| + |B| - |A \cap B|$$
$$|A \cup B \cup C| = |A| + |B| + |C| - |A \cap B| - |A \cap C| - |B \cap C| + |A \cap B \cap C|$$

To understand this rule, it's useful to consider a venn diagram of three overlapping sets.

![Venn diagram of three overlapping sets](/images/inclusion_exclusion.png#center)

When adding $|A| + |B| + |C|$, the following happens:
- $A \cap B - (A \cap B \cap C)$ is counted twice
- $A \cap C - (A \cap B \cap C)$ is counted twice
- $B \cap C - (A \cap B \cap C)$ is counted twice
- $A \cap B \cap C$ is counted three times

To compensate for the double counting, we subtract $|A \cap B|$, $|A \cap C|$ and $B \cap C$.

However, since $A \cap B \cap C$ is a subset of each of the intersections we subtracted, the elements in $A \cap B \cap C$ is not counted at all, so we need to add them back:

$|A \cup B \cup C| = |A| + |B| + |C| - |A \cap B| - |A \cap C| - |B \cap C| + |A \cap B \cap C|$

---

Consider how many studio albums there are by Black Sabbath that includes either Bill Ward or Ronnie James Dio (a union of two overlapping sets).

Let $W$ be the set of all studio albums by Black Sabbath including Bill Ward, and let $D$ be the set of all studio albums by Black Sabbath including Ronnie James Dio.

$|W| = 10$, since Bill Ward has participated on ten studio albums by Black Sabbath

$|D| = 3$, since Ronnie James Dio participated on three studio albums by Black Sabbath

$|W \cap D| = 1$, since both Bill Ward and Ronnie James Dio participated on the studio album *Heaven and Hell*

$|W \cup D| = |W| + |D| - |W \cap D| = 10 + 3 - 1 = 12$