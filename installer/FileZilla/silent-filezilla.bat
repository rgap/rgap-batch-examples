
@echo off

mode con lines=5 cols=50

:: set dirfilez=C:\Archivos de programa\FILEZILLA1

set dirfilez=%1

set keyfilez=%2

set progreso=%3

SETLOCAL enabledelayedexpansion

set dirfilez=!dirfilez:"=!

if %keyfilez%==0 (
	echo %dirfilez%
	echo SIN INSTALAR
	goto finalizar
) else (
	echo Instalando FILEZILLA
	FileZilla_Server-0_9_19.exe /S /D=%dirfilez%
)

:finalizar

::pause
:: exit
