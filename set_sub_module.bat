@echo off
cd /d %~dp0
echo Create Nvim Symlink

call:create_symlink "%LocalAppData%\nvim" "%cd%"

:create_symlink
echo Removing existing directory if present...
rd /q /s "%~1" 2>nul

echo Creating symlink...
mklink /D "%~1" "%~2"

echo ============================================================
echo:
goto:eof