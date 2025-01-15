::Recorre el csv llamando a WriteCSV para cada linea ignorando la cabecera
:: Elaborado por: MCC Sergio Antonio Alva Arguinzoniz
:: s.alva@unam.mx 
CLS
ECHO OFF
ECHO ************************************************************************
ECHO *   Programa para organizar las practicas de los alumnos del  IEBEM    *
ECHO *                           Semana 2                                   *
ECHO *                    ver 4.4 - 19 abril 2024                           *
ECHO ************************************************************************
:: numero de trabajadores totales en cont
SET cont=0
:: PAUSE
:: directorios de la semana 1
set rev=2024_GRUPOS
set prac=P2
set semana=S2
set part=2024_CURPS
rd /S /Q %rev%\%~6\%semana%\%prac%
rd /S /Q %part%\%~2\%prac%
del faltan%semana%_%prac%.txt
md %rev%
md %part%
:: Recupera datos del archivo CSV
for /f "skip=1 tokens=1-8 delims=," %%a in (trabajadoresIEBEM2024.csv) do call :WriteCVS "%%a" "%%b" "%%c" "%%d" "%%e" "%%f" "%%g" "%%h" "%%i"

::Manda al final saltandose el WriteCVS
GOTO Done

::Funcion que procesa cada fila
:WriteCVS
set /a cont+=1

ECHO _________________________________________________
ECHO %cont% Buscando "%~2"
ECHO _________________________________________________
if exist "%~2"* (Echo ENCONTRADO - "%~2" ) else (ECHO CURP no encontrado: '%~2', Alumno: '%~3', Curso: '%~6', Asesor: '%~7'>>faltan%semana%_%prac%.txt & ECHO *** NO ENCONTRADO *** - CURP %~2)
:: Creando estructura por Curso
if exist "%rev%\%~6\%semana%\%prac%" (ECHO OFF) else (md "%rev%\%~6\%semana%\%prac%" )
:: Copiando la evidencia de practicas entregadas de cada alumno
if exist "%~2"* (md "%rev%\%~6\%semana%\%prac%\%~2" & cd "%~2"* & xcopy *.* ..\"%rev%"\"%~6"\"%semana%"\"%prac%"\"%~2" /s & cd .. )
:: Creando estructura por CURP
:: Copiando la evidencia de practicas entregadas de cada alumno
if exist "%~2"* (md "%part%\%~2 %~3\%prac%" & cd "%~2"* & xcopy *.* ..\"%part%"\"%~2 %~3"\"%prac%" /s & cd .. )

GOTO EOF

:Done
::Aqui termina el programa
ECHO **************************************
ECHO Programa finalizado
ECHO **************************************
Echo _______________________________________
:: Elaborado por: MCC Sergio Antonio Alva Arguinzoniz
:: s.alva@unam.mx 
:EOF