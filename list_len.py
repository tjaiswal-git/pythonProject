from operator import length_hint

list1 = [1, 2, 3, 4, 5, 6]

print((length_hint(list1)))

import pytest
import math


@pytest.mark.parametrize("num, output", [(1, 11), (2, 22), (3, 35), (4, 44)])
def test_multiply_11(num, output):
    assert num * 11 == output
    assert  num * 10== output


@pytest.mark.xfail
def test_1():
    assert math.sqrt(25) == 5


def test_2():
    assert 7 * 7 == 49


def test_3():
    assert 7 * 7 == 49
