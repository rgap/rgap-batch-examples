@echo off

mode con lines=5 cols=50

:: set dirfirefox=C:\Archivos de programa\firefox6aaa

set dirfirefox=%1

set progreso=%2

SETLOCAL enabledelayedexpansion

set dirfirefox=!dirfirefox:"=!

if "%dirfirefox%"=="0" (
	echo "%dirfirefox%"
	echo SIN INSTALAR
	goto finalizar
) else (
	echo "%dirfirefox%"
	echo Instalando FIREFOX
	Firefox-Setup-3.5.2.exe /S /D=%dirfirefox%
)

:finalizar

::pause
:: exit
