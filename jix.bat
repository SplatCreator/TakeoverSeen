@echo off
setlocal enabledelayedexpansion


set "directory=C:\1Energia\Web\ESOIv02\"


set "line_to_add=<script async src='https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-5908571316079556' crossorigin='anonymous'></script>"


for /r "%directory%" %%f in (*.html *.aspx *.aspxc) do (
    powershell -Command "
        $content = Get-Content '%%f' -Raw
        if ($content -match '</body>') {
            $content = $content -replace '(</body>)', '$line_to_add`$1'
            Set-Content '%%f' -Value $content
        }
    "
)

echo Line added to all HTML, ASPX, and ASPXC files.
pause
