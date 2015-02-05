#!/usr/bin/env python
from setuptools import setup

setup(name="yaml_model",
      version="0.1.2",
      description="Semi-transparent YAML serialization/deserialization",
      author="Ricky Cook",
      author_email="mail@thatpanda.com",
      url="https://github.com/RickyCook/yaml_model",
      py_modules=['yaml_model'],
      install_requires=['PyYAML>=3'],
      )
