@echo off
title Honda AI Service (Port 8001)
color 0A
echo ========================================================
echo   KHOI DONG DICH VU AI - HONDA MOTORBIKE (FASTAPI)
echo ========================================================
echo.

cd /d "%~dp0ai_service"
echo Thu muc hien tai: %CD%
echo Dang khoi dong AI Service tai http://127.0.0.1:8001...
echo Nhan Ctrl + C de dung service.
echo.

uvicorn main:app --host 127.0.0.1 --port 8001 --reload

pause
