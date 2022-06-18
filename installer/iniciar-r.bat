@echo off

:: set tomcatpuerto=9090
:: set urlservidor=localhost
:: set dirtomcat=C:\Archivos de programa\tomcat6

:: set dirtomcat=%1

:: Reiniciar Servicio
:: call %dirtomcat%\bin\shutdown.bat
:: call %dirtomcat%\bin\startup.bat

mode con lines=5 cols=50


set dirfilez=%1
set urlservidor=%2
set puerto=%3

set tipoinst=%4

setlocal enabledelayedexpansion

echo Iniciando R

set dirfilez=!dirfilez:"=!

START "FileZilla server.exe" "%dirfilez%\FileZilla server.exe"
START "FileZilla Server Interface.exe" "%dirfilez%\FileZilla Server Interface.exe"

setlocal disabledelayedexpansion

:: Cargar Browser

if %tipoinst%==1 ( 
	start http://%urlservidor%:%puerto%/r 
) else ( 
	start http:// 
)




