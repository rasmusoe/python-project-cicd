"""Submodule impllementation of prime validator."""


class TestAppSubpackage:
    """Class to validate prime."""

    def __init__(self) -> None:
        """Describe the __init__'s docstring."""
        pass

    def is_prime_class(self, value: int) -> bool:
        """Validate if a number if a prime or not.

        Args:
            value: The number to validate

        Returns:
            True if the value is a prime, False otherwise
        """
        if value < 2:
            return False
        for divisor in range(2, value):
            if (value % divisor) == 0:
                return False
        return True
