:: comentario

@echo off

cls

echo Ingrese a o b

:: set var= 45
set /p var= 

echo Se tiene var = %var%

if %var% == a (
	goto A
)
if %var% == b (
	goto B
)

goto C

:A

echo Entro a A

pause
exit

:B

echo Entro a B

pause
exit

:C

echo Valor desconocido Entro a C

pause
exit