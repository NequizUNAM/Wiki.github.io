@echo off

REM Verificar y desmontar la primera unidad de red (M:)
echo =========================================
echo Verificando y desmontando la primera unidad de red (M:) si está ocupada...
echo =========================================
set unidad=M:
REM Verificar si la unidad está en uso
echo Verificando si la unidad %unidad% está en uso...
echo. | fsutil volume diskfree %unidad% >nul 2>nul
if errorlevel 1 (
    echo La unidad %unidad% está en uso. Desmontando...
    net use %unidad% /delete /yes
    if not errorlevel 1 (
        echo La unidad %unidad% se desmonto correctamente.
    ) else (
        echo No se pudo desmontar la unidad %unidad%.
    )
) else (
    echo La unidad %unidad% no está en uso.
)

REM Credenciales para la primera unidad de red
set "user1=pedronm"
set "pass1=Nequiz23#"

REM Nombre del equipo y carpeta compartida para la primera unidad de red
set "carpeta_compartida1=\\132.248.127.8\%user1%$"

REM Conexión a la primera unidad de red
net use M: "%carpeta_compartida1%" "%pass1%" /user:"%user1%"

if %errorlevel% neq 0 (
    echo Error: No se pudo conectar a la primera unidad de red.
    echo Por favor, verifica las credenciales.
) else (
    echo ===================================
    REM Conexion exitosa a la red.
    echo Bienvenido %user1%
    echo ===================================
)
    
timeout /t 5 >nul