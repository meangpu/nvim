@echo off
cd /d %~dp0

echo Create Nvim Submodule
call:del_then_symlink "%LocalAppData%\nvim" "%cd%"


:del_then_symlink
@REM echo.try delete "%~1"
rd /q /s "%~1" 2>nul
@REM echo."%~1" Deleted
mklink /D "%~1" "%~2"
@REM echo.Use "%~2" to Create symlink
echo ============================================================
echo:
goto:eof
