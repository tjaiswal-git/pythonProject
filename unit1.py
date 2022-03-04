import unittest

def add(x,y):
    return x+y

def multiply(x,y):
    return x*y

class SimpleTest(unittest.TestCase):

    def test_add1(self):
        self.assertEqual(add(5,6),11)
    def test_add2(self):
        self.assertEqual(multiply(5,6),11)


if __name__=='__main__':
    unittest.main()