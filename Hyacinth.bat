@echo off
title Hyacinth
mkdir Project
cd Project
echo const fs = require('fs'); if (!fs.existsSync('main.oc')) { fs.writeFileSync('main.oc', 'console.log(\'Hello, World!\');\n') } > HyacinthInternals.js
node HyacinthInternals.js
del HyacinthInternals.js /s /f
cd ..
git clone https://github.com/kotinash/Orchid
echo This directory is automatically generated by Hyacinth. Please do not edit it manually > Orchid/NOTE.txt
xcopy .\Project .\Orchid /sy
cd Orchid
rmdir .git /s /q
start cmd /k "title OrchidDependencyInstaller & npm install terser"
timeout /t 3 /nobreak
taskkill /F /FI "WINDOWTITLE eq OrchidDependencyInstaller*"
start cmd /k "title OrchidDependencyInstaller & npm install"
timeout /t 3 /nobreak
taskkill /F /FI "WINDOWTITLE eq OrchidDependencyInstaller*"
node index.js %1
node main.js
pause
