@echo off
cd /d "%~dp0"
echo Menjalankan git pull...
git pull
if errorlevel 1 (
    echo.
    echo Git pull gagal. Periksa koneksi atau status repository.
) else (
    echo.
    echo Git pull selesai.
)
pause
