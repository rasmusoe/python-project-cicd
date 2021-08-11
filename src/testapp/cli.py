"""Simple CLI tool for test running the application."""

from testapp import testappprime
from testapp.subpackage import testapp_subpackage as submd


def main() -> int:
    """Do stuff.

    Runs the main application for testing purpose.

    Args:
        argv (list): List of arguments.

    Returns:
        int: A return code.
    """
    print("Running test")
    status = testappprime.is_prime(5)
    print("Status: ", status)
    testclass = submd.TestAppSubpackage()
    status = testclass.is_prime_class(10)
    print("Status: ", status)

    return 0
