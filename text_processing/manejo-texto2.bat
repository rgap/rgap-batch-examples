::Eliminar linea 
::elimina linea 5
(
ECHO 5d
ECHO E
) | EDLIN /B texto.txt > nul 2>&1

::editar linea 2 con texto
(
echo 2
echo textotooo
echo w
echo e
) | edlin /b texto2.txt


pause

exit