#!/bin/bash
# Wrapper script to use pip from project's venv
# Usage: ./pip.sh [pip arguments]

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check if venv exists
if [ -f "$SCRIPT_DIR/venv/bin/pip" ]; then
    "$SCRIPT_DIR/venv/bin/python" -m pip "$@"
    exit $?
else
    echo "ERROR: Virtual environment not found in $SCRIPT_DIR/venv"
    echo "Please run ./setup_venv.sh first to create the virtual environment."
    exit 1
fi

