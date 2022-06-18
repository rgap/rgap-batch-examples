
::insertar texto
> TEXTO.TXT echo "texto nuevo insertado3"

::Agregar lineas a un nuevo texto file.txt

::opcional el echo off
@echo off 
(
echo Linea1
echo Linea2
echo Linea3...
) > "file.txt"

:: insertar a final del texto
echo texto insertado >> "file.txt"

::mostrar text
type file.txt
::otra manera
for /f "tokens=*" %%x in (file.txt) do (
	echo %%x
)

::mostrar numero de lineas (con en blanco)
type file.txt | find /v /c "" < file.txt

::contar lineas en contador
set /a contador=0
for /f "" %%x in (file.txt) do (
	set /a contador+=1
)
echo Lineas : %contador%

::Informacion de archivo

@echo off
for %%- in (file.txt) do (
	echo Nombre : %%~n-
	echo Extension : %%~x-
	echo Unidad : %%~d-
	echo Ruta : %%~p-
	echo Ruta completa : %%~s-
	echo Fecha-Hora del archivo : %%~t-
	echo Atributos : %%~a-
	echo Nombre y extension : %%~nx-
)

echo.
echo.
echo.

::otra manera
call :info info.txt 

:info 
echo Nombre : %~n1
echo Extension : %~x1
echo Unidad : %~d1
echo Ruta : %~p1
echo Ruta completa : %~s1
echo Fecha-Hora del archivo : %~t1
echo Atributos : %~a1
echo Nombre y extension : %~nx1

:: crear archivo vacio
fsutil file createnew abc.txt 0

:: copiar contenido
type texto.txt > texto2.txt

pause

exit