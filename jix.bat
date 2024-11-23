@echo off
setlocal enabledelayedexpansion


set "directory=C:\1Energia\Web\ESOIv02\"


:: La ligne à ajouter dans le body
set "line_to_add=<script async src='https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-5908571316079556' crossorigin='anonymous'></script>"

:: Boucle à travers chaque fichier HTML, ASPX et ASPXC
for /r "%directory%" %%f in (*.html *.aspx *.aspxc) do (
    powershell -Command "
        $content = Get-Content '%%f' -Raw
        if ($content -match '</body>') {
            $content = $content -replace '</body>', '$line_to_add`$&'
            Set-Content '%%f' -Value $content
        }
    "
)

echo Line added to all HTML, ASPX, and ASPXC files.
pause
