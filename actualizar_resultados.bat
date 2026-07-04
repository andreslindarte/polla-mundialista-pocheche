@echo off
cd /d "%~dp0"

echo.
echo  ========================================
echo   POLLA MUNDIALISTA - Subiendo cambios
echo  ========================================
echo.

echo  Sincronizando con GitHub...
git pull
echo.

git add Quiniela_Mundial_2026_v2.xlsx
git add index.html
git add admin.html
git add predicciones.json

git diff --cached --quiet
if %errorlevel% == 0 (
    echo  No hay cambios nuevos para subir.
    echo  Asegurate de guardar los archivos antes de correr esto.
    pause
    exit /b
)

for /f "tokens=1-3 delims=/ " %%a in ("%date%") do set HOY=%%c-%%b-%%a
for /f "tokens=1-2 delims=:." %%a in ("%time%") do set HORA=%%a:%%b

git commit -m "Actualizar - %HOY% %HORA%"

git push

echo.
echo  Listo! El sitio se actualizara en 1-2 minutos.
echo.
pause
