@echo off
title "Hyacinth | The Orchid build system"
mkdir Project
cd Project
echo const fs = require('fs'); if (!fs.existsSync('main.oc')) { fs.writeFileSync('main.oc', 'console.log(\'Hello, World!\');\n') } > HyacinthInternals.js
node HyacinthInternals.js
del HyacinthInternals.js /s /f
cd ..
git clone https://github.com/kotinash/Orchid
xcopy .\Project .\Orchid /sy
cd Orchid
start cmd /k "title OrchidDependencyInstaller & npm install"
timeout /t 3 /nobreak
taskkill /F /FI "WINDOWTITLE eq OrchidDependencyInstaller*"
npm run release
pause
