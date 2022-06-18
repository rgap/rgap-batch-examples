@echo off
SETLOCAL ENABLEEXTENSIONS

FOR /F "delims=" %%a in ('output_test.bat') DO (
	set "verfire=%%a"
)

echo %verfire% >> C:\verfirefox.txt

ENDLOCAL
EXIT /B 0