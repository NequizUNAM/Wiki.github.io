@echo off
REM =====================
REM Elaborado por: Pedro Ernesto Nequiz Medina
REM ======================

echo ===================================
echo Bienvenido. Iniciando proceso...
echo ===================================

REM Obtener la ruta completa del archivo CSV de credenciales
set "csvFile=%~dp0credenciales.csv"
set "logFile=%~dp0log.txt"

REM Verificar si el archivo CSV de credenciales existe
if not exist "%csvFile%" (
    echo Error: El archivo "credenciales.csv" no se encontro en el directorio actual.
    echo Por favor, asegurate de que el archivo esté en el mismo directorio que este script.
    pause
    exit /b
)

REM Eliminar archivo de log si existe previamente
if exist "%logFile%" del "%logFile%"

REM Mostrar los datos de usuario y contraseña del archivo CSV de credenciales
for /f "usebackq skip=1 tokens=1-3 delims=," %%a in ("%csvFile%") do (

    REM Verificar si la unidad Z está ocupada
    net use Z: >nul 2>&1
    if %errorlevel% equ 0 (
        echo La unidad Z: ya esta en uso. La desmontare.
        net use Z: /delete >nul 2>&1
        timeout /t 2 >nul
    )

    REM Credenciales para la primera unidad de red
    set "nombre=%%a"
    set "user1=%%b"
    set "pass1=%%c"
    @REM echo Intentando siguiente credencial...
    
    REM Nombre del equipo y carpeta compartida para la primera unidad de red
    set "carpeta_compartida1=\\132.248.127.8\%%b$"
    
    REM Conexión a la primera unidad de red 
    net use Z: "%carpeta_compartida1%" "%%c" /user:"%%b"

    if %errorlevel% neq 0 (
        echo Error: No se pudo conectar a la primera unidad de red.
        echo Por favor, verifica las credenciales.
        echo %%a - error >> "%logFile%"
    ) else (
        REM Conexión exitosa a la red.
        echo ===================================
        echo Bienvenido %%a
        echo ===================================
        timeout /t 3 >nul
        echo %%a - éxito >> "%logFile%"
    )

    echo Usuario: %%b
    echo Contrasena: %%c
    REM echo.
)

echo ===================================
echo Proceso completado. Pulsa cualquier tecla para cerrar la ventana.
pause >nul
