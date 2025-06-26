Quantum compilation toolset
=================================================================

This repository contains several algorithms for analyzing sets of quantum gates.
The original implementation was written in MATLAB. A minimal Python translation
is available under `python/` using ``numpy``. Currently, the algorithms include:

* Finding out whether a given (finite) set of gates generates a dense (enough) set of matrices in the space SU(2).
* Generating a "library" of gates with words up to a specific length. This can either be done "fast", having the downside of generating many duplicates and therefore having memory capacity as a bottleneck, or "strict", generating the pure set of matrix products with the downside of straining the processor and having execution time as a bottleneck.
* Approximating arbitrary one-qubit gates up to desired accuracy. This is accomplished by making use of the Solovay-Kitaev algorithm.
* Searching for the best approximation to an arbitrary one-qubit gate in a large space of "available" gates. This can either be done in a linear (slow) fashion (always resulting in the best approximation) or by making use of a tree search method (very fast), which occasionally returns slightly suboptimal results.


Running tests
-------------
The Python modules include a small unit test suite. After installing the
requirements, run tests with:

```
python -m unittest discover python/tests
```
