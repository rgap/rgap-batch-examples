@echo off

::set dirtomcat="C:\Archivos de programa\tomcat611"
::set tomcatpuerto=9092
::set keytomcat=1

mode con lines=5 cols=50

set dirtomcat=%1
set tomcatpuerto=%2

set keytomcat=%3

set tipoinst=%4

set progreso=%5

if %tipoinst%==0 ( goto finalizar )

SETLOCAL enabledelayedexpansion

set dirtomcat=!dirtomcat:"=!

if %keytomcat%==1 (
	:: SetEnv -a JAVA_HOME "%dirjava%"
	:: SetEnv -a CATALINA_HOME "%dirtomcat%"
	
	echo "%dirtomcat%"
	echo Instalando Tomcat
	
	apache-tomcat-6.0.35.exe /S /D=%dirtomcat%
	
	goto cambiartomcat
) else (
	goto finalizar
)

:cambiartomcat

:: Copiar server.xml
del "%dirtomcat%\conf\server.xml" 
type server.xml >> "%dirtomcat%\conf\server.xml"

setlocal enabledelayedexpansion

:: Cambiar puerto y URIEncoding="UTF-8"
set dirtomcatcom="%dirtomcat%"
for /f "tokens=* delims=" %%x in ('type %dirtomcatcom%\conf\server.xml') do (
	set linea=%%x
	set linea=!linea:8080=%tomcatpuerto%!
	echo !linea! >> "%dirtomcat%\conf\temp.xml"
	cls
)

del "%dirtomcat%\conf\server.xml"
ren "%dirtomcat%\conf\temp.xml" server.xml

:finalizar

::pause
:: exit