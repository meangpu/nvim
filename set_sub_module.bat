@echo off
cd /d %~dp0
echo Create Nvim Symlink

call:create_symlink "%LocalAppData%\nvim" "%cd%"
goto:eof

:create_symlink
echo Removing existing directory if present...
rd /q /s "%~1" 2>nul

echo Ensuring parent directory exists...
for %%I in ("%~1") do set "parent=%%~dpI"
if not exist "%parent%" mkdir "%parent%"

echo Creating symlink...
mklink /D "%~1" "%~2"

echo ============================================================
echo:
goto:eof