@echo off
setlocal

rem Define paths
set "DESKTOP_DIR=%USERPROFILE%\Desktop"
set "ORGANIZED_DIR=%DESKTOP_DIR%\Organized"

rem Create Organized directory if it doesn't exist
if not exist "%ORGANIZED_DIR%" mkdir "%ORGANIZED_DIR%"

rem Move files based on their extension
for %%i in ("%DESKTOP_DIR%\*") do (
    if exist "%%i" (
        for /f "delims=" %%e in ("%%~xi") do (
            mkdir "%ORGANIZED_DIR%\%%e" 2>nul
            move "%%i" "%ORGANIZED_DIR%\%%e\"
            echo Moved: "%%i" to "%ORGANIZED_DIR%\%%e\"
        )
    )
)

echo Desktop files organized!
pause
