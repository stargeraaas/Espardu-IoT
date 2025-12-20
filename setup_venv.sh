#!/bin/bash
# Script for setting up Python virtual environment
# Usage: ./setup_venv.sh

echo "========================================"
echo "Setting up Python Virtual Environment"
echo "========================================"
echo ""

# Check Python
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

# Check if venv already exists
if [ -d "venv" ]; then
    echo "Virtual environment already exists in venv/"
    echo ""
    read -p "Do you want to recreate it? (y/N): " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Removing existing virtual environment..."
        rm -rf venv
    else
        echo "Skipped."
        source venv/bin/activate
        echo ""
        echo "Upgrading pip..."
        pip install --upgrade pip
        echo ""
        echo "Installing dependencies from requirements.txt..."
        pip install -r requirements.txt
        echo ""
        echo "========================================"
        echo "Virtual environment setup completed!"
        echo ""
        echo "To activate the virtual environment manually:"
        echo "  source venv/bin/activate"
        echo ""
        echo "To deactivate:"
        echo "  deactivate"
        echo "========================================"
        exit 0
    fi
fi

echo "Creating virtual environment..."
$PYTHON_CMD -m venv venv
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to create virtual environment"
    exit 1
fi
echo "Virtual environment created successfully."
echo ""

echo "Activating virtual environment..."
source venv/bin/activate
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to activate virtual environment"
    exit 1
fi

echo ""
echo "Upgrading pip..."
pip install --upgrade pip
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to upgrade pip"
    exit 1
fi

echo ""
echo "Installing dependencies from requirements.txt..."
pip install -r requirements.txt
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to install dependencies"
    exit 1
fi

echo ""
echo "========================================"
echo "Virtual environment setup completed!"
echo ""
echo "To activate the virtual environment manually:"
echo "  source venv/bin/activate"
echo ""
echo "To deactivate:"
echo "  deactivate"
echo "========================================"


