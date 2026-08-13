@echo off
title SHEPL Client — Update & Deploy
color 0B
cls
echo.
echo  ============================================================
echo    SHEPL CLIENT DASHBOARD — UPDATE AND DEPLOY
echo  ============================================================
echo.
echo  Press any key to select your file from Claude...
pause > nul

cd /d "%~dp0"

for /f "delims=" %%I in ('powershell -command "Add-Type -AssemblyName System.Windows.Forms; $f=New-Object System.Windows.Forms.OpenFileDialog; $f.Filter='HTML files (*.html)|*.html|All files (*.*)|*.*'; $f.Title='Select the client dashboard file from Claude'; if($f.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK){$f.FileName}"') do set "SELECTED_FILE=%%I"

if "%SELECTED_FILE%"=="" (
    echo  No file selected. Cancelled.
    pause
    exit /b
)

echo.
echo  File selected: %SELECTED_FILE%
echo  Copying file...
copy /Y "%SELECTED_FILE%" "%~dp0index.html"

echo  Syncing with GitHub...
git pull origin main --rebase

echo  Deploying...
git add -A
git commit -m "Client dashboard update - %date% %time%"
git push origin main

echo.
echo  ============================================================
echo    DONE! CLIENT dashboard is LIVE at:
echo    https://sheplpvtltd.github.io/Director-Task-control-Dashboard/
echo  ============================================================
echo.
pause
