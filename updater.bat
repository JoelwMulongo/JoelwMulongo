@echo off
REM Initialize the count variable to 0
setlocal EnableDelayedExpansion
set /A count=0

REM Loop through each line in updater.bat and increment the count
for /F "delims=" %%x in (updater.bat) do (
    set /A count += 1
)

REM Subtract 8 from the count
set /A count -= 8

REM Append the count as a comment to updater.bat
echo ::!count! >> updater.bat

REM Stage the changes in updater.bat
git add updater.bat

REM Get the current date in YYYY-MM-DD format
for /F "tokens=2 delims==" %%I in ('"wmic os get localdatetime /value"') do set datetime=%%I
set commitMsg=!datetime:~0,4!-!datetime:~4,2!-!datetime:~6,2!

REM Commit the changes with the formatted date as the message
git commit -m "!commitMsg!"

REM Push the changes to the remote repository
git push
