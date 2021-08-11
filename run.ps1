# Remove directories
if (Test-Path .tox) {Remove-Item .tox -Recurse}
if (Test-Path .venv/venvwin) {Remove-Item .venv/venvwin -Recurse}

# Setup venv
python -m venv .venv/venvwin
./.venv/venvwin/Scripts/activate

# Install required packages
python -m pip install --upgrade pip
python -m pip install -q build==0.5.1
python -m pip install pip-tools==6.2.0
python -m pip install tox==3.23.1

python -m pip install -r requirements/dev.txt
python -m pip install -e .

# Run tox related tests
python -m tox
python -m tox -e coverage
python -m tox -e style
python -m tox -e typing
python -m tox -e docs

# Build project
python -m build
