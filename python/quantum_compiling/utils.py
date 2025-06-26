import numpy as np


def adj(matrix: np.ndarray) -> np.ndarray:
    """Return the conjugate transpose of a matrix."""
    return np.conjugate(matrix).T


def rotate_to_su2(mat: np.ndarray) -> np.ndarray:
    """Rotate a matrix to SU(2) by normalising its upper left block."""
    ublock = mat[0:2, 0:2]
    det = np.linalg.det(ublock)
    return mat / np.sqrt(det)


def trace_norm(matrix: np.ndarray) -> float:
    """Return the trace norm of a matrix."""
    return 0.5 * abs(np.trace(np.linalg.sqrt(adj(matrix) @ matrix)))


def trace_distance(m1: np.ndarray, m2: np.ndarray) -> float:
    """Compute the trace distance between two matrices after rotation to SU(2)."""
    diff = rotate_to_su2(m1) - rotate_to_su2(m2)
    return trace_norm(diff)
