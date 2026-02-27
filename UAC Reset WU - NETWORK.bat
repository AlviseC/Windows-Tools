@echo off
:: =================================================================
:: SCRIPT DI MANUTENZIONE - ANGOLO DI WINDOWS
:: Reset Windows Update, Componenti di Rete e Ottimizzazioni TCP
:: =================================================================

:: --- INIZIO BLOCCO AUTO-ELEVAZIONE ---
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Richiesta privilegi di amministratore in corso...
    goto uacPrompt
) else ( goto gotAdmin )

:uacPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%cd%"
    CD /D "%~dp0"
:: --- FINE BLOCCO AUTO-ELEVAZIONE ---

title Reset System - Angolo di Windows
color 0b

echo ===================================================
echo   MANUTENZIONE SISTEMA - ANGOLO DI WINDOWS
echo ===================================================
echo.
echo Questo script resettera i componenti di Windows Update
echo e la configurazione della rete.
echo.
pause

:: --- SEZIONE WINDOWS UPDATE ---
echo.
echo [1/3] Reset Windows Update...
echo Fermo i servizi...
net stop bits /y
net stop wuauserv /y
net stop cryptsvc /y

echo Pulizia cartelle e log di sistema...
if exist "%systemroot%\System32\Catroot2" ren "%systemroot%\System32\Catroot2" "oldcatroot2"
del /f /q "%windir%\WindowsUpdate.log" 2>nul
del /f /s /q "%windir%\SoftwareDistribution\*.*" >nul
del /f /q "%ALLUSERSPROFILE%\Application Data\Microsoft\Network\Downloader\qmgr*.dat" 2>nul
del /f /q "%systemroot%\SoftwareDistribution\DataStore\Logs\edb.log" 2>nul

echo Riavvio i servizi...
net start cryptsvc
net start bits
net start wuauserv

:: --- SEZIONE RETE ---
echo.
echo [2/3] Reset base della rete...
netsh int tcp set heuristics disabled

echo.
echo Vuoi resettare Autotuning e RSS? [S/N]
choice /c SN /m "Scelta:"
if errorlevel 2 goto :skip_auto

echo Eseguo reset Autotuning e RSS...
netsh int tcp set global autotuninglevel=disabled
netsh int tcp set global rss=enabled
goto :next_step

:skip_auto
echo Operazione autotuning saltata.

:next_step
echo.
echo [3/3] Reset profondo della rete...
echo Vuoi procedere con il reset completo (Winsock, IP, DNS)? [S/N]
choice /c SN /m "Scelta:"
if errorlevel 2 goto :fine

echo Eseguo reset completo...
netsh winsock reset
netsh int ip reset
ipconfig /release
ipconfig /renew
ipconfig /flushdns

:fine
echo.
echo ===================================================
echo   OPERAZIONE COMPLETATA!
echo ===================================================
echo Si consiglia vivamente di riavviare il PC.
echo Grazie per aver visitato angolodiwindows.com
echo.
pause
exit