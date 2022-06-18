@echo off

:: set puertopost=5432
:: set dirpost=C:\Archivos de programa\PostgreSQL\PostgreSQL8

mode con lines=5 cols=50

set dirpost=%1
set puertopost=%2

set keypost=%3

set tipoinst=%4

set progreso=%5

if tipoinst==0 ( goto finalizar )

set Nomus=postgres
set Contus=postgres
set serv-account=postgres
set serv-pass=postgres

:: set servidorftp

set nomservicio=postgres8.1
set encoding=UTF8

SETLOCAL enabledelayedexpansion

set dirpost=!dirpost:"=!

if %keypost%==0 (
	echo "%dirpost%"
	echo SIN INSTALAR
	
	goto configurar
) else (
	echo "%dirpost%"
	echo Instalando Postgres

	NET USER postgres /DEL
	
	rmdir /s /q "%dirpost%"
	
	msiexec.exe /i "postgresql-8.1-int.msi" /qn INTERNALLAUNCH=1 ADDLOCAL=server,psql,pgadmin,psqlodbc CREATESERVICEUSER=1 SERVICEDOMAIN="%COMPUTERNAME%" SERVICEACCOUNT="%serv-account%" SERVICEPASSWORD="%serv-pass%" SERVICENAME="%nomservicio%" SUPERUSER="%Nomus%" SUPERPASSWORD="%Contus%" ENCODING="%encoding%" LISTENPORT=%puertopost% BASEDIR="%dirpost%" DATADIR="%dirpost%\data"
	
	goto configurar
)

:configurar

SET PGPASSWORD=postgres
MKDIR "%dirpost%\data\pg_tblspc\tablespace_r"

set dirpostabs=!dirpost:\=/!

"%dirpost%\bin\psql.exe" -h localhost -p %puertopost% -U postgres postgres -c "CREATE TABLESPACE tablespace_r OWNER postgres LOCATION '%dirpostabs%/data/pg_tblspc/tablespace_r';"
"%dirpost%\bin\psql.exe" -h localhost -p %puertopost% -U postgres postgres -c "CREATE DATABASE r WITH OWNER postgres ENCODING 'UTF8' TABLESPACE tablespace_r;"

"%dirpost%\bin\psql.exe" -h localhost -p %puertopost% -U postgres -d r -f "crearr.sql"

:finalizar

:: pause
:: exit