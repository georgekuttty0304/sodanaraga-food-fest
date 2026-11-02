@echo off
title Sodanaranga POS Launcher
echo ==============================================
echo       Starting Sodanaranga POS & Billing
echo ==============================================
echo.
echo Opening browser...
start http://localhost:8080
echo.
echo Server running at http://localhost:8080
echo Keep this window open while using the POS.
echo.
python -m http.server 8080 --directory "%~dp0"
pause
