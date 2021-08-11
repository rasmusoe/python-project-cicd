"""Entrypoint module, in case you use `python -m testapp`."""

import sys

from testapp.cli import main

if __name__ == "__main__":
    sys.exit(main())
