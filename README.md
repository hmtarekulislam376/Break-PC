# Windows Sandbox Stress Test - Persistent Break PC

## ⚠️ WARNING - FOR SANDBOX USE ONLY ⚠️

This tool is designed **exclusively** for testing Windows Sandbox's resilience against resource exhaustion and persistence mechanisms. **DO NOT RUN ON A REAL PRODUCTION SYSTEM OR PERSONAL MACHINE.**

## What It Does

- **Break PC**: Recursively spawns multiple instances of itself, consuming all available CPU cores.
- **Memory Exhaustion**: Allocates large environment variables repeatedly (~100MB per loop) to fill RAM.
- **Persistence**: Adds itself to the Windows Registry Run key (`HKCU\Software\Microsoft\Windows\CurrentVersion\Run`) so it automatically launches on every user login.
- **Startup Folder Redundancy** (optional): Copies the script to `%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup`.

## Files Included

- `BreakPC.bat` - Main script (choose version A or B)

## How to Test Inside Windows Sandbox

1. Enable Windows Sandbox (Windows Pro/Enterprise):
   - Go to "Turn Windows features on or off"
   - Check "Windows Sandbox"
   - Restart.

2. Launch Windows Sandbox from Start Menu.

3. Copy the `.bat` script into the sandbox (e.g., via shared clipboard or drag-and-drop).

4. **Open a command prompt as administrator** (recommended for easier process termination later).

5. Run the script:
   ```cmd
   BreakPC.bat
