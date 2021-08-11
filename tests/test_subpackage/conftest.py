"""Test configuration file for packages located in root folder of source."""
import pytest


@pytest.fixture
def test_value():
    """Fixture showing how to return a value."""
    value = 11
    return value
