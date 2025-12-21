@ECHO OFF
REM Wrapper script to use python from project's venv
REM Usage: python.bat [python arguments]

REM Get the directory where this script is located
set SCRIPT_DIR=%~dp0

REM Check if venv exists
if exist "%SCRIPT_DIR%venv\Scripts\python.exe" (
    "%SCRIPT_DIR%venv\Scripts\python.exe" %*
    exit /b %errorlevel%
) else (
    echo ERROR: Virtual environment not found in %SCRIPT_DIR%venv
    echo Please run setup_venv.bat first to create the virtual environment.
    REM Fallback to system python
    python %*
    exit /b %errorlevel%
)

