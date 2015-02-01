import pytest

@pytest.yield_fixture
def cleandir(tmpdir):
    """
    Create a temporary, clean CWD
    """
    with tmpdir.as_cwd():
        yield tmpdir
