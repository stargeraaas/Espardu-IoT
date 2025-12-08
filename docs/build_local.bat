@ECHO OFF
REM Script for local documentation build
REM Usage: build_local.bat

echo ========================================
echo Building Espardu-IoT Documentation
echo ========================================
echo.

REM Change to project root
cd /d %~dp0\..

echo [1/5] Checking Python...
set PYTHON_CMD=
where py >nul 2>nul
if not errorlevel 1 (
    set PYTHON_CMD=py
) else (
    where python >nul 2>nul
    if not errorlevel 1 (
        set PYTHON_CMD=python
    )
)

if "%PYTHON_CMD%"=="" (
    echo ERROR: Python not found in PATH
    echo Please install Python 3.8+ from https://www.python.org/
    pause
    exit /b 1
)
echo Python found: %PYTHON_CMD%
%PYTHON_CMD% --version
echo.

echo [2/5] Installing/updating dependencies...
echo Checking pip...
%PYTHON_CMD% -m pip --version >nul 2>nul
if errorlevel 1 (
    echo WARNING: pip not found. Attempting to upgrade pip anyway...
)

%PYTHON_CMD% -m pip install --upgrade pip
if errorlevel 1 (
    echo ERROR: pip is not available or failed to upgrade
    echo Please ensure Python is installed with pip, or install pip manually:
    echo   python -m ensurepip --upgrade
    echo   OR download get-pip.py from https://pip.pypa.io/en/stable/installation/
    pause
    exit /b 1
)

%PYTHON_CMD% -m pip install -r requirements.txt
if errorlevel 1 (
    echo ERROR: Failed to install dependencies from requirements.txt
    pause
    exit /b 1
)
echo Dependencies installed successfully
echo.

echo [3/5] Checking Doxygen...
where doxygen >nul 2>nul
if errorlevel 1 (
    echo ERROR: Doxygen not found in PATH
    echo Download and install Doxygen: https://www.doxygen.nl/download.html
    pause
    exit /b 1
)
echo Doxygen found
echo.

echo [4/5] Generating XML from C++ code...
doxygen Doxyfile
if errorlevel 1 (
    echo ERROR: Failed to generate XML
    pause
    exit /b 1
)
echo XML generated successfully
echo.

echo [5/5] Building Sphinx documentation...
cd docs
%PYTHON_CMD% -m sphinx -b html source _build/html
if errorlevel 1 (
    echo ERROR: Failed to build Sphinx documentation
    cd ..
    pause
    exit /b 1
)
cd ..
echo.

echo ========================================
echo Build completed successfully!
echo Documentation available at: docs\_build\html\index.html
echo ========================================
pause

