@echo off
chcp 65001 >nul
title Anomaly Launcher
mode con: cols=75 lines=20
cls

:: === НАСТРОЙКИ ===
set "GAME_DIR=E:\Games\Anomaly 1.5.3"
set "MODS_DIR=%GAME_DIR%\MODS"
set "LAUNCHER=%GAME_DIR%\AnomalyLauncher.exe"
set "JSGME=%GAME_DIR%\JSGME.exe"

color 0A
echo ╔══════════════════════════════════════════════════════════════════════╗
echo ║                                                                      ║
echo ║   █▀█ █▄░█ █▀█ █▀▄▀█ ▄▀█ █░░ █▄█  █░░ ▄▀█ █░█ █▄░█ █▀▀ █░█ █▀▀ █▀█   ║
echo ║   █▀█ █░▀█ █▄█ █░▀░█ █▀█ █▄▄ ░█░  █▄▄ █▀█ █▄█ █░▀█ █▄▄ █▀█ ██▄ █▀▄   ║
echo ║                                                                      ║
echo ╠══════════════════════════════════════════════════════════════════════╣
echo ║   Anomaly v1.5.3 and Generic Mod Enabler v2.6.0.157                  ║
echo ║   Select script by Sm1thZe                                           ║
echo ╚══════════════════════════════════════════════════════════════════════╝
echo    [1] Anomaly Launcher                                         
echo    [2] JSGME                                                    
echo    [3] Game Folder                                              
echo    [4] MODS Folder                                              
echo    [5] ModDB                                                   
echo    [0] Exit                                                     
color 07
echo.

choice /c 123450 /n /m "Select: "

if errorlevel 6 goto end
if errorlevel 5 goto link_moddb
if errorlevel 4 goto folder_mods
if errorlevel 3 goto folder_game
if errorlevel 2 goto file2
if errorlevel 1 goto file1

:file1
if not exist "%LAUNCHER%" (
    echo [Error] Not found AnomalyLauncher.exe
    pause
    goto end
)
start "" "%LAUNCHER%"
goto end

:file2
if not exist "%JSGME%" (
    echo [Error] Not found JSGME.exe
    pause
    goto end
)
start "" "%JSGME%"
goto end

:folder_game
if not exist "%GAME_DIR%" (
    echo [Error] Folder not found: %GAME_DIR%
    pause
    goto end
)
start "" "%GAME_DIR%"
goto end

:folder_mods
if not exist "%MODS_DIR%" (
    echo [Error] Folder MODS not found: %MODS_DIR%
    pause
    goto end
)
echo Open mods folder...
start "" "%MODS_DIR%"
goto end

:link_moddb
start "" "https://www.moddb.com/mods/stalker-anomaly"
goto end

:end
exit