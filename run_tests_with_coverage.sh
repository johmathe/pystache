#!/bin/bash

rm -f pep8.log pyflakes.log

# Run python tests related to this project.
export PYTHONPATH=${PYTHONPATH}:./python
./test.py
nosetests --with-xunit \
          --all-modules \
          --traverse-namespace \
          --with-coverage \
          --cover-package=generate_shards \
          --cover-inclusive \
          python/tests
python -m coverage run test.py
python -m coverage xml -o coverage.xml
python -m coverage html -d coverage
find . -iname "*.py"| xargs pylint > pylint.log || true
find . -iname "*.py"| xargs pep8 > pep8.log || true
