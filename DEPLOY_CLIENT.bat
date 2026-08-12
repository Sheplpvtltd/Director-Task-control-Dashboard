@echo off
title SHEPL Client Dashboard — Deploy
color 0B
cls
echo.
echo  ============================================================
echo    SHEPL CLIENT DASHBOARD — DEPLOYING...
echo  ============================================================
echo.
cd /d "%~dp0"
git add -A
git diff --cached --quiet
if errorlevel 1 (
    git commit -m "Client dashboard update - %date% %time%"
    git push origin main
    echo.
    echo  DONE! CLIENT dashboard is LIVE at:
    echo  https://sheplpvtltd.github.io/Director-Task-control-Dashboard/
) else (
    echo  No changes. Already up to date.
)
echo.
pause
