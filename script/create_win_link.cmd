@echo off
:: echo Home Dir: %HOME%
:: echo Current Dir: %cd%
echo Creating emacs config folder soft link, point from user directory to current folder.
:: %AppData% eg: C:\Users\Robin\AppData\Roaming
mklink /J %AppData%\.emacs.d %CD%
pause