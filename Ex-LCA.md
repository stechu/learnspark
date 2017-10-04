Algorithm: Least Common Ancestor (LCA)
======================================

### Problem definition

The goal of this problem is to compute the least common ancestor (LCA) of two academic papers.

- *Ancestor*: An ancestor `a` of a paper `p` is any paper that is transitively cited by `p`. 
So if p is the Scatter paper by Glendenning, et al., then the CFS paper by Dabek, 
et al. is an ancestor: Scatter cites BigTable, which cites Chord, which cites CFS.

- *Common Ancestor*: A common ancestor a of two papers `p1` and `p2` is any paper that is an ancestor of both papers. 
   If `p2` is the Phoenix paper by Chen, Wang, et al., then CFS is a common ancestor of `p` and `p2`: Phoenix cites Vivaldi, which cites CFS.

- *Least Common Ancestor*: The least common ancestor `a*` of `p1` and `p2` is the unique ancestor of both papers that is smallest according to the following rules:

   If a is an ancestor of both `p1` and `p2`, let `d1` (the depth of `p1`) be the number of citation hops in the shortest path from `p1` to `a`, with `d2` defined analogously for `p2`. Then the depth of ancestor `a`, denoted `da`, is the larger of `d1` and `d2`. If `a` and `b` are two ancestors of both `p1` and `p2`, and `da < db`, then `a < b`.

   Let `ya` be the publication year of ancestor `a`, and `yb` defined similarly for `b`. If `da = db` and `ya < yb`, then `a < b`.
   If `da = db` and `ya = yb`, then break the tie by choosing the ancestor `a*` with the smaller id.
   Because no two papers have the same id, there is at most one least common ancestor `a*` for any two papers.

   Example: In the above examples, Scatter has a depth of 3 and Phoenix has a depth of 2 (with respect to the CFS paper). When considering    CFS as a common ancestor of the two papers, the depth is 3 and the year is 2001.


### Data

The data for this problem is a citation graph. It contains two tables: papers and cites.

- `papers` Two columns: id and year, signifying that the paper with the specified id was published in the specified year.

- `cites` Two columns: p1 and p2, signifying that paper p1 cites paper p2.

The data can be downloaded via the AWS S3 links (TBD): papers, cites.


### Variable-sized problem instances

Definition: Given a citation graph as defined by the papers and cities tables, and a set of seed papers s, find the least common ancestor, if one exists, for every pair of papers in s. Represent this answer set with the 5-tuple (p1, p2, a, depth, year) where p1 < p2, a is the least common ancestor of p1 and p2, depth = max(d1, d2), and year is the publication year of a.

Note that we only need to produce the answer tuple where p1 < p2, since the result (p2, p1, a, depth, year) provides no extra information.

Variable-sized: Define a seed set SN to be all papers with id <= N. You can vary the size of the problem instance by varying N.
