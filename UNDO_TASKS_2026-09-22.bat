@echo off
REM UNDO for Director Task Control build 2026-09-22: puts build 2026-09-21 back into this deploy folder, then runs DEPLOY_CLIENT.bat.
cd /d "%~dp0"
if not exist "_backup_2026-09-21\index.html" ( echo Backup file _backup_2026-09-21\index.html not found - tell Claude. & pause & exit /b 1 )
copy /y "index.html" "_backup_2026-09-21\index_2026-09-22_replaced.html" >nul
copy /y "_backup_2026-09-21\index.html" "index.html" >nul
echo Build 2026-09-21 restored. Running DEPLOY_CLIENT.bat now ...
call DEPLOY_CLIENT.bat
