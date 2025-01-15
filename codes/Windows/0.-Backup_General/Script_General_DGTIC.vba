:: Script que contiene un menu con varios Procesos
:: Elaborado por: Pedro Ernesto Nequiz Medina
:: ing.nequiz@gmail.com
@echo off
:menu
CLS
echo ************************************************************************
echo           MENU
echo ************************************************************************
echo 1. Mover archivos PDF a una carpeta llamada "1Concentrado_PDF"
echo 2. Reemplaza la cadena de caracteres por la indicada Solo Funciona en PDF
echo 3. Convertir PDF a Text
echo 4. Salir
echo ************************************************************************

set /p opcion="Ingrese su opcion: "

if "%opcion%"=="1" (
    call :moverPDF
) else if "%opcion%"=="2" (
    call :Reemplazar_cadena
) else if "%opcion%"=="3" (
    call :ConvertToText
) else if "%opcion%"=="4" (
    exit
) else (
    echo Opción no válida. Por favor, seleccione una opción válida.
    pause
    goto :menu
)

goto :menu

REM ============================================
REM Programa concentrar todos los PDF en una carpeta
REM ============================================
:moverPDF
    echo Moviendo archivos espere...
    if not exist "%cd%\1Concentrado_PDF" mkdir "%cd%\1Concentrado_PDF"

    for /r %%f in (*.pdf) do (
        move "%%f" "%cd%\1Concentrado_PDF\"
    )

    echo Archivos PDF movidos a la carpeta "1Concentrado_PDF".
    pause
    goto :eof

REM ============================================
REM Programa para reemplazar el nombre especificado
REM ============================================
:Reemplazar_cadena
    setlocal enabledelayedexpansion

    echo ==================================================================
    echo Coloque cuidadosamente el nombre a reemplazar no se puede revertir!...
    echo el Reemplazo solo se aplicara a la carpeta "1Concentrado_PDF"
    echo ==================================================================

    REM Directorio donde se encuentra el script
    set "ruta=%~dp0"

    REM Carpeta específica donde buscar archivos PDF
    set "pdf_dir=%ruta%1Concentrado_PDF\"

    set /p cadena_antigua=Introduce la cadena que deseas reemplazar:
    set /p cadena_nueva=Introduce la nueva cadena:

    REM Verificar si la carpeta "1Concentrado_PDF" existe
    if not exist "%pdf_dir%" (
        echo La carpeta "1Concentrado_PDF" no fue encontrada.
        pause
        exit /b
    )

    for %%f in ("%pdf_dir%*.pdf") do (
        set "nombre=%%~nf"
        set "extension=%%~xf"
        set "nuevo_nombre=!nombre:%cadena_antigua%=%cadena_nueva%!"

        ren "%%f" "!nuevo_nombre!!extension!"
    )

    echo Reemplazo completado.
    pause
    goto :eof

REM ============================================
REM Convertir PDF a Text
REM ============================================
:ConvertToText
    @echo off

    echo Iniciando programa. Por favor, espere...
    echo Esto puede tardar unos minutos ...

    REM Directorio donde se encuentra el script
    set "script_dir=%~dp0"

    REM Directorio donde se encuentra la carpeta 1Concentrado_PDF
    set "pdf_dir=%script_dir%1Concentrado_PDF"

    REM Directorio donde se guardarán los archivos de texto plano
    set "txt_dir=%script_dir%2NombresPDFToText"

    REM Ruta a pdftotext en el mismo directorio que el script
    set "pdftotext=%script_dir%pdftotext.exe"

    REM Verificar si la carpeta 1Concentrado_PDF existe
    if not exist "%pdf_dir%" (
        echo La carpeta "1Concentrado_PDF" no fue encontrada.
        pause
        exit /b
    )

    REM Crear el directorio para los archivos de texto si no existe
    if not exist "%txt_dir%" mkdir "%txt_dir%"

    REM Convertir todos los PDFs en la carpeta 1Concentrado_PDF
    for %%F in ("%pdf_dir%\*.pdf") do (
        "%pdftotext%" "%%F" "%txt_dir%\%%~nF.txt"
    )

    echo Conversión completada.
    pause

    goto :eof

:: Elaborado por: Pedro Ernesto Nequiz Medina
:: ing.nequiz@gmail.com