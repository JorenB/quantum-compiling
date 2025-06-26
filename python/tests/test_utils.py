import unittest
import numpy as np
from quantum_compiling import utils

class TestUtils(unittest.TestCase):
    def test_adj(self):
        mat = np.array([[1+1j, 2], [3, 4-1j]])
        expected = np.conjugate(mat).T
        np.testing.assert_allclose(utils.adj(mat), expected)

    def test_rotate_to_su2(self):
        mat = np.eye(4)
        result = utils.rotate_to_su2(mat)
        det = np.linalg.det(result[0:2,0:2])
        self.assertAlmostEqual(det, 1.0)

    def test_trace_norm(self):
        mat = np.eye(2)
        self.assertAlmostEqual(utils.trace_norm(mat), 1.0)

    def test_trace_distance_zero(self):
        m1 = np.eye(2)
        m2 = np.eye(2)
        self.assertAlmostEqual(utils.trace_distance(m1, m2), 0.0)

if __name__ == '__main__':
    unittest.main()
