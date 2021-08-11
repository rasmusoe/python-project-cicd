"""Test driver for testing submodule."""
import pytest
from testapp.subpackage import testapp_subpackage as submd


@pytest.mark.parametrize("testdata", [-1, 0, 1])
def test_is_prime_value_class_less_then_2_return_false(testdata):
    """Test the prime value is less then 2 will give an error."""
    testclass = submd.TestAppSubpackage()
    assert testclass.is_prime_class(testdata) is False


@pytest.mark.parametrize("testdata", [4, 6, 8])
def test_is_prime_value_above_2_return_false(testdata):
    """Test the non-prime values above 2 will return false."""
    testclass = submd.TestAppSubpackage()
    assert testclass.is_prime_class(testdata) is False


@pytest.mark.parametrize("testdata", [2, 3, 5])
def test_is_prime_value_above_2_return_true(testdata):
    """Test the prime values above 2 will return true."""
    testclass = submd.TestAppSubpackage()
    assert testclass.is_prime_class(testdata) is True


def test_is_prime_value_with_fixture(test_value):
    """Test the prime values above 2 will return true."""
    testclass = submd.TestAppSubpackage()
    assert testclass.is_prime_class(test_value) is True
