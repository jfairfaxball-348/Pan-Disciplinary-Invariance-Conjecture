# S060: sound staged obstruction search for the original cap classification

The theorem and original finite predicate stay unchanged. The new proof of
`s030_normalized_survivor_card` uses an independently certified upper bound
and the previously proved inclusion of the eighteen explicit genuine caps.

## Mathematical argument

1. The genuine Boolean short-zero-free predicate is hereditary under point-set
   inclusion. For each forbidden subset of a smaller set, its same cardinality
   and zero sum certify a forbidden subset of the larger set.
2. There are 54 explicit index patterns (28 pairs and 26 triples). Each pattern,
   together with the fixed three basis points, fails that original predicate.
   `s060_forbidden_check` proves all 54 local failures by trusted kernel reduction.
   The proof does not assert or need that this obstruction list is exhaustive.
3. Consequently every genuinely surviving five-index tail avoids all 54 patterns.
4. The search starts with the empty list and repeatedly adds a larger index,
   retaining a partial list only when it avoids all 54 patterns. Its numerical
   states are lists of indices, without point-coordinate powersets or intermediate
   finite-set unions. This is the proof-engineering change that makes the same
   finite obligation cheaper to replay.
5. A general Lean induction proves completeness for every cardinality: an allowed
   finite index set of cardinality n is the finite-set image of a list in layer n.
   Erasing the largest index gives the induction step; heredity preserves allowance.
6. Trusted kernel reduction proves that converting the fifth layer to finite sets
   gives exactly 18 distinct tails. Independently enumerated layer sizes are
   1, 17, 108, 296, 296, 18.
7. Hence the original actual indexed-survivor set has cardinality at most 18.
   The existing genuine inclusion of the eighteen explicit tails gives the reverse
   inequality. The exact original normalized-cardinality statement follows.

The original image transport, linear normal form, eight-cap probability law,
40320-permutation semantics, and spider iff then use the same theorem statement.
The old individually certified shard lemmas remain in the source, but the new
normalized-card proof does not depend on them.

## Controls and comparison

The pinned Lake comparator invokes its external kernels sequentially. NanoDa's
configuration uses four threads; this does not mean four independent verifier
processes are launched together. A concurrent-checker explanation is therefore
not supported by that code. The S060 baseline profiles grouped first-index roots
and the previously unprofiled mid-index 4,5,6 certificates, sequentially at the
same address-space cap, to test the remaining aggregation hypotheses.

Actual checked source from Pascal Minus-One, TreeStack, Greedy Uniformity on Trees
and ellipse uses the same standard permitted axioms and enables NanoDa. No source
file in those checkouts contained `decide +kernel`. This is a concrete difference
from PDIC's enumerated Boolean cardinality certificates, not proof that project
size or module packaging alone determines verifier memory. Exact comparison SHAs
and final kernel measurements are recorded in the S060 closeout and evidence.

A successful small search certificate or Lean build alone is not full independent
flagship verification, and neither replaces the standard Palomar FULL gate.


## Measured whole-root consequence

At matched 9-GiB virtual limits, original normalized-card replay failed at
7,103,068 KiB capped RSS; repaired replay passes at 1,931,696 KiB. Complete
flagship changes from failure to PASS at 5,950,560 KiB. Normalized export changes
from 30,617,573 to 27,584,605 bytes; flagship from 78,845,839 to 76,366,160 bytes.
The much larger replay improvement relative to serialized-byte reduction shows
that export size alone is a poor proxy for this certificate's verification cost.
The proof avoids replaying expensive point-set enumeration and performs the
remaining finite search on compact index lists with early pruning. This
experiment establishes the costly certificate as a sufficient failure source;
it does not identify a single allocator instruction or measure the old uncapped
maximum. Exact evidence is recorded in the S060 closeout.
