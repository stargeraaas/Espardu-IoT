#!/bin/bash
# Script for local documentation build
# Usage: ./build_local.sh

echo "========================================"
echo "Building Espardu-IoT Documentation"
echo "========================================"
echo ""

# Change to project root
cd "$(dirname "$0")/.." || exit 1

echo "[1/5] Checking Python..."
if ! command -v python3 &> /dev/null; then
    if ! command -v python &> /dev/null; then
        echo "ERROR: Python not found"
        echo "Install Python 3.8+ from https://www.python.org/"
        exit 1
    fi
    PYTHON_CMD=python
else
    PYTHON_CMD=python3
fi
echo "Python found: $PYTHON_CMD"
$PYTHON_CMD --version
echo ""

# Check if venv exists and activate it
if [ -d "venv" ] && [ -f "venv/bin/activate" ]; then
    echo "[2/5] Virtual environment found. Activating..."
    source venv/bin/activate
    PYTHON_CMD=python
    echo "Using virtual environment"
    echo ""
else
    echo "[2/5] No virtual environment found. Installing dependencies globally..."
    $PYTHON_CMD -m pip install --upgrade pip --quiet
    $PYTHON_CMD -m pip install -r requirements.txt --quiet
    if [ $? -ne 0 ]; then
        echo "ERROR: Failed to install dependencies"
        echo "You can create a virtual environment first:"
        echo "  ./setup_venv.sh"
        exit 1
    fi
    echo "Dependencies installed"
    echo ""
fi

echo "[3/5] Checking Doxygen..."
if ! command -v doxygen &> /dev/null; then
    echo "ERROR: Doxygen not found"
    echo "Install Doxygen: sudo apt-get install doxygen"
    exit 1
fi
echo "Doxygen found"
echo ""

echo "[4/5] Generating XML from C++ code..."
doxygen Doxyfile
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to generate XML"
    exit 1
fi
echo "XML generated successfully"
echo ""

echo "[5/5] Building Sphinx documentation..."
cd docs || exit 1
$PYTHON_CMD -m sphinx -b html source _build/html
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to build Sphinx documentation"
    cd ..
    exit 1
fi
cd .. || exit 1
echo ""

echo "========================================"
echo "Build completed successfully!"
echo "Documentation available at: docs/_build/html/index.html"
echo "========================================"

