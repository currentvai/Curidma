@echo off
title Secure Activator
color 0A

set "storedhash=c2be1d5de46e365c5d312899b9d0d09782d13d31ef2f7a844d7c6b3e55be4d60"

echo =============================
echo        Secure Access
echo =============================
echo.

set /p input=Enter Password: 

:: Create temp file
echo %input%>temp.txt

:: Generate SHA256 hash
for /f "skip=1 tokens=*" %%a in ('certutil -hashfile temp.txt SHA256') do (
    set hash=%%a
    goto break
)

:break
del temp.txt

if "%hash%"=="%storedhash%" (
    echo.
    echo Access Granted...
    timeout /t 2 >nul
    start Curidma.cmd
) else (
    echo.
    echo Wrong Password!
    timeout /t 2 >nul
    exit
)