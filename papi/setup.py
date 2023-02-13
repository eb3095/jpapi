from setuptools import setup, find_packages
from version import __version__

setup(
    name="papi",
    packages=find_packages(),
    version=__version__,
    license="LGPLv3",
    description="A simple API system for python",
    author="eb3095",
)
