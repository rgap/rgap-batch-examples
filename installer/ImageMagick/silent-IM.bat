@echo off

mode con lines=5 cols=50

set dirIM=%1

set progreso=%2

if %dirIM%==0 (
	echo %dirIM%
	echo SIN INSTALAR
	goto finalizar
) else (
	echo %dirIM%
	echo Instalando IMAGEMAG
	ImageMagick-6.5.2-4-Q16-windows-dll.exe /VERYSILENT /DIR=%dirIM%
)

:finalizar

::pause
:: exit
