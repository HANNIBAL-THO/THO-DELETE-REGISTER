@echo off
chcp 65001 > nul
mode con: cols=100 lines=30
color 0A
cls

echo.
echo  ==============================================================
echo    TTTTTTT  HH   HH   OOOOOO
echo       TT    HH   HH  OO    OO
echo       TT    HHHHHHH  OO    OO
echo       TT    HH   HH  OO    OO
echo       TT    HH   HH   OOOOOO
echo  ==============================================================
echo.
echo                   Instalando requisitos...
echo                   =====================
echo.

python --version > nul 2>&1
if %errorlevel% neq 0 (
    echo [X] ERROR: Python no encontrado
    echo [!] Descargue Python 3.11: https://www.python.org/downloads/release/python-3110/
    pause
    exit /b 1
)

python -m pip --version > nul 2>&1
if %errorlevel% neq 0 (
    echo [+] Instalando pip...
    python -m ensurepip --default-pip
)

echo [+] Actualizando pip...
python -m pip install --upgrade pip

echo [+] Preparando entorno...
python -m pip uninstall -y PySide6 pywin32 psutil wheel setuptools packaging pyinstaller sip flet flet-desktop zope-event

echo [+] Instalando dependencias...
python -m pip install --upgrade pip setuptools wheel
python -m pip install -r requirements.txt --no-cache-dir --no-deps
python -m pip install -r requirements.txt --no-cache-dir

if %errorlevel% neq 0 (
    echo [X] Error en la instalacion
    pause
    exit /b 1
)

echo.
echo [✓] Instalacion completada!
echo [✓] Ejecute: RobloxPlayer.exe 
echo.
pause