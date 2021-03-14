---
title: "Counting subsets using r-combinations"
date: 2021-03-14
draft: false 
---
Below are some examples of counting subsets with certain restrictions, using the concept of combinations, [addition rule]({{< ref "posts/math/counting_elements_sets#the-addition-rule" >}}) and [difference rule]({{< ref "posts/math/counting_elements_sets#the-difference-rule" >}}).

Consider a scenario where, for the rest of your life, from the total of nineteen studio albums by Black Sabbath, you're only allowed to listen to five of them. Without any restrictions to the selection, we can use 5-combinations to ascertain that the number of combinations you'd need to consider are:
$${19 \choose 5} = \frac{19!}{5!(19-5)!} = \frac{19!}{5!14!} = 11628$$
When adding some restrictions to the selection, we need to think a bit differently.

## Both or neither
When you listen to *Sabbath Bloody Sabbath*, you always feel an urge to listen to *Volume 4* as well. So, in your selection of five Black Sabbath studio albums, if you include *Sabbath Bloody Sabbath*, you must include *Volume 4* too (and vice versa), or you include none of them.

Let $A$ be the set of all 5-combinations including both *Sabbath Bloody Sabbath* and *Volume 4*. We begin by selecting both *Sabbath Bloody Sabbath* and *Volume 4*. To complete our selection of five studio albums, we need to select $3$ studio albums from the remaining $19 - 2 = 17$ studio albums. So the number of 5-combinations containing both *Sabbath Bloody Sabbath* and *Volume 4* are:
$$|A| = {17 \choose 3} = 680$$

Let $B$ be the set of all 5-combinations including neither *Sabbath Bloody Sabbath* nor *Volume 4*. We need to select five studio albums, but since these albums cannot be *Sabbath Bloody Sabbath* nor *Volume 4*, we have $19 -2 = 17$ studio albums to chose from. So the number of 5-combinations containing neither *Sabbath Bloody Sabbath* nor *Volume 4* are:
$$|B| = {17 \choose 5} = 6188$$

Now, since $A$ and $B$ are disjoint the addition rule can be used to determine how many 5-combinations there are that either contains both *Sabbath Bloody Sabbath* and *Volume 4*, or none of the two albums.
$$|A \cup B| = |A| + |B| = 680 + 6188 = 6868$$

## Not both
You think that *Tyr* and *Headless Cross* are really similar, and therefore think it's a waste to include both of them, but you could consider to include either one of them, So, in your selection of five Black Sabbath studio albums, you can include either *Tyr* or *Headless Cross*, but not both of them.

Let $A$ be the set of all 5-combinations including both *Tyr* and *Headless Cross*. We begin by selecting both *Tyr* and *Headless Cross*, and then we select the remaining three studio albums from the remaining $19 - 2 = 17$. So the number of 5-combinations including both *Tyr* and *Headless Cross* are: $|A| = {17 \choose 3} = 680$.

Let $B$ be the set of all 5-combinations with no restrictions to the selection, $|B| = {19 \choose 5} = 11628$.

Since $A$ is a subset of $B$ we can use the difference rule to determine how many 5-combinations there are that does not contain both *Tyr* and *Headless Cross*.
$$|B - A| = |B| - |A| = 11628 - 680 = 10948$$

An alternative solution for this is to partition the desired set a bit differently and use the addition rule:

 - Let $X$ be the set of all 5-combinations including *Tyr* but not *Headless Cross*.
 - Let $Y$ be the set of all 5-combinations including *Headless Cross* but not *Tyr*.
 - Let $Z$ be the set of all 5-combinations including neither *Tyr* nor *Headless Cross*.

Now the number of 5-combinations that does not contain both *Tyr* and *Headless Cross* is equal to:
$$|X \cup Y \cup Z| = |X| + |Y| + |Z| = {17 \choose 4} + {17 \choose 4} + {17 \choose 5} = 2380 + 2380 + 6188 = 10948$$

## Members of different classes
We could regard the set of studio albums by Black Sabbath as a set where the members belong to different classes, e.g. by vocalist. The set contains 9 elements with Ozzy Osbourne, 3 elements with Ronnie James Dio, 1 element with Ian Gillan, 1 element with Glenn Hughes, and 5 elements with Tony Martin.

### Selections with $x$ elements from one class, and $y$ from another class
Consider that we'd like our selection of five studio albums to contain three albums with Ozzy Osbourne, and two albums with Ronnie James Dio. The process of selecting the five albums can be seen as a 2-step process: (1) Select albums with Ozzy Osbourne; (2) Select albums with Ronnie James Dio.

 - There are ${9 \choose 3} = 84$ different ways to choose three studio albums with Ozzy Osbourne from the total of nine albums.
 - There are ${3 \choose 2} = 3$ different ways to choose two studio albums with Ronni James Dio from the total of three albums.

Now, we can use the multiplication rule to determine that the number of 5-combinations containing three albums with Ozzy Osbourne and two albums with Ronnie James Dio is:
$${9 \choose 3} \times {3 \choose 2} = 84 \times 3 = 252$$

### Selections with at least one element from a certain class
Imagine that we want our selection of five studio albums to contain at least one studio album with Tony Martin (but it could also contain more than one).

Let $A$ be the set of all 5-combinations that doesn't contain any studio album with Tony Martin. For these 5-combinations we need to select five studio albums from the $19 - 5 = 14$ studio albums which does not include Tony Martin. So the number 5-combinations which does not include any studio albums with Tony Martin is: $|A| = {14 \choose 5} = 2002$.

Let $B$ be the set of all 5-combinations with no restrictions to the selection, $|B| = {19 \choose 5} = 11628$.

Since $A$ is a subset of $B$ we can use the difference rule to determine how many 5-combinations there are that contains at least one studio album with Tony Martin.
$$|B - A| = |B| - |A| = 11628 - 2002 = 9626$$

An alternative solution for this is to partition the desired result into five disjoint sets and then use the addition rule:
 - Let $V$ be the set of all 5-combinations including one studio album with Tony Martin, and four without
 - Let $W$ be the set of all 5-combinations including two studio albums with Tony Martin, and three without
 - Let $X$ be the set of all 5-combinations including three studio albums with Tony Martin, and two without
 - Let $Y$ be the set of all 5-combinations including four studio albums with Tony Martin, and one without
 - Let $Z$ be the set of all 5-combinations including five studio albums with Tony Maritn, and zero without

$$\begin{aligned}|V \cup W \cup X \cup Y \cup Z| &= |V| + |W| + |X| + |Y| + |Z| \\\\[10pt\] &= ({5 \choose 1} \times {14 \choose 4}) + ({5 \choose 2} \times {14 \choose 3}) + ({5 \choose 3} \times {14 \choose 2}) + ({5 \choose 4} \times {14 \choose 1}) + ({5 \choose 5} \times {14 \choose 0}) \\\\[10pt\] &= (5 \times 1001) + (10 \times 364) + (10 \times 91) + (5 \times 14) + (1 \times 1) \\\\[10pt\] &= 5005 + 3640 + 910 + 70 + 1 \\\\[10pt\] &= 9626\end{aligned}$$

### Selections with at most one element from a certain class
Imagine that we want our selection of five studio albums to contain at most one studio album with Tony Martin.

Let $A$ be the set of all 5-combinations that doesn't contain any studio albums with Tony Martin. For these 5-combinations we need to select five studio albums from the $19 - 5 = 14$ studio albums which does not include Tony Martin. So the number 5-combinations which does not include any studio albums with Tony Martin is:
$$|A| = {14 \choose 5} = 2002$$

Let $B$ be the set of all 5-combinations which contains exactly one studio album with Tony Martin, and four albums that does not include Tony Martin. This can be seen as a 2-step process where we (1): Select one album out of the five with Tony Martin; (2) Select four albums out of the fourteen that does not include Tony Martin. So, the number of elements in $B$ is:
$$|B| = {5 \choose 1} \times {14 \choose 4} = 5 \times 1001 = 5005$$

Since $A$ and $B$ are disjoint we can use the addition rule to determine how many 5-combinations there are that contains at most one studio album with Tony Martin.
$$|A \cup B| = |A| + |B| = 2002 + 5005 = 7007$$