@echo off
setlocal enabledelayedexpansion

:: Clear screen
cls

:: Set colors
:: Color syntax: color [background][foreground]
:: Background = 0 (black), 1 (blue), 2 (green), 3 (aqua), 4 (red), 5 (purple), 6 (yellow), 7 (white)
:: Foreground = 0 (black), 1 (blue), 2 (green), 3 (aqua), 4 (red), 5 (purple), 6 (yellow), 7 (white)

:: IP Address
color 0A
echo IP Address:
for /f "tokens=2 delims=:" %%I in ('ipconfig ^| find "IPv4 Address"') do set IP=%%I
echo !IP!
echo.

:: Operating System Info
color 2
echo Operating System Info:
systeminfo | findstr /B /C:"OS Name" /C:"OS Version"
echo.

:: CPU Info
color 2
echo CPU Info:
wmic cpu get caption, deviceid, name, numberofcores, maxclockspeed
echo.

:: Memory Info
color 2
echo Memory Info:
wmic memorychip get capacity, speed, devicelocator
echo.

:: Disk Info
color 2
echo Disk Info:
wmic diskdrive get caption, deviceid, model, size
echo.

:: BIOS Info
color 2
echo BIOS Info:
wmic bios get manufacturer, smbiosbiosversion, releasedate
echo.

:: Baseboard Info
color 2
echo Baseboard Info:
wmic baseboard get product, manufacturer, serialnumber
echo.

:: Network Adapter Info
color 3
echo Network Adapter Info:
wmic nic get caption, macaddress, speed
echo.

:: User Accounts Info
color 4
echo User Accounts Info:
net user
echo.

:: System Configuration
color 5
echo System Configuration:
systeminfo | findstr /B /C:"System Manufacturer" /C:"System Model" /C:"System Type"
echo.

:: Installed Software
color 6
echo Installed Software:
wmic product get name, version
echo.

:: Services Info
color 7
echo Services Info:
sc query
echo.

:: Reset color and Pause to view output
color 7
pause
