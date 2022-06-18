@echo off

mode con lines=5 cols=50

:: set "dirfilez=C:\Archivos de programa\FILEZILLA1"

set dirfilez=%1

set keyfilez=%2

set progreso=%3

SETLOCAL enabledelayedexpansion

set dirfilez=!dirfilez:"=!

if %keyfilez%==0 (
	echo "%dirfilez%"
	
	echo SIN INSTALAR
	goto configurar
)

:configurar

echo CONFIGURAR

TASKKILL /F /IM "FileZilla server.exe" 
TASKKILL  /F /IM "FileZilla Server Interface.exe"

del "%dirfilez%\FileZilla Server Interface.xml"
copy "FileZilla Server Interface.xml" "%dirfilez%"

del "%dirfilez%\FileZilla Server.xml"
copy "FileZilla Server.xml" "%dirfilez%"

