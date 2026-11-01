@echo off
title Push to GitHub - Sodanaraga Food Fest
cd /d "%~dp0"
echo ========================================================
echo       Pushing Sodanaraga POS to GitHub
echo       Repository: https://github.com/georgekuttty0304/sodanaraga-food-fest.git
echo ========================================================
echo.
echo If prompted, please sign in via the browser window that opens.
echo.
git push -u origin main
echo.
if %ERRORLEVEL% EQU 0 (
    echo ========================================================
    echo   SUCCESS! Your code has been pushed to GitHub.
    echo ========================================================
) else (
    echo.
    echo If push was rejected because the repository already contains files (like a README),
    echo you may need to force push or pull first.
    echo Trying to force update...
    git push -u origin main --force
)
echo.
pause
