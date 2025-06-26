"""Simplified Solovay--Kitaev implementation in Python.

This module provides a minimal translation of the MATLAB ``SolovayKitaev``
function found in this repository. It relies on helper routines from
``quantum_compiling.utils``. Only core recursion logic is provided; helper
functions such as ``linear_search`` or ``BGC_decompose`` would need to be
implemented for a complete solution.
"""

from __future__ import annotations

import numpy as np
from .utils import adj, rotate_to_su2, trace_distance


# Typing alias for clarity
Gate = np.ndarray


def solovay_kitaev(search: Gate, depth: int, net, rdnet):
    """Return an approximate gate and its word representation.

    Parameters
    ----------
    search : Gate
        The target gate to approximate.
    depth : int
        Recursion depth. When ``0`` the algorithm performs a linear search.
    net : tuple
        Tuple ``(gates, words)`` used for searches.
    rdnet : tuple
        Subset of ``net`` containing gates close to the identity.
    """
    search = rotate_to_su2(search)

    if depth == 0:
        # TODO: translate ``linearSearch`` from MATLAB.
        raise NotImplementedError("linear search routine not yet implemented")

    l_gate, l_word = solovay_kitaev(search, depth - 1, net, rdnet)
    uulh = search @ adj(l_gate[:2, :2])

    if trace_distance(uulh, np.eye(2)) > 0.2:
        print(trace_distance(uulh, np.eye(2)))

    # TODO: translate ``BGCDecompose`` from MATLAB.
    raise NotImplementedError("BGCDecompose routine not yet implemented")
