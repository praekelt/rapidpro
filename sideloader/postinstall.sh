#!/bin/bash

manage="${VENV}/bin/python ${INSTALLDIR}/${REPO}/manage.py"

pip="${VENV}/bin/pip"

cd "${INSTALLDIR}/${REPO}/"

if [ ! -e /usr/local/bin/coffee ]; then
    npm install -g coffee-script
fi

if [ ! -e /usr/bin/lessc ]; then
    npm install -g less
fi

$pip install -r pip-freeze.txt

$manage migrate
$manage collectstatic
$manage compress
