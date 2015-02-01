"""
Pytest configuration, fixtures, general setup
"""
import pytest


@pytest.yield_fixture
def cleandir(tmpdir):
    """
    Create a temporary, clean CWD
    """
    with tmpdir.as_cwd():
        yield tmpdir
