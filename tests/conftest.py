"""Test configuration for modules located in root of source dir."""
import os
import sys
import pytest


sys.path.insert(
    0, os.path.abspath(os.path.join(os.path.dirname(__file__), "../src/"))
)


@pytest.fixture
def test_value():
    """Fixture showing how to return a value."""
    value = 13
    return value
