REM Kill all existing instance of chrome 
taskkill /F /IM chrome.exe /T
REM directory path where chrome.exe is located
set chromeLocation="C:\Program Files (x86)\Google\Chrome\Application"
cd %chromeLocation%
cd c:
start chrome.exe --allow-file-access-from-files