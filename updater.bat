@echo off

set /A count=0
FOR /F %%x in (updater.bat) DO set /A count += 1
set /A count -= 8 
echo ::%count% >> updater.bat 
git add updater.bat
git commit -m "%date%"
git push