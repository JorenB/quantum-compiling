import unittest
import numpy as np
from quantum_compiling.solovay_kitaev import solovay_kitaev


class TestSolovayKitaev(unittest.TestCase):
    def test_depth_zero_not_implemented(self):
        with self.assertRaises(NotImplementedError):
            solovay_kitaev(np.eye(2), 0, None, None)

