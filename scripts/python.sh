#!/bin/bash
# Wrapper script to use python from project's venv
# Usage: ./python.sh [python arguments]

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check if venv exists
if [ -f "$SCRIPT_DIR/venv/bin/python" ]; then
    "$SCRIPT_DIR/venv/bin/python" "$@"
    exit $?
else
    echo "ERROR: Virtual environment not found in $SCRIPT_DIR/venv"
    echo "Please run ./setup_venv.sh first to create the virtual environment."
    # Fallback to system python
    if command -v python3 &> /dev/null; then
        python3 "$@"
    elif command -v python &> /dev/null; then
        python "$@"
    else
        exit 1
    fi
fi

