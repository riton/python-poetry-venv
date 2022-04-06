#!/bin/bash -ex

VENV_DIR="/venv"
SRC_DIR="/src"
ALT_SRC_DIR="/src2"
USER_CACHE_DIR="~/.cache"

cp -r $SRC_DIR $ALT_SRC_DIR

# We'll remove this directory to test if the soft is still working
# without the source dir
cd $ALT_SRC_DIR

pip3 install --quiet --upgrade pip wheel poetry

python3.8 -V

poetry --version

python3.8 -m venv "$VENV_DIR"

source $VENV_DIR/bin/activate

poetry env info

poetry cache list

poetry build

ls -laF dist/*.whl

pip3 install dist/*.whl

poetry env info

poetry cache list

pip3 freeze

deactivate

cd /

echo "Try after install"

$VENV_DIR/bin/python-poetry-venv

echo "Removing source directory and trying again"
rm -rf $ALT_SRC_DIR

$VENV_DIR/bin/python-poetry-venv

echo "Removing user cache dir and trying again"
rm -rf $USER_CACHE_DIR

$VENV_DIR/bin/python-poetry-venv
