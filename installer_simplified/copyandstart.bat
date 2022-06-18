@echo off
cd c:\
copy c:\CPS-WS.war C:\glassfish\domains\domain1\autodeploy
cd C:\glassfish\bin
asadmin start-domain domain1
pause