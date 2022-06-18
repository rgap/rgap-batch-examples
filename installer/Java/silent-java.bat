
@echo off

mode con lines=5 cols=50

:: set dirjava=C:\Archivos de programa\Java\jre16

set dirjava=%1

set progreso=%2

if %dirjava%==0 (
	echo %dirjava%
	echo SIN INSTALAR
	goto finalizar
) else (
	echo %dirjava%
	echo Instalando JAVA
	jre-6u17-windows-i586.exe /s MOZILLA=1 IEXPLORE=1 INSTALLDIR=\"%dirjava%\""
)

:finalizar

::pause
:: exit