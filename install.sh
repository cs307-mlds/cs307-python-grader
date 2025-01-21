echo "[config] checking initial python version ..."
python --version

echo "[config] checking python runtime (64-bit?) ..."
python -c 'import sys;print("%x" % sys.maxsize, sys.maxsize > 2**32)'

echo "[install] upgrading python version ..."
mamba activate
mamba install python=3.12.8 --yes

echo "[install] latest pip version ..."
pip install --upgrade pip

echo "[install] python packages ..."
python3 -m pip install --no-cache-dir -r /requirements.txt
mamba clean --all --yes --quiet
pip cache purge

echo "[config] checking upgraded python version ..."
python --version

echo "[config] checking python package versions ..."
pip list
