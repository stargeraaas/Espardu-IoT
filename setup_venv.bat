@ECHO OFF
REM Script for setting up Python virtual environment
REM Usage: setup_venv.bat

echo ========================================
echo Setting up Python Virtual Environment
echo ========================================
echo.

REM Check Python
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

REM Check if venv already exists
if exist "venv\" (
    echo Virtual environment already exists in venv/
    echo.
    choice /C YN /M "Do you want to recreate it"
    if errorlevel 2 (
        echo Skipped.
        goto activate
    )
    echo Removing existing virtual environment...
    rmdir /s /q venv
)

echo Creating virtual environment...
%PYTHON_CMD% -m venv venv
if errorlevel 1 (
    echo ERROR: Failed to create virtual environment
    pause
    exit /b 1
)
echo Virtual environment created successfully.
echo.

:activate
echo Activating virtual environment...
call venv\Scripts\activate.bat
if errorlevel 1 (
    echo ERROR: Failed to activate virtual environment
    pause
    exit /b 1
)

echo.
echo Upgrading pip...
python -m pip install --upgrade pip
if errorlevel 1 (
    echo ERROR: Failed to upgrade pip
    pause
    exit /b 1
)

echo.
echo Installing dependencies from requirements.txt...
pip install -r requirements.txt
if errorlevel 1 (
    echo ERROR: Failed to install dependencies
    pause
    exit /b 1
)

echo.
echo ========================================
echo Virtual environment setup completed!
echo.
echo To activate the virtual environment manually:
echo   venv\Scripts\activate.bat
echo.
echo To deactivate:
echo   deactivate
echo ========================================
pause


