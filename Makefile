PACKAGE = kwekash
VENV = $(HOME)/venv/$(PACKAGE)
PYTHON = $(VENV)/bin/python
PIP = $(VENV)/bin/pip
TWINE = $(VENV)/bin/twine

.PHONY: help venv build upload install uninstall clean

help:
	@echo "make venv      - Create virtualenv for local builds"
	@echo "make build     - Build wheel and sdist"
	@echo "make upload    - Upload to PyPI using twine"
	@echo "make install   - Install to venv and symlink to ~/bin"
	@echo "make uninstall - Remove venv and symlink"
	@echo "make clean     - Remove build artifacts"

venv:
	@echo "🔧 Creating virtualenv at $(VENV)"
	python3 -m venv $(VENV)
	$(PIP) install --upgrade pip build twine

build: venv
	@echo "📦 Building source and wheel distributions..."
	$(PYTHON) -m build

upload: build
	@echo "🚀 Uploading to PyPI..."
	$(TWINE) upload dist/*

install: venv
	@echo "📥 Installing $(PACKAGE) into venv"
	$(PIP) install .
	@mkdir -p $(HOME)/bin
	@ln -sf $(VENV)/bin/kwekash $(HOME)/bin/kwekash
	@echo "✅ Installed. Make sure ~/bin is in your PATH."

uninstall:
	@echo "🧹 Removing venv and symlink..."
	rm -rf $(VENV)
	rm -f $(HOME)/bin/kwekash
	@echo "✅ Uninstalled $(PACKAGE)"

clean:
	rm -rf build dist *.egg-info
