:: Script que contiene un menu con varios Procesos
:: Elaborado por: Pedro Ernesto Nequiz Medina
:: ing.nequiz@gmail.com
@echo off
:menu
CLS
echo ************************************************************************
echo *    MENU v1.8
echo ************************************************************************
echo * 1. Descomprime ZIP y mover PDF a         "0_Archivos_Descomprimidos"
echo * 2. Busca todos los PDF y los mueve a     "1_Concentrado_PDF"
echo * 3. Convertir Todos los PDF a Text        "2_PDFToText"
echo * 4. Reemplaza el nombre de los archivos PDF en la carpeta "1_Concentrado_PDF"
echo * 5. Salir
echo ************************************************************************
set /p opcion="Ingrese su opcion: "

if "%opcion%"=="1" (
    call :descomprimirZIP
) else if "%opcion%"=="2" (
    call :moverPDF
) else if "%opcion%"=="3" (
    call :ConvertToText
) else if "%opcion%"=="4" (
    call :Reemplazar_cadena
) else if "%opcion%"=="5" (
    exit
) else (
    echo Opcion no valida. Por favor, seleccione una opcion valida.
    pause
    goto :menu
)

goto :menu

REM ============================================
REM Programa principal que llama a descomprimirZIP y moverPDF
REM ============================================

echo ==================================================================
echo Descomprime ZIP y coloca los archivos en "0_Archivos_Descomprimidos"
echo ==================================================================
:descomprimirZIP
    echo Descomprimiendo archivos ZIP, espere...
    if not exist "%cd%\0_Archivos_Descomprimidos" mkdir "%cd%\0_Archivos_Descomprimidos"

    for /r %%f in (*.zip) do (
        tar -xf "%%f" -C "%cd%\0_Archivos_Descomprimidos"
    )

    echo Archivos ZIP descomprimidos en la carpeta "0_Archivos_Descomprimidos".
    pause
    goto :eof

:moverPDF
    echo Moviendo archivos PDF, espere...
    if not exist "%cd%\1_Concentrado_PDF" mkdir "%cd%\1_Concentrado_PDF"

    for /r %%f in (*.pdf) do (
        move "%%f" "%cd%\1_Concentrado_PDF\"
    )

    echo Archivos PDF movidos a la carpeta "1_Concentrado_PDF".
    echo Proceso completado.
    pause
    goto :eof

REM ============================================
REM Convertir PDF a Text
REM ============================================
:ConvertToText
    @echo off

    REM Habilitar la expansión retardada de variables
    setlocal enabledelayedexpansion

    echo Iniciando programa. Por favor, espere...
    echo Esto puede tardar unos minutos ...

    REM Directorio donde se encuentra el script
    set "script_dir=%~dp0"

    REM Directorio donde se encuentra la carpeta 1_Concentrado_PDF
    set "pdf_dir=%script_dir%1_Concentrado_PDF"

    REM Directorio donde se guardarán los archivos de texto plano
    set "txt_dir=%script_dir%2_PDFToText"
    set "txt_dir_concentrado=%script_dir%2_PDFToText\ArchivosIndividuales"

    REM Ruta a pdftotext en el mismo directorio que el script
    set "pdftotext=%script_dir%pdftotext.exe"

    REM Verificar si la carpeta 1_Concentrado_PDF existe
    if not exist "%pdf_dir%" (
        echo La carpeta "1_Concentrado_PDF" no fue encontrada.
        pause
        exit /b
    )

    REM Crear el directorio para los archivos de texto si no existe
    if not exist "%txt_dir%" mkdir "%txt_dir%"
    if not exist "%txt_dir_concentrado%" mkdir "%txt_dir_concentrado%"

    REM Convertir todos los PDFs en la carpeta 1_Concentrado_PDF
    for %%F in ("%pdf_dir%\*.pdf") do (
        "%pdftotext%" "%%F" "%txt_dir_concentrado%\%%~nF.txt"
    )

    REM Una vez que termine de pasar todos los archivos a TXT
    REM Aquí irá el código para organizar los archivos TXT
    for %%F in ("%txt_dir_concentrado%\*.txt") do (
        set "filename=%%~nF"

        REM Usar la expansión retardada de variables con ! alrededor de las variables
        REM El directorio es: !txt_dir_concentrado!
        REM El archivo actual es: !filename!

        set "type=Otro"
        
        if /i "!filename:~0,2!"=="CD" set "type=Cuestionario_Diagnostico"
        for %%I in (C1 C2 C3 C4) do if /i "!filename:~0,2!"=="%%I" set "type=Cuestionario"
        for %%I in (D1 D2 D3 D4) do if /i "!filename:~0,2!"=="%%I" set "type=Dudas_Comentarios"
        for %%I in (F1 F2 F3 F4) do if /i "!filename:~0,2!"=="%%I" set "type=Foro_Evaluacion"
        
        rem Creamos el nuevo archivo de texto según el tipo
        echo. > "!txt_dir!\!type!.txt"
        rem Agregamos el contenido del archivo actual al nuevo archivo
        type "%%F" >> "!txt_dir!\!type!.txt"
    )

    echo ************************
    echo Archivos Creados
    echo ** ArchivosIndividuales [contiene cada archivo que fue convertido a txt de forma individual]
    echo ** Cuestionario_Diagnostico.txt
    echo ** Cuestionario.txt
    echo ** Dudas_Comentarios.txt
    echo ** Foro_Evaluacion.txt
    pause
    goto :eof

REM ============================================
REM Programa para reemplazar el nombre especificado
REM ============================================
:Reemplazar_cadena
    setlocal enabledelayedexpansion

    echo ==================================================================
    echo Coloque cuidadosamente el nombre a reemplazar no se puede revertir!...
    echo el Reemplazo solo se aplicara a la carpeta "1_Concentrado_PDF"
    echo Solo funciona en archivos de tipo PDF
    echo ==================================================================

    REM Directorio donde se encuentra el script
    set "ruta=%~dp0"

    REM Carpeta específica donde buscar archivos PDF
    set "pdf_dir=%ruta%1_Concentrado_PDF\"

    set /p cadena_antigua=Introduce la cadena que deseas reemplazar:
    set /p cadena_nueva=Introduce la nueva cadena:

    REM Verificar si la carpeta "1_Concentrado_PDF" existe
    if not exist "%pdf_dir%" (
        echo La carpeta "1_Concentrado_PDF" no fue encontrada.
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

:: Elaborado por: Pedro Ernesto Nequiz Medina
:: ing.nequiz@gmail.com