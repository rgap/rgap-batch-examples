@ECHO OFF
::CONTADOR DE PALABRAS
::AUTOR: CARLOS
::USO: CONTAR.BAT ARCHIVO.TXT
::O ARRASTRE ARCHIVO.TXT Y COLOQUE SOBRE EL ICONO DEL SCRIPT.

SETLOCAL
SET "ARCHIVO=texto.txt"
SET /A "PALABRAS=0"
FOR /F "USEBACKQ TOKENS=*" %%A IN ("%ARCHIVO%") DO (
	SET "LINEA=%%A"
	IF DEFINED LINEA (
		CALL :CONTA LINEA
	)
)

ECHO.CANTIDAD_PALABRAS:%PALABRAS%
PAUSE
ENDLOCAL
GOTO :EOF

:CONTA
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /F "TOKENS=1*" %%B IN ("!%~1!") DO (
SET "PAL=%%B"
SET "RESTO=%%C"
IF DEFINED PAL (SET /A PALABRAS+=1)
IF DEFINED RESTO (CALL :CONTA RESTO)
)
ENDLOCAL & SET /A "PALABRAS=%PALABRAS%"
GOTO :EOF