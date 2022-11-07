@echo off
:: echo Home Dir: %HOME%
:: echo Current Dir: %cd%
mklink /d %HOME%\.emacs.d %CD%
pause