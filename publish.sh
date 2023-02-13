#!/bin/bash

set -euxo pipefail

cp LICENSE ./jpapi/LICENSE.txt
cp README.md ./jpapi/README.md

cd ./jpapi
python setup.py sdist bdist_wheel
python3 -m twine upload dist/*.tar.gz

rm -rf  jpapi/dist jpapi/jpapi.egg-info jpapi/build jpapi/__pycache__