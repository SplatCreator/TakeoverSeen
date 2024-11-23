@echo off
setlocal enabledelayedexpansion

set "search=<li><span class=\"icon icon-map-marker\"></span><span class=\"text\">Registered Office: Singapore<br />Head Office: Mumbai, India </span></li>"
set "replace=<li><span class=\"icon icon-map-marker\"></span><span class=\"text\">Registered Office: Singapore<br />Head Office: Mumbai, India </span></li><script async src=\"https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-5908571316079556\"  crossorigin=\"anonymous\"></script>"
set "folderPath= C:\1Energia\Web\ESOIv02\"
set "tempFile=%TEMP%\tempfile.txt"

rem Parcourir tous les fichiers .html, .php, et .aspx dans le dossier et sous-dossiers
for /r "%folderPath%" %%f in (*.html *.php *.aspx) do (
    rem Lire chaque fichier et effectuer le remplacement
    (for /f "tokens=*" %%a in ('type "%%f"') do (
        set "line=%%a"
        set "line=!line:%search%=%replace%!"
        echo(!line!
    )) > "%tempFile%"
    rem Remplacer le fichier original par le fichier temporaire
    move /y "%tempFile%" "%%f" >nul
)

endlocal
echo Remplacement terminé.
