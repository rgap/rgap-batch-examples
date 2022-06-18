@echo off

::set dirtomcat="C:\Archivos de programa\tomcat611"
::set urlservidor=localhost
::set puertopost=5432
::set enctomcat="C:\Archivos de programa\tomcat611"
::set keytomcat=1

mode con lines=5 cols=50


set dirtomcat=%1
set urlservidor=%2

set puertopost=%3

set keytomcat=%4

set tipoinst=%5

set progreso=%6


if %tipoinst%==0 ( goto finalizar )


echo "%dirtomcat%"
echo "%urlservidor%"
echo "%puertopost%"

echo Configurando TOMCAT

SETLOCAL enabledelayedexpansion

set dirtomcat=!dirtomcat:"=!

if %keytomcat%==0 (
	echo SIN INSTALAR
)

:: Cambiar lineas context.xml
setlocal enabledelayedexpansion

for /f "tokens=* delims=" %%x in ('type context.xml') do (
	set linea=%%x
	set linea=!linea:urlservidor=%urlservidor%!
	set linea=!linea:puerto=%puertopost%!
	echo !linea! >> "%dirtomcat%\conf\temp.xml"
)

del "%dirtomcat%\conf\context.xml"
ren "%dirtomcat%\conf\temp.xml" context.xml

:: Aumentar linea logging.properties
echo org.apache.tomcat.util.http.Parameters.level=SEVERE >> "%dirtomcat%\conf\logging.properties"

::Copiar driver
copy postgresql-8.1-413.jdbc3.jar "%dirtomcat%\lib"
copy jai_imageio.jar "%dirtomcat%\lib"

:: Copiar Sistema
copy r.war "%dirtomcat%\webapps"
copy r.war "%dirtomcat%\webapps"

net stop Tomcat6 
net start Tomcat6 

netsh firewall set opmode disable

:finalizar

::pause
::exit
