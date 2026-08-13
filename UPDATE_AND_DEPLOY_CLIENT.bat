@echo off
title SHEPL Client — Update & Deploy
color 0B
cls
echo.
echo  ============================================================
echo    SHEPL CLIENT DASHBOARD — UPDATE AND DEPLOY
echo  ============================================================
echo.
echo  Press any key to select the client HTML file...
pause > nul

cd /d "%~dp0"

for /f "delims=" %%I in ('powershell -command "Add-Type -AssemblyName System.Windows.Forms; $f=New-Object System.Windows.Forms.OpenFileDialog; $f.Filter='HTML files (*.html)|*.html|All files (*.*)|*.*'; $f.Title='Select the client dashboard file from Claude'; if($f.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK){$f.FileName}"') do set "SELECTED_FILE=%%I"

if "%SELECTED_FILE%"=="" (
    echo  No file selected. Cancelled.
    pause
    exit /b
)

echo.
echo  Selected: %SELECTED_FILE%
echo  Copying to deploy folder...
copy /Y "%SELECTED_FILE%" "%~dp0index.html"

echo  Deploying to GitHub...
git add -A
git commit -m "Client dashboard update - %date% %time%"
git push origin main

echo.
echo  ============================================================
echo    DONE! CLIENT dashboard is now LIVE at:
echo.
echo    https://sheplpvtltd.github.io/Director-Task-control-Dashboard/
echo  ============================================================
echo.
pause
