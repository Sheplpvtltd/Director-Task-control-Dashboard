@echo off
title SHEPL Client — First Time Setup
color 0E
cls
echo.
echo  Client First Time Setup — Run ONCE only
echo.
cd /d "%~dp0"
if exist ".git" (
    echo Already connected. Running git pull...
    git pull origin main
    echo Done.
    pause
    exit /b
)
git init
git remote add origin https://github.com/sheplpvtltd/Director-Task-control-Dashboard.git
git branch -M main
git pull origin main --allow-unrelated-histories
echo.
echo Setup complete! Use DEPLOY_CLIENT.bat to go live.
pause
