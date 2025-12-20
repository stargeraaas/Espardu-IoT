@ECHO OFF
REM Wrapper script to use pip from project's venv
REM Usage: pip.bat [pip arguments]

REM Get the directory where this script is located
set SCRIPT_DIR=%~dp0

REM Check if venv exists
if exist "%SCRIPT_DIR%venv\Scripts\pip.exe" (
    "%SCRIPT_DIR%venv\Scripts\python.exe" -m pip %*
    exit /b %errorlevel%
) else (
    echo ERROR: Virtual environment not found in %SCRIPT_DIR%venv
    echo Please run setup_venv.bat first to create the virtual environment.
    exit /b 1
)

