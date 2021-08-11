from setuptools import setup
from distutils.util import convert_path


main_version = {}
ver_path = convert_path('src/testapp/version.py')
with open(ver_path) as ver_file:
    exec(ver_file.read(), main_version)

setup(
    version = main_version['__version__']
)
