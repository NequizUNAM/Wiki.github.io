@echo off

REM Función para desmontar una unidad de red si está conectada
REM :DesmontarUnidad
REM for /f "tokens=2 delims=:" %%A in ('net use ^| find /i "%1"') do (
REM    net use %%A /delete /yes
REM )
REM goto :eof

REM Verificar y desmontar la primera unidad de red (Z:)
echo =========================================
echo Verificando y desmontando la primera unidad de red (Z:) si está ocupada...
echo =========================================
set unidad=Z:
REM Verificar si la unidad está en uso
echo Verificando si la unidad %unidad% está en uso...
echo. | fsutil volume diskfree %unidad% >nul 2>nul
if errorlevel 1 (
    echo La unidad %unidad% está en uso. Desmontando...
    net use %unidad% /delete /yes
    if not errorlevel 1 (
        echo La unidad %unidad% se desmontó correctamente.
    ) else (
        echo No se pudo desmontar la unidad %unidad%.
    )
) else (
    echo La unidad %unidad% no está en uso.
)

REM Verificar y desmontar la segunda unidad de red (Y:)
echo =========================================
echo Verificando y desmontando la segunda unidad de red (Y:) si está ocupada...
echo =========================================
REM call :DesmontarUnidad Y:
set unidad=Y:

REM Verificar si la unidad está en uso
echo Verificando si la unidad %unidad% está en uso...
echo. | fsutil volume diskfree %unidad% >nul 2>nul
if errorlevel 1 (
    echo La unidad %unidad% está en uso. Desmontando...
    net use %unidad% /delete /yes
    if not errorlevel 1 (
        echo La unidad %unidad% se desmontó correctamente.
    ) else (
        echo No se pudo desmontar la unidad %unidad%.
    )
) else (
    echo La unidad %unidad% no está en uso.
)

REM Conexión a la primera unidad de red
echo =========================================
echo Conectando a la primera unidad de red...
echo Ingresando credenciales...
echo =========================================

REM Credenciales para la segunda unidad de red
set "user1=.\sg"
set "pass1=CV@2022!"
set "carpeta_compartida1=\\MX16656\Documents"

net use Z: %carpeta_compartida1% %pass1% /user:%user1%

if %errorlevel% neq 0 (
    echo [Error!]: No se pudo conectar a la primera unidad de red.
) else (
    echo Conexion exitosa.
)

REM pause >nul

REM Conexión a la segunda unidad de red
echo =========================================
echo Conectando a la segunda unidad de red...
echo Ingresando credenciales...
echo =========================================
REM Credenciales para la segunda unidad de red
set "user2=tfca"
set "pass2=Tr1F3dC0n4rb."
set "carpeta_compartida2=\\10.2.147.110\dev"

net use Y: %carpeta_compartida2% %pass2% /user:%user2%

if %errorlevel% neq 0 (
    echo [Error!]: No se pudo conectar a la segunda unidad de red.
) else (
    echo Conexion exitosa.
)

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
    REM Conexión exitosa a la red.
    echo Bienvenido %user1%
    echo ===================================
)
    
timeout /t 5 >nul


