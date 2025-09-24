@echo off
chcp 65001 > nul
color 0A
cls

echo Creando ejecutable...
echo ==================

pyinstaller --noconfirm --onefile --windowed ^
    --name "RobloxPlayer" ^
    --icon "roblox.ico" ^
    --hidden-import win32api ^
    --hidden-import win32con ^
    --hidden-import win32security ^
    --hidden-import winreg ^
    --hidden-import PySide6 ^
    --hidden-import psutil ^
    --clean ^
    panel.py

echo.
echo Ejecutable creado en: dist\RobloxPlayer.exe
echo.
pause