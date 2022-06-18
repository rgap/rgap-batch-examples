cls

set urlservidor=localhost
set puerto=8080

setlocal enabledelayedexpansion

for /f "tokens=* delims=" %%x in ('type context.xml') do (
	set linea=%%x
	set linea=!linea:urlservidor=%urlservidor%!
	set linea=!linea:puerto=%puerto%!
	echo !linea! >> temp.xml
)


pause

exit