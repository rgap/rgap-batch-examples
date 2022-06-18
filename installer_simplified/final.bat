call SetPaths.bat
cd c:\
Java -Xmx256m -jar glassfish-installer-v2ur2-b04-windows.jar
cd C:\glassfish\lib\ant\bin
ant -f C:\glassfish\setup.xml
pause