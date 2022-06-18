@echo off

mode con lines=5 cols=50

set "neroserial=1A23-9844-2054-3824-9512-7019"

:: set nerodir="C:\Archivos de programa\Nero611"

set nerodir=%1

set progreso=%2

if %nerodir%==0 (
	echo %nerodir%
	echo %neroserial%
	echo SIN INSTALAR
	goto finalizar
) else (
	echo %nerodir%
	echo %neroserial%
	echo Instalando NERO
	start /wait Setupx.exe /silent /noreboot /no_ui /sn=neroserial /write_sn /path=%nerodir%
)

:finalizar

::pause
:: exit



