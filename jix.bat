@echo off
setlocal enabledelayedexpansion

:: Définir le répertoire contenant les fichiers HTML et ASPX
set "directory=C:\1Energia\Web\ESOIv02\"

:: La ligne à ajouter dans le body
set "line_to_add=<script async src='https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-5908571316079556' crossorigin='anonymous'></script>"

:: Appeler le script PowerShell
powershell -ExecutionPolicy Bypass -File "C:\1Energia\Web\ESOIv02\papamaman\add_script.ps1" -directory "%directory%" -line_to_add "%line_to_add%"

echo Line added to all HTML, ASPX, and ASPXC files.
pause
