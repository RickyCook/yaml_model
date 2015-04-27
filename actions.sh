#!/bin/bash -e

MY_DIR="$(cd "$(dirname $0)"; pwd)"
export PYTHONPATH="$PYTHON_PATH:$MY_DIR"

function styletest {
    pep8 yaml_model.py test
    pylint --rcfile pylint-main.conf yaml_model.py
    pylint --rcfile pylint-test.conf test/*.py
}

function unittest {
    py.test --cov yaml_model test
}

case "$1" in
    styletest) styletest ;;
    unittest) unittest ;;
    test) styletest; unittest ;;
    *) echo "Unknown action: '$1'"; exit 1 ;;
esac
