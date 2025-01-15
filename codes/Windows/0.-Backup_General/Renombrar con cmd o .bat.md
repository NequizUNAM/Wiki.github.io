@Echo Off & SetLocal EnableDelayedExpansion
 
Set "frontWord=_Cara"
Set "backWord=_Dorso"
 
For /R %%# In ("*_0?F.pdf", "*_0?B.pdf") Do (
    Set "srcFilename=%%~n#"
    Set "lastChar=!srcFilename:~-1!"
    If /I "!lastChar!" EQU "F" (Set "dstFilename=!srcFilename:~0,-1!%frontWord%")
    If /I "!lastChar!" EQU "B" (Set "dstFilename=!srcFilename:~0,-1!%backWord%")
    Echo Renaming "%%~nx#" to "!dstFilename!%%~x#"...
    Rename "%%~f#" "!dstFilename!%%~x#"
)
 
Pause & Exit /B 0



REM Sencillamente adapta la expresión/patrón de búsqueda a tus necesidades...


Sencillamente adapta la expresión/patrón de búsqueda a tus necesidades...

Código

For /R %%# In ("*_??F.pdf", "*_??B.pdf") Do (...)

O bien:
Código

For /R %%# In ("*_0?F.pdf", "*_0?B.pdf", "*_1?F.pdf", "*_1?B.pdf") Do (...)