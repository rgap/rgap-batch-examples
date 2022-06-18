@echo off
title Division de dos numeros 
set uno=0

if %uno%==0 (goto nosepuede) else (goto dividir)

:nosepuede
echo El denominador no puede ser cero.

:dividir
echo El resultado

pause>nul
exit